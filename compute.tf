#---------------------------------------------------------
# Create sshkey from file
#---------------------------------------------------------
resource "ibm_is_ssh_key" "sshkey" {
  name       = "wordpress-demo"
  public_key = file(var.ssh_public_key)
}

#---------------------------------------------------------
# Create instances in each subnet in zone1
#---------------------------------------------------------
resource "ibm_is_instance" "webappserver-zone1" {
  count   = var.webappserver-count
  name    = "${format(var.webappserver-name, count.index + 1)}-${var.zone1}"
  image   = var.image
  profile = var.profile-webappserver
  resource_group = data.ibm_resource_group.group.id

  primary_network_interface {
    subnet          = ibm_is_subnet.webapptier-subnet-zone1.id
    security_groups = [ibm_is_security_group.webapptier-securitygroup.id]
  }

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone1
  keys      = [ibm_is_ssh_key.sshkey.id]
  user_data = data.template_cloudinit_config.cloud-init-webapptier.rendered
}

resource "ibm_is_instance" "dbserver-zone1" {
  count   = var.dbserver-count
  name    = "${format(var.dbserver-name, count.index + 1)}-${var.zone1}"
  image   = var.image
  profile = var.profile-dbserver
  resource_group = data.ibm_resource_group.group.id

  primary_network_interface {
    subnet          = ibm_is_subnet.dbtier-subnet-zone1.id
    security_groups = [ibm_is_security_group.dbtier-securitygroup.id]
  }

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone1
  keys      = [ibm_is_ssh_key.sshkey.id]
  user_data = data.template_cloudinit_config.cloud-init-dbtier.rendered
}

#---------------------------------------------------------
## Create instances in each subnet in zone2
#---------------------------------------------------------
resource "ibm_is_instance" "webappserver-zone2" {
  count   = var.webappserver-count
  name    = "${format(var.webappserver-name, count.index + 1)}-${var.zone2}"
  image   = var.image
  profile = var.profile-webappserver
  resource_group = data.ibm_resource_group.group.id

  primary_network_interface {
    subnet          = ibm_is_subnet.webapptier-subnet-zone2.id
    security_groups = [ibm_is_security_group.webapptier-securitygroup.id]
  }

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone2
  keys      = [ibm_is_ssh_key.sshkey.id]
  user_data = data.template_cloudinit_config.cloud-init-webapptier.rendered
}

resource "ibm_is_instance" "dbserver-zone2" {
  count   = var.dbserver-count
  name    = "${format(var.dbserver-name, count.index + 1)}-${var.zone2}"
  image   = var.image
  profile = var.profile-dbserver
  resource_group = data.ibm_resource_group.group.id

  primary_network_interface {
    subnet          = ibm_is_subnet.dbtier-subnet-zone2.id
    security_groups = [ibm_is_security_group.dbtier-securitygroup.id]
  }

  vpc       = ibm_is_vpc.vpc1.id
  zone      = var.zone2
  keys      = [ibm_is_ssh_key.sshkey.id]
  user_data = data.template_cloudinit_config.cloud-init-dbtier.rendered
}

#---------------------------------------------------------
# Assign floating IPs if needed
#---------------------------------------------------------

# Assign floating IP's to all instances of Web Servers

#resource "ibm_is_floating_ip" "webappserver-zone1-fip" {
#  count  = var.webappserver-count
#  name   = format("%s-%s-fip", format(var.webappserver-name, count.index + 1), var.zone1)
#  target = element(ibm_is_instance.webappserver-zone1.*.primary_network_interface.0.id, count.index)
# resource_group = data.ibm_resource_group.group.id
#}

#resource "ibm_is_floating_ip" "webappserver-zone2-fip" {
#  count  = var.webappserver-count
#  name   = format("%s-%s-fip", format(var.webappserver-name, count.index + 1), var.zone2)
#  target = element(ibm_is_instance.webappserver-zone2.*.primary_network_interface.0.id, count.index)
# resource_group = data.ibm_resource_group.group.id
#}
