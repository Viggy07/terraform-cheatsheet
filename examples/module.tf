module "efs_datasync" {
  source  = "git::https://github.com/cloudposse/terraform-aws-efs-backup.git?ref=master"

  for_each = local.envs

  tenant_name                 = lookup(each.value, "tenant_name", "${data.aws_db_instance.source[each.key].address}")
  env                         = "${each.value["env"]}"
  tags                        = var.tags
}
