data "azuredevops_project" "tfexample" {
  name = "first-Project"
}

resource "azuredevops_serviceendpoint_github" "serviceendpoint" {
  project_id            = data.azuredevops_project.tfexample.id
  service_endpoint_name = "resource_manager"

  auth_personal {
    personal_access_token = var.accesstokengit
  }
}

resource "azuredevops_build_definition" "build-example" {
  project_id      = data.azuredevops_project.tfexample.id
  name            = "terraform-pipeline"
  agent_pool_name = "my-agent"

  ci_trigger {
    use_yaml = true
  }

  schedules {
    branch_filter {
      include = ["master"]
      exclude = ["developer", "test"]
    }
    days_to_build              = ["Mon", "Wed", "Sun"]
    schedule_only_with_changes = true
  }

  repository {
    repo_type             = var.repotype
    repo_id               = var.repoid
    branch_name           = var.branchname
    yml_path              = var.ymlpath
    service_connection_id = azuredevops_serviceendpoint_github.serviceendpoint.id
  }


}