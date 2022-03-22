data "azurerm_client_config" "current" {}

data "azurerm_virtual_network" "stamp" {
  name                = local.vnet_name
  resource_group_name = local.vnet_resource_group_name
}

data "azurerm_cosmosdb_account" "global" {
  name                = var.cosmosdb_account_name
  resource_group_name = var.global_resource_group_name
}

data "azurerm_redis_enterprise_cluster" "global" {
  name                = var.global_redis_name
  resource_group_name = var.global_resource_group_name
}

data "azurerm_container_registry" "global" {
  name                = var.acr_name
  resource_group_name = var.global_resource_group_name
}

data "azurerm_log_analytics_workspace" "stamp" {
  name                = "${local.global_resource_prefix}-${local.location_short}-log"
  resource_group_name = var.monitoring_resource_group_name
}

data "azurerm_application_insights" "stamp" {
  name                = "${local.global_resource_prefix}-${local.location_short}-appi"
  resource_group_name = var.monitoring_resource_group_name
}

data "azurerm_storage_account" "global" {
  name                = var.global_storage_account_name
  resource_group_name = var.global_resource_group_name
}

data "azurerm_resource_group" "buildagent" {
  name = "${var.prefix}-buildinfra-rg"
}

data "azurerm_virtual_network" "buildagent" {
  name                = "${var.prefix}buildinfra-vnet"
  resource_group_name = data.azurerm_resource_group.buildagent.name
}