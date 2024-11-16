# cicd_bootstrap

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 5.44.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | ~> 5.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_dataproc_cluster.dataproc_cluster](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dataproc_cluster) | resource |
| [google_iam_workload_identity_pool.tbd-workload-identity-pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool) | resource |
| [google_iam_workload_identity_pool_provider.tbd-workload-identity-provider](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/iam_workload_identity_pool_provider) | resource |
| [google_service_account_iam_member.tbd-sa-workload-identity-iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_service_account.iac](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/service_account) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_org"></a> [github\_org](#input\_github\_org) | GitHub organisation | `string` | `"SpartaqS"` | no |
| <a name="input_github_repo"></a> [github\_repo](#input\_github\_repo) | GitHub repository | `string` | `"tbd-workshop-1"` | no |
| <a name="input_iac_service_account"></a> [iac\_service\_account](#input\_iac\_service\_account) | Service account to be used with CI/CD workload identity | `string` | `"tbd-2024zz-300364-lab@tbd-2024zz-300364.iam.gserviceaccount.com"` | no |
| <a name="input_master_disk_size_gb"></a> [master\_disk\_size\_gb](#input\_master\_disk\_size\_gb) | Rozmiar dysku dla węzła głównego w GB | `number` | `50` | no |
| <a name="input_master_machine_type"></a> [master\_machine\_type](#input\_master\_machine\_type) | Typ maszyny dla węzła głównego | `string` | `"n1-standard-2"` | no |
| <a name="input_preemptible_worker_count"></a> [preemptible\_worker\_count](#input\_preemptible\_worker\_count) | Liczba węzłów preemptible (spot) w klastrze Dataproc | `number` | `2` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name | `string` | `"tbd-2024zz-300364"` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region | `string` | `"europe-west1"` | no |
| <a name="input_worker_disk_size_gb"></a> [worker\_disk\_size\_gb](#input\_worker\_disk\_size\_gb) | Rozmiar dysku dla węzłów roboczych w GB | `number` | `50` | no |
| <a name="input_worker_machine_type"></a> [worker\_machine\_type](#input\_worker\_machine\_type) | Typ maszyny dla węzłów roboczych | `string` | `"n1-standard-2"` | no |
| <a name="input_worker_node_count"></a> [worker\_node\_count](#input\_worker\_node\_count) | Liczba węzłów roboczych | `number` | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_service_account"></a> [service\_account](#output\_service\_account) | n/a |
| <a name="output_workload_identity_provider"></a> [workload\_identity\_provider](#output\_workload\_identity\_provider) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
