# get the public image COS SQL url and default name
data "external" "bigip_public_image_all" {
  program = ["python3", "${path.module}/bigip_image_selector.py"]
  query = {
    download_region = var.download_region
    version_prefix  = var.bigip_version
    type            = "all"
  }
}

# get the public image COS SQL url and default name
data "external" "bigip_public_image_ltm" {
  program = ["python3", "${path.module}/bigip_image_selector.py"]
  query = {
    download_region = var.download_region
    version_prefix  = var.bigip_version
    type            = "ltm"
  }
}

# get the public image COS SQL url and default name
data "external" "bigiq_public_image" {
  program = ["python3", "${path.module}/bigiq_image_selector.py"]
  query = {
    download_region = var.download_region
    version_prefix  = var.bigiq_version
    type            = "standard"
  }
}


resource "ibm_is_image" "bigip_custom_image_all" {
  name             = data.external.bigip_public_image_all.result.image_name
  resource_group   = data.ibm_resource_group.group.id
  href             = data.external.bigip_public_image_all.result.image_sql_url
  operating_system = "centos-7-amd64"
  timeouts {
    create = "60m"
    delete = "60m"
  }
}

resource "ibm_is_image" "bigip_custom_image_ltm" {
  name             = data.external.bigip_public_image_ltm.result.image_name
  resource_group   = data.ibm_resource_group.group.id
  href             = data.external.bigip_public_image_ltm.result.image_sql_url
  operating_system = "centos-7-amd64"
  timeouts {
    create = "60m"
    delete = "60m"
  }
}

resource "ibm_is_image" "bigiq_custom_image" {
  name             = data.external.bigiq_public_image.result.image_name
  resource_group   = data.ibm_resource_group.group.id
  href             = data.external.bigiq_public_image.result.image_sql_url
  operating_system = "centos-7-amd64"
  timeouts {
    create = "60m"
    delete = "60m"
  }
}

output "bigip_all_image_name" {
  value = ibm_is_image.bigip_custom_image_all.name
}

output "bigip_all_image_id" {
  value = ibm_is_image.bigip_custom_image_all.id
}

output "bigip_ltm_image_name" {
  value = ibm_is_image.bigip_custom_image_ltm.name
}

output "bigip_ltm_image_id" {
  value = ibm_is_image.bigip_custom_image_ltm.id
}

output "bigiq_image_name" {
  value = ibm_is_image.bigiq_custom_image.name
}

output "bigiq_image_id" {
  value = ibm_is_image.bigiq_custom_image.id
}
