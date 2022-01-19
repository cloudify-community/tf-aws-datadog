variable "app_name" {
    type = string
    default = "demo"
}

variable "vpc" {
    type = string
}

variable "instances" {
    type = list(string)
}

variable "subnets" {
    type = list(string)
}

variable "security_groups"{
    type = list(string)
}