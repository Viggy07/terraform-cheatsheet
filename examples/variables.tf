variable "vpc_name" {
  type    = string
  default = "webserver-vpc"
}

variable "no_of_webservers" {
  type        = number
  default     = 5
  description = "number of webservers to be created"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    Terraform = "true"
    webserver = "true"
  }
}
