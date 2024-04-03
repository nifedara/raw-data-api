output "VPC" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "IPv4_prefix_list" {
  description = "ID of prefix list for IPv4 addresses"
  value       = module.vpc.ipv4_prefix_list_id
}

output "IPv6_prefix_list" {
  description = "ID of prefix list for IPv6 addresses"
  value       = module.vpc.ipv6_prefix_list_id
}

output "secrets_manager_entries" {
  description = "List of secrets manager ARNs containing sensitive strings"
  value = concat(
    [
      module.db.database_credentials,
      var.sentry_dsn,
      var.remote_db_arn,
      var.app_secret_key
    ],
    values(var.container_secrets)
  )
}

output "default_security_group_id" {
  description = "Default Security Group ID for the VPC"
  value       = module.vpc.default_security_group_id
}

output "load_balancer_dns" {
  description = "List of DNS of the Application Load balancers"
  value = [
    module.alb.load_balancer_dns,
    module.alb-flower.load_balancer_dns
  ]
}
