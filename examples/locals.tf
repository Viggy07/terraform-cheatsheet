locals {
  subnet_ids = concat(tolist(data.aws_subnet_ids.public.ids), tolist(data.aws_subnet_ids.private.ids))
}

locals {
  envs = {
    "staging-01" = {
      tenant_name        = "web-01"
      env                = "staging-01"
    },

    "staging-02" = {
      env                = "staging-02"
      webserver_vpc_id   = var.webserver_vpc_id
    }
  }
}
