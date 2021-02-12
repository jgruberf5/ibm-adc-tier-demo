data "ibm_is_instance_profile" "bigiq_profile" {
  name = var.bigiq_profile
}

locals {
  # set the user_data YAML template for each license type
  license_map = {
    "none"         = file("${path.module}/bigiq_user_data_no_license.yaml")
    "bigiq_regkey" = file("${path.module}/bigiq_user_data_license_only.yaml")
    "regkeypool"   = file("${path.module}/bigiq_user_data_license_regkey_pool.yaml")
    "utilitypool"  = file("${path.module}/bigiq_user_data_license_utility_pool.yaml")
  }
}

resource "random_uuid" "namer" {}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

locals {
  template_file = lookup(local.license_map, var.license_type, local.license_map["none"])
  # user admin_password if supplied, else set a random password
  admin_password = var.bigiq_admin_password == "" ? random_password.password.result : var.bigiq_admin_password
  # set user_data YAML values or else set them to null for templating
  phone_home_url         = var.phone_home_url == "" ? "null" : var.phone_home_url
  license_basekey        = var.license_basekey == "none" ? "null" : var.license_basekey
  license_pool_name      = var.license_pool_name == "none" ? "null" : var.license_pool_name
  license_utility_regkey = var.license_utility_regkey == "none" ? "null" : var.license_utility_regkey
  license_offerings_1    = var.license_offerings_1 == "none" ? "null" : var.license_offerings_1
  license_offerings_2    = var.license_offerings_2 == "none" ? "null" : var.license_offerings_2
  license_offerings_3    = var.license_offerings_3 == "none" ? "null" : var.license_offerings_3
  license_offerings_4    = var.license_offerings_4 == "none" ? "null" : var.license_offerings_4
  license_offerings_5    = var.license_offerings_5 == "none" ? "null" : var.license_offerings_5
  license_offerings_6    = var.license_offerings_6 == "none" ? "null" : var.license_offerings_6
  license_offerings_7    = var.license_offerings_7 == "none" ? "null" : var.license_offerings_7
  license_offerings_8    = var.license_offerings_8 == "none" ? "null" : var.license_offerings_8
  license_offerings_9    = var.license_offerings_9 == "none" ? "null" : var.license_offerings_9
  license_offerings_10   = var.license_offerings_10 == "none" ? "null" : var.license_offerings_10
}

data "template_file" "user_data" {
  template = local.template_file
  vars = {
    bigiq_admin_password   = local.admin_password
    license_basekey        = local.license_basekey
    license_pool_name      = local.license_pool_name
    license_utility_regkey = local.license_utility_regkey
    license_offerings_1    = local.license_offerings_1
    license_offerings_2    = local.license_offerings_2
    license_offerings_3    = local.license_offerings_3
    license_offerings_4    = local.license_offerings_4
    license_offerings_5    = local.license_offerings_5
    license_offerings_6    = local.license_offerings_6
    license_offerings_7    = local.license_offerings_7
    license_offerings_8    = local.license_offerings_8
    license_offerings_9    = local.license_offerings_9
    license_offerings_10   = local.license_offerings_10
    phone_home_url         = local.phone_home_url
    template_source        = "ibm-adc-tier-demo"
    template_version       = "1.0.0"
    zone                   = "${var.region}-${var.zone}"
    vpc                    = ibm_is_vpc.adc_tier_vpc.id
    app_id                 = "adc-infrastructure-deployment"
  }
}

resource "ibm_is_instance" "f5_bigiq" {
  name           = "bigiq-licensor-vpc-${var.region}-${var.zone}"
  resource_group = data.ibm_resource_group.group.id
  image          = ibm_is_image.bigiq_custom_image.id
  profile        = data.ibm_is_instance_profile.bigiq_profile.id
  primary_network_interface {
    name            = "management"
    subnet          = ibm_is_subnet.f5_management.id
    security_groups = [ibm_is_vpc.adc_tier_vpc.default_security_group]
  }
  network_interfaces {
    name            = "internal"
    subnet          = ibm_is_subnet.f5_internal.id
    security_groups = [ibm_is_vpc.adc_tier_vpc.default_security_group]
  }
  vpc        = ibm_is_vpc.adc_tier_vpc.id
  zone       = "${var.region}-${var.zone}"
  keys       = [ibm_is_ssh_key.ssh_key.id]
  user_data  = data.template_file.user_data.rendered
  depends_on = [ibm_is_security_group_rule.f5_allow_outbound]
  timeouts {
    create = "60m"
    delete = "60m"
  }
}

resource "ibm_is_floating_ip" "f5_management_floating_ip" {
  name           = "f0-${random_uuid.namer.result}"
  resource_group = data.ibm_resource_group.group.id
  count          = var.bigiq_management_floating_ip ? 1 : 0
  target         = ibm_is_instance.f5_bigiq.primary_network_interface.0.id
}

output "f5_bigiq_name" {
  value = ibm_is_instance.f5_bigiq.name
}

output "f5_bigiq_instance_id" {
  value = ibm_is_instance.f5_bigiq.id
}

output "f5_bigiq_profile_id" {
  value = data.ibm_is_instance_profile.bigiq_profile.id
}

output "f5_bigiq_management_ip" {
  value = ibm_is_instance.f5_bigiq.primary_network_interface.0.primary_ipv4_address
}

output "f5_bigiq_phone_home_url" {
  value = var.phone_home_url
}

output "f5_bigiq_management_floating_ip" {
  value = var.bigiq_management_floating_ip ? ibm_is_floating_ip.f5_management_floating_ip[0].address : ""
}
