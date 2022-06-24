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
