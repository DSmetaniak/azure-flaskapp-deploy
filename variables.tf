/////////////////////////////// Basic Variable /////////////////////////////////

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
}

variable "prefix" {
  description = "Prefix for all resources"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

/////////////////////////////// Backup Variable /////////////////////////////////
variable "backup_frequency" {
  description = "Backup frequency"
  type        = string
  default     = "Daily"
}

variable "backup_time" {
  description = "Backup execution time"
  type        = string
  default     = "00:00"
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 7
}

variable "type_sku" {
  description = "Typo of sku in recovery services vault"
  type        = string
  default     = "Standard"
}

/////////////////////////////// VNet Variable /////////////////////////////////

variable "nsg_ssh_priority" {
  description = "Priority of the SSH rule in the NSG"
  type        = number
  default     = 1001
}

variable "nsg_http_priority" {
  description = "Priority of the HTTP/HTTPS rule in the NSG"
  type        = number
  default     = 1002
}

/////////////////////////////// DNS Variable /////////////////////////////////

variable "my_ip" {
  description = "Your public IP address for SSH access"
  type        = string
}

variable "domain_name" {
  description = "The custom domain name"
  type        = string
}

/////////////////////////////// Monitoring Variable /////////////////////////////////

variable "cpu_alert_threshold" {
  description = "CPU usage threshold for alerts"
  type        = number
  default     = 80
}

variable "log_retention_days" {
  description = "Retention period for log analytics workspace"
  type        = number
  default     = 30
}

variable "short_name" {
  description = "Short name fo alert"
  type        = string
  default     = "webalert"
}

variable "email_receiver_name" {
  description = "Name of email receiver"
  type        = string
}

variable "email_receiver_address" {
  description = "Email address of receiver"
  type        = string
}

/////////////////////////////// VM Variable /////////////////////////////////

variable "vm_size" {
  description = "Azure VM size"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
