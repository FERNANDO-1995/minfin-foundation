remote_state {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg-tfstate-dev"
    storage_account_name = "saminfinstate029"
    container_name       = "terraform"
    key                  = "minfin-foundation/${path_relative_to_include()}/terraform.tfstate"
  }
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "azurerm" {}
    }
  EOF
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    provider "azurerm" {
      features {}
      subscription_id = "50cfe5ab-f277-4e2c-9be6-8aa77309ad55"
    }
  EOF
}




