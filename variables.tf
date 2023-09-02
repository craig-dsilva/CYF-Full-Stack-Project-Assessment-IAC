variable "db_username" {
    type = string
    sensitive = true
}

variable "db_password" {
    type = string
    sensitive = true
}

variable "ec2_ami" {
  type = string
  default = "ami-028eb925545f314d6"
}

variable "videos_public_key" {
  type = string
  sensitive = true
}

variable "home_ip" {
  type = string
  sensitive = true
}

variable "security_group" {
  
}