variable "key_name" {
  default = "id_terraform"
}

variable "public_key_path" {
  type = string
}

variable "ip_whitelist" {
  type = "list"
}

variable "logger_ami" {}

variable "dc_ami" {}

variable "wef_ami" {}

variable "win10_ami" {}
