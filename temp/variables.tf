#---------------------------------------------------------
# MODIFY VARIABLES AS NEEDED
#---------------------------------------------------------
#---------------------------------------------------------

#---------------------------------------------------------
## DEFINE VPC
#---------------------------------------------------------
variable "vpc-name" {
  default = "vpc-name-here"
}

variable "resource_group" {
  #default = "resource-name-here"
  default = "jww10webapprg"
}

variable "cis_resource_group" {
  #default = "cis-resource-name-here"
  default = "jww10webappcisrg"
}

#---------------------------------------------------------
## DEFINE Zones
#---------------------------------------------------------
variable "zone1" {
  default = "us-south-1"
}

variable "zone2" {
  default = "us-south-2"
}

#---------------------------------------------------------
## DEFINE CIDR Blocks to be used in each zone
#---------------------------------------------------------
variable "address-prefix-vpc" {
  default = "172.21.0.0/20"
}

variable "address-prefix-1" {
  default = "172.21.0.0/21"
}

variable "address-prefix-2" {
  default = "172.21.8.0/21"
}

#---------------------------------------------------------
## DEFINE subnets for zone 1
#---------------------------------------------------------

variable "webapptier-subnet-zone-1" {
  default = "172.21.0.0/24"
}

variable "dbtier-subnet-zone-1" {
  default = "172.21.1.0/24"
}

variable "vpn-subnet-zone-1" {
  default = "172.21.2.0/24"
}

#---------------------------------------------------------
## DEFINE subnets for zone 2
#---------------------------------------------------------

variable "webapptier-subnet-zone-2" {
  default = "172.21.8.0/24"
}

variable "dbtier-subnet-zone-2" {
  default = "172.21.9.0/24"
}

variable "vpn-subnet-zone-2" {
  default = "172.21.10.0/24"
}

#---------------------------------------------------------
## DEFINE DNS
#---------------------------------------------------------
variable "domain" {
  #default = "mydomain.com"
  default = "terraformer.blog"
}

variable "cis_instance_name" {
  #default = "mydomain.com"
  default = "terraformer.blog"
}

variable "dns_name" {
  default = "www."
}

#---------------------------------------------------------
## DEFINE sshkey to be used for compute instances
#---------------------------------------------------------
variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

#---------------------------------------------------------
## DEFINE OS image to be used for compute instances
#---------------------------------------------------------

#image = Ubuntu-18.04-amd64
variable "image" {
  default = "r006-ed3f775f-ad7e-4e37-ae62-7199b4988b00"
}

#---------------------------------------------------------
## DEFINE webapptier compute instance profile & quantity
#---------------------------------------------------------
variable "profile-webappserver" {
  default = "cx2-2x4"
}

variable "webappserver-name" {
  default = "webapp%02d"
}

variable "webappserver-count" {
  default = 1
}

#---------------------------------------------------------
## DEFINE database tier compute instance profile & quantity
#---------------------------------------------------------
variable "profile-dbserver" {
  default = "bx2-4x16"
}

variable "dbserver-name" {
  default = "mysql%02d"
}

variable "dbserver-count" {
  default = 1
}

#---------------------------------------------------------
## DEFINE Load Balancer for webapptier
#---------------------------------------------------------

variable "webapptier-lb-connections" {
  default = 2000
}

variable "webapptier-lb-algorithm" {
  default = "round_robin"
}

#---------------------------------------------------------
## DEFINE VPNaaS instance for connectivity to premise
#---------------------------------------------------------
variable "onprem_vpn_ip_address" {
  default = "0.0.0.0"
}

variable "onprem_cidr" {
  default = "192.168.248.0/24"
}

variable "vpn-preshared-key" {
  default = "pre$haredkey"
}
