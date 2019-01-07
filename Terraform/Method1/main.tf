variable "region" {
  default = "us-west-1"
}

variable "shared_credentials_file" {
  type = "string"
}

# Specify the provider and access details
provider "aws" {
  alias  = "us-west-2"
  
  shared_credentials_file = "${var.shared_credentials_file}"
  region = "${var.region}"
  profile = "terraform"
}

module "detection_lab_1" {
  source = "./detection-lab"  
  target_vpc_cidr = "192.168.1.0/24"
  
  public_key_path = "${var.public_key_path}"
  ip_whitelist = "${var.ip_whitelist}"
  logger_ami = "${var.logger_ami}"
  dc_ami = "${var.dc_ami}"
  wef_ami = "${var.wef_ami}"
  win10_ami = "${var.win10_ami}"
  
  # which AWS provider we should build within
  providers = {
    aws = "aws.us-west-2"
  }
}
  
module "detection_lab_2" {
  source = "./detection-lab"  
  target_vpc_cidr = "192.168.2.0/24"
  
  public_key_path = "${var.public_key_path}"
  ip_whitelist = "${var.ip_whitelist}"
  logger_ami = "${var.logger_ami}"
  dc_ami = "${var.dc_ami}"
  wef_ami = "${var.wef_ami}"
  win10_ami = "${var.win10_ami}"
  
  # which AWS provider we should build within
  providers = {
    aws = "aws.us-west-2"
  }
}
