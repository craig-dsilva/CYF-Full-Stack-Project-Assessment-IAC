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
  default = "ami-0eb260c4d5475b901"
}

variable "videos_public_key" {
  type = string
  sensitive = true
}

variable "home_ip" {
  type = string
  sensitive = true
}