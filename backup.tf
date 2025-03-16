# Configure Azure Backup
resource "azurerm_recovery_services_vault" "backup_vault" {
  name                = "webapp-backup-vault"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
}

resource "azurerm_backup_protected_vm" "vm_backup" {
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.backup_vault.name
  source_vm_id        = azurerm_linux_virtual_machine.vm.id
  backup_policy_id    = azurerm_backup_policy_vm.default.id
}

resource "azurerm_backup_policy_vm" "default" {
  name                = "default-backup-policy"
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.backup_vault.name

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 7
  }
}

output "monitoring_workspace_id" {
  value = azurerm_log_analytics_workspace.monitoring_workspace.id
}

output "backup_vault_id" {
  value = azurerm_recovery_services_vault.backup_vault.id
}