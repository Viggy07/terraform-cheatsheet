locals {
  subnet_ids = concat(tolist(data.aws_subnet_ids.public.ids), tolist(data.aws_subnet_ids.private.ids))
}

