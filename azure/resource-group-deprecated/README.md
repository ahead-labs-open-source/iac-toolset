# Azure Resource Group Module

## Description
This module creates an Azure Resource Group using the Ahead Labs naming convention.

## Usage
```hcl
module "resource_group" {
  source       = "github.com/ahead-labs-open-source/iac-toolset//azure/resource-group"
  name_prefix  = "abc"
  location     = "westeurope"
  environment  = "dev"
  instance     = "01"
  tags = {
    environment = "dev"
    project     = "example"
  }
}
```

## Inputs
| Name          | Type        | Description                       |
|---------------|-------------|-----------------------------------|
| name_prefix   | string      | Prefix for naming.                |
| location      | string      | Azure region.                     |
| environment   | string      | Environment (dev, test, prod).     |
| instance      | string      | Resource instance ID.             |
| tags          | map(string) | Tags to associate with resources. |

## Outputs
| Name                 | Description                  |
|----------------------|------------------------------|
| resource_group_id     | ID of the resource group.     |
| resource_group_name   | Name of the resource group.   |

## Requirements
- Terraform >= 1.5
- Provider azurerm >= 3.0

---
