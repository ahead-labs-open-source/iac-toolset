variable "resource_types" {
  type = map(any)
  default = {
    # Azure Front Door (Standard/Premium) - Microsoft.Cdn/profiles
    afd = {
      name = "Front Door"
      tag  = "afd"
    }

    # Azure AI Services (multi-service account) - Microsoft.CognitiveServices/accounts
    ais = {
      name = "AI Services"
      tag  = "ais"
    }

    # Azure Managed Grafana - Microsoft.Dashboard/grafana
    amg = {
      name = "Azure Managed Grafana"
      tag  = "amg"
    }

    # Generic API (sub-resource of API Management, no official resource type)
    api = {
      name = "API"
      tag  = "api"
    }

    # Azure API Management - Microsoft.ApiManagement/service
    apim = {
      name = "API Management"
      tag  = "apim"
    }

    # Web App - Microsoft.Web/sites
    app = {
      name = "Web App"
      tag  = "app"
    }

    # App Configuration Store - Microsoft.AppConfiguration/configurationStores
    appcs = {
      name = "App Configuration"
      tag  = "appcs"
    }

    # Application Insights - Microsoft.Insights/components
    appi = {
      name = "Application Insights"
      tag  = "appi"
    }

    # App Registration (Entra ID, no official Azure ARM abbreviation)
    appreg = {
      name = "App Registration"
      tag  = "appreg"
    }

    # Backup Vault - Microsoft.DataProtection/backupVaults
    bvault = {
      name = "Backup Vault"
      tag  = "bvault"
    }

    # Container Apps - Microsoft.App/containerApps
    ca = {
      name = "Container Apps"
      tag  = "ca"
    }

    # Container Apps Environment - Microsoft.App/managedEnvironments
    cae = {
      name = "Container Apps Environment"
      tag  = "cae"
    }

    # Azure Cosmos DB - Microsoft.DocumentDB/databaseAccounts
    cosmos = {
      name = "Cosmos DB"
      tag  = "cosmos"
    }

    # Container Registry - Microsoft.ContainerRegistry/registries
    cr = {
      name = "Container Registry"
      tag  = "cr"
    }

    # Azure Data Factory - Microsoft.DataFactory/factories
    df = {
      name = "Data Factory"
      tag  = "adf"
    }

    # DNS Zone - Microsoft.Network/dnsZones
    dns = {
      name = "DNS Zone"
      tag  = "dns"
    }

    # Event Grid Subscription - Microsoft.EventGrid/eventSubscriptions
    evgs = {
      name = "Event Grid Subscription"
      tag  = "evgs"
    }

    # Event Grid Topic - Microsoft.EventGrid/domains/topics
    evgt = {
      name = "Event Grid Topic"
      tag  = "evgt"
    }

    # Event Hub - Microsoft.EventHub/namespaces/eventHubs
    evh = {
      name = "Event Hub"
      tag  = "evh"
    }

    # Function App - Microsoft.Web/sites
    func = {
      name = "Function App"
      tag  = "func"
    }

    # Key Vault - Microsoft.KeyVault/vaults
    kv = {
      name = "Key Vault"
      tag  = "kv"
    }

    # Log Analytics Workspace - Microsoft.OperationalInsights/workspaces
    log = {
      name = "Log Analytics Workspace"
      tag  = "log"
    }

    # Logic App - Microsoft.Logic/workflows
    logic = {
      name = "Logic App"
      tag  = "logic"
    }

    # MySQL Flexible Server - Microsoft.DBforMySQL/servers
    mysql = {
      name = "MySQL Flexible Server"
      tag  = "mysql"
    }

    # MySQL Database - Microsoft.DBforMySQL/servers/databases (Ahead Labs extension)
    mysqldb = {
      name = "MySQL Database"
      tag  = "mysqldb"
    }

    # Network Security Group - Microsoft.Network/networkSecurityGroups
    nsg = {
      name = "Network Security Group"
      tag  = "nsg"
    }

    # Azure OpenAI Service - Microsoft.CognitiveServices/accounts (kind: OpenAI)
    oai = {
      name = "Azure OpenAI Service"
      tag  = "oai"
    }

    # Public IP Address - Microsoft.Network/publicIPAddresses
    pip = {
      name = "Public IP Address"
      tag  = "pip"
    }

    # Storage Queue (sub-resource of Storage Account)
    queue = {
      name = "Storage Queue"
      tag  = "queue"
    }

    # Resource Group - Microsoft.Resources/resourceGroups
    rg = {
      name = "Resource Group"
      tag  = "rg"
    }

    # File Share - Microsoft.Storage/storageAccounts/fileServices/shares
    share = {
      name = "File Share"
      tag  = "share"
    }

    # Subnet - Microsoft.Network/virtualNetworks/subnets
    snet = {
      name = "Subnet"
      tag  = "snet"
    }

    # Storage Account - Microsoft.Storage/storageAccounts
    st = {
      name = "Storage Account"
      tag  = "st"
    }

    # Static Web App - Microsoft.Web/staticSites
    stapp = {
      name = "Static Web App"
      tag  = "stapp"
    }

    # Storage Table (sub-resource of Storage Account)
    table = {
      name = "Storage Table"
      tag  = "table"
    }

    # Virtual Network - Microsoft.Network/virtualNetworks
    vnet = {
      name = "Virtual Network"
      tag  = "vnet"
    }
  }
}

output "resource_types" {
  value = var.resource_types
}
