data "google_service_account" "iac" {
  account_id = var.iac_service_account
}

resource "google_iam_workload_identity_pool" "tbd-workload-identity-pool" {
  workload_identity_pool_id = "github-actions-pool"
}

resource "google_iam_workload_identity_pool_provider" "tbd-workload-identity-provider" {
  workload_identity_pool_id          = google_iam_workload_identity_pool.tbd-workload-identity-pool.workload_identity_pool_id
  workload_identity_pool_provider_id = "github-actions-provider"
  display_name                       = "GitHub provider"
  description                        = "GitHub identity pool provider for CI/CD purposes"
  attribute_mapping = {
    "google.subject" : "assertion.sub"
    "attribute.repository" : "assertion.repository"
    "attribute.org"  = "assertion.repository_owner"
    "attribute.refs" = "assertion.ref"
  }
  attribute_condition = "attribute.org == \"${var.github_org}\""
  oidc {
    issuer_uri = "https://token.actions.githubusercontent.com"
  }
}

resource "google_service_account_iam_member" "tbd-sa-workload-identity-iam" {
  role               = "roles/iam.workloadIdentityUser"
  service_account_id = data.google_service_account.iac.name
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.tbd-workload-identity-pool.name}/attribute.repository/${var.github_org}/${var.github_repo}"
}

# new (a)
variable "master_machine_type" {
  description = "Typ maszyny dla węzła głównego"
  type        = string
  default     = "n1-standard-2" # Domyślny typ maszyny
}

variable "worker_machine_type" {
  description = "Typ maszyny dla węzłów roboczych"
  type        = string
  default     = "n1-standard-2" # Domyślny typ maszyny worker
}

variable "worker_node_count" {
  description = "Liczba węzłów roboczych"
  type        = number
  default     = 2 # Domyślna liczba węzłów roboczych
}

variable "master_disk_size_gb" {
  description = "Rozmiar dysku dla węzła głównego w GB"
  type        = number
  default     = 50 # Domyślny rozmiar dysku dla węzła głównego
}

variable "worker_disk_size_gb" {
  description = "Rozmiar dysku dla węzłów roboczych w GB"
  type        = number
  default     = 50 # Domyślny rozmiar dysku dla węzłów roboczych
}

resource "google_dataproc_cluster" "dataproc_cluster" {
  name   = "tbd-cluster"
  region = "europe-west1"

  cluster_config {

    gce_cluster_config {
      internal_ip_only = true
    }

    encryption_config {
      kms_key_name = "SecretSquirrel"
    }

    master_config {
      num_instances = 1
      machine_type  = var.master_machine_type

      disk_config {
        boot_disk_size_gb = var.master_disk_size_gb # Ustawienie rozmiaru dysku dla węzła głównego
      }
    }

    worker_config {
      num_instances = var.worker_node_count
      machine_type  = var.worker_machine_type

      disk_config {
        boot_disk_size_gb = var.worker_disk_size_gb # Ustawienie rozmiaru dysku dla węzłów roboczych
      }
    }

    preemptible_worker_config {
      num_instances = var.preemptible_worker_count

      disk_config {
        boot_disk_size_gb = var.worker_disk_size_gb # Ustawienie rozmiaru dysku dla węzłów preemptible
      }
    }
  }
}

# b


