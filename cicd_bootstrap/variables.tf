variable "project_name" {
  type        = string
  description = "Project name"
  default     = "tbd-2024zz-300364"
}

variable "region" {
  type        = string
  default     = "europe-west1"
  description = "GCP region"
}

# new (a)
variable "github_org" {
  description = "GitHub organisation"
  type        = string
  default     = "SpartaqS"
}

variable "github_repo" {
  description = "GitHub repository"
  type        = string
  default     = "tbd-workshop-1"
}

variable "iac_service_account" {
  description = "Service account to be used with CI/CD workload identity"
  type        = string
  default     = "tbd-2024zz-300364-lab@tbd-2024zz-300364.iam.gserviceaccount.com"
}

# b
variable "preemptible_worker_count" {
  description = "Liczba węzłów preemptible (spot) w klastrze Dataproc"
  type        = number
  default     = 2 # Domyślna liczba węzłów preemptible
}