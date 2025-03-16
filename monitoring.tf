# Enable Azure Monitor
resource "azurerm_monitor_diagnostic_setting" "vm_diagnostics" {
  name                       = "${var.prefix}-vm-monitoring"
  target_resource_id         = azurerm_linux_virtual_machine.vm.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.monitoring_workspace.id

  metric {
    category = "AllMetrics"
  }
}

resource "azurerm_log_analytics_workspace" "monitoring_workspace" {
  name                = "${var.prefix}-log-workspace"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.log_retention_days
}

# Create an Alert Rule for High CPU Usage
resource "azurerm_monitor_metric_alert" "high_cpu_alert" {
  name                = "${var.prefix}-high-cpu-alert"
  resource_group_name = var.resource_group_name
  scopes              = [azurerm_linux_virtual_machine.vm.id]
  description         = "Triggers when CPU usage exceeds 80%."
  severity            = 2

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.cpu_alert_threshold
  }

  action {
    action_group_id = azurerm_monitor_action_group.alert_group.id
  }
}

resource "azurerm_monitor_action_group" "alert_group" {
  name                = "${var.prefix}-alert-group"
  resource_group_name = var.resource_group_name
  short_name          = var.short_name

  email_receiver {
    name          = var.email_receiver_name
    email_address = var.email_receiver_address
  }
}
