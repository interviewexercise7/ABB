terraform {
    required_providers {
      azurerm = {
        source  = "hashicorp/azurerm"
        version = "~>3.0"
      }
    }
  }
  
  provider "azurerm" {
    features {}
  }
  
  # Resource Group
  resource "azurerm_resource_group" "rg" {
    name     = "DeepsLab"
    location = "eastus"
  }
  
  # Log Analytics Workspace
  resource "azurerm_log_analytics_workspace" "log_workspace" {
    name                = "log-workspace"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    sku                 = "PerGB2018"
    retention_in_days   = 30
  }
  
  # AKS Cluster
  resource "azurerm_kubernetes_cluster" "aks" {
    name                = "gfg-aks"
    location            = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
    dns_prefix          = "gfgaks"
  
    default_node_pool {
      name       = "default"
      node_count = 1
      vm_size    = "Standard_D2_v2"
    }
  
    identity {
      type = "SystemAssigned"
    }
  }
  
  # Diagnostic Setting for AKS to Log Analytics Workspace
  resource "azurerm_monitor_diagnostic_setting" "aks_diagnostic" {
    name                       = "aks-diagnostic"
    target_resource_id         = azurerm_kubernetes_cluster.aks.id
    log_analytics_workspace_id = azurerm_log_analytics_workspace.log_workspace.id
  
    log {
      category = "kube-apiserver"
      enabled  = true
    }
  
    log {
      category = "kube-controller-manager"
      enabled  = true
    }
  
    log {
      category = "cluster-autoscaler"
      enabled  = true
    }
  
    log {
      category = "kube-scheduler"
      enabled  = true
    }
  
    log {
      category = "kube-audit"
      enabled  = true
    }
  
    metric {
      category = "AllMetrics"
      enabled  = true
    }
  }
  