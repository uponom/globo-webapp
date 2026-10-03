output "public_lb_dns" {
  value = aws_lb.main.dns_name
}

output "webapp_instance0_public_ip" {
  value = aws_instance.main[0].public_ip
}

output "private_key_pem" {
  value = nonsensitive(module.ssh_keys.private_key_pem)
}

output "playbook_repo" {
  value = var.playbook_repo
}

output "secret_id" {
  value = var.api_key_secret_id
}

output "host_list" {
  value = local.host_list_ssm_name
}

output "site_name" {
  value = local.site_name_ssm_name
}