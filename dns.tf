resource "azurerm_dns_zone" "webapp_dns" {
  name                = var.domain_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_dns_a_record" "webapp_dns_record" {
  name                = "@"
  zone_name           = azurerm_dns_zone.webapp_dns.name
  resource_group_name = var.resource_group_name
  ttl                 = 3600
  records             = [azurerm_public_ip.vm_public_ip.ip_address]
}