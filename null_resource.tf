resource "null_resource" "install_certbot" {
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "azureuser"
      private_key = file("~/.ssh/id_rsa")
      host        = azurerm_public_ip.vm_public_ip.ip_address
    }

    inline = [
      "sudo apt update",
      "sudo apt install -y certbot python3-certbot-nginx",
      "sudo certbot --nginx -d ${var.domain_name} --non-interactive --agree-tos -m dsmetaniak@itoutposts.com"
    ]
  }
}