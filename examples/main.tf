resource "aws_secretsmanager_secret" "source_endpoint_secret" {
  for_each                = local.envs
  name                    = "source-${each.value["tenant_name"]}-${each.value["env"]}-rds"
  kms_key_id              = var.secret_manager_kms_key
  recovery_window_in_days = 0
  tags = merge(
    {
      "Name" = format("%s-${var.public_subnet_suffix}", var.name)
    },
    var.tags,
  )
}
