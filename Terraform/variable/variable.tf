
variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}
variable "subnet_cidr" {
  type    = string
  default = "192.168.0.0/20"
}

variable "az" {
  type    = string
  default = "ap-southeast-1a"
}

variable "public_ip" {
  type    = bool
  default = true
}



variable "ami_id" {
  description = "ami id of ap-southeast-1"
  type        = string
  default     = "ami-05f071c65e32875a8"
}


variable "inst_type" {
  type    = string
  default = "t3.micro"
}

variable "key_pair" {
  type    = string
  default = "pankaj"

}
