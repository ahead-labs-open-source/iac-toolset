variable "resource_types" {
  type = map(any)
  default = {
    # Application Insights
    appi = {
      name = "Application Insights"
      tag  = "appi"
    }

    # App Configuration
    appconf = {
      name = "App configuration"
      tag  = "appconf"
    }

    # App Registration (no official abbreviation)
    appreg = {
      name = "App registration"
      tag  = "appreg"
    }

    # Azure Container Apps
    ca = {
      name = "Container Apps"
      tag  = "ca"
    }

    # Azure Container Apps Environment
    cae = {
      name = "Container Environment"
      tag  = "cae"
    }

    # Azure Cosmos DB
    cosmos = {
      name = "Cosmos DB"
      tag  = "cosmos"
    }

    # Azure Container Registry
    cr = {
      name = "Container Registry"
      tag  = "cr"
    }

    # Azure Data Factory
    df = {
      name = "Data Factory"
      tag  = "adf"
    }

    # Azure DNS
    dns = {
      name = "DNS"
      tag  = "dns"
    }

    # Azure Event Grid Subscriptions
    evgs = {
      name = "Event Grid Subscriptions"
      tag  = "evgs"
    }

    # Azure Event Hubs
    evh = {
      name = "Event Hubs"
      tag  = "evh"
    }

    # Azure Functions
    func = {
      name = "Functions"
      tag  = "func"
    }

    # Grafana (no official abbreviation)
    grafana = {
      name = "Grafana"
      tag  = "grafana"
    }

    # Azure API Management
    apim = {
      name = "API Management"
      tag  = "apim"
    }

    # Generic API (no official resource type)
    api = {
      name = "API"
      tag  = "api"
    }

    # Azure AI Services
    aiservices = {
      name = "AI Services"
      tag  = "ais"
    }

    # OpenAI Services
    openai = {
      name = "Open AI"
      tag  = "oai"
    }

    # Azure Key Vault
    kv = {
      name = "Key vault"
      tag  = "kv"
    }

    # Azure Logic Apps
    logic = {
      name = "Logic Apps"
      tag  = "logic"
    }

    # Azure Log Analytics Workspace
    law = {
      name = "Log Analytics Workspace"
      tag  = "law"
    }

    # Azure MySQL Flexible Server
    mysql = {
      name = "MySQL DB flexible server"
      tag  = "mysql"
    }

    # Azure Queue Service
    queue = {
      name = "Queue service"
      tag  = "queue"
    }

    # Azure Resource Group
    rg = {
      name = "Resource group"
      tag  = "rg"
    }

    # Azure Static Web App
    stapp = {
      name = "Static Web App"
      tag  = "stapp"
    }

    # Azure Storage Account
    st = {
      name = "Storage account"
      tag  = "st"
    }

    # Azure Table Storage
    table = {
      name = "Table storage"
      tag  = "costab"
    }

    # Azure Virtual Network
    vnet = {
      name = "VNET"
      tag  = "vnet"
    }

    # Azure Subnet
    subnet = {
      name = "Subnet"
      tag  = "subnet"
    }
  }
}

output "resource_types" {
  value = var.resource_types
}
