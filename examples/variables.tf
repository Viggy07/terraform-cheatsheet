variable "vpc_name" {
  type    = string
  default = "webserver-vpc"
  description = "name of the vpc to be created"
}

variable "no_of_webservers" {
  type        = number
  default     = 5
  description = "number of webservers to be created"
}

variable "tags" {
  type        = map(string)
  default     = {
    Terraform = "true"
    webserver = "true"
  }
  description = "A map of tags to add to all resources"
}

variable "webserver_ingress_cidr" {
  type        = list(string)
  default     = ["0.0.0.0/0"]
  description = "cide from where the webserver will be accessible"
}

variable "ec2_deletion_protection" {
  type        = bool
  default     = true
  description = "Specifies weather the ec2 instance should have deletion protection"
}

variable "node_groups" {
  type = any
  default = {
    ng-default = {
      name             = "r5-default"
      subnet_ids       = []
      desired_capacity = 4
      max_size         = 6
      min_size         = 2
      instance_type    = "r5.large"
      disk_size        = 20
      remote_access    = true
      ng_tags = {
        "Terraform" = "true"
      }
    }
  }
  description = "The list of maps of NodeGroups"
}

variable "map_roles" {
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))
  default = []
  description = "Additional IAM roles to add to the aws-auth configmap."
}
