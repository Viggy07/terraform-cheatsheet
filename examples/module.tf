module "efs_datasync" {
  source  = "git::https://github.com/cloudposse/terraform-aws-efs-backup.git?ref=master"

  for_each = local.envs

  tenant_name                 = "${each.value["tenant_name"]}"
  env                         = "${each.value["env"]}"
  tags                        = var.tags
}
