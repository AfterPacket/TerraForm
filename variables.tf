variable "region" {
	type	= string
    description= "Region Selection" 
	default = "us-east-1"
}
variable "zone_a" {
	type	= string
    description= "Region Selection" 
	default = "us-east-1a"
}
variable "vpccidr" {
  type        = string
  description = "CIDR for the VPC"
  default     = "172.100.0.0/16"
}
variable "publicsubnetcidr" {
  type        = string
  description = "CIDR for the public subnet"
  default     = "172.100.1.0/24"
}
variable "instance_size" {
  type        = string
  description = "Instance Selection"
  default     = "t3.micro"
}
variable "availability_zone" {
type        = string
description = "Zone Selection"
default     = "us-east-1a"
}

variable "ami" {
 type = string
 description = "ami Selection"
 default     = "ami-052efd3df9dad4825"
}

variable "instance_type" {
  type = string
  description = "instance Selection"
  default     = "t2.micro"
}

variable "key" {
  type = string
  description = "ikey"
  default     = "Test"
}