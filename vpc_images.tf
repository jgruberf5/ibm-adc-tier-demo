# get the public image COS SQL url and default name
data "external" "bigip_public_image" {
  program = ["python3", "${path.module}/bigip_image_selector.py"]
  query = {
      download_region = var.download_region
      version_prefix = var.bigip_version
      type = var.bigip_image_type
  }
}

# get the public image COS SQL url and default name
data "external" "bigiq_public_image" {
  program = ["python3", "${path.module}/bigiq_image_selector.py"]
  query = {
      download_region = var.download_region
      version_prefix = var.bigiq_version
      type = var.bigiq_image_type
  }
}

locals {
  bigip_image_name = var.bigip_image_name == "" ? data.external.bigip_public_image.result.image_name : var.bigip_image_name
  bigiq_image_name = var.bigiq_image_name == "" ? data.external.bigiq_public_image.result.image_name : var.bigiq_image_name  
}

resource "ibm_is_image" "bigip_custom_image" {
  name = local.bigip_image_name
  resource_group = data.ibm_resource_group.group.id
  href = data.external.bigip_public_image.result.image_sql_url
  operating_system = "centos-7-amd64"
  timeouts {
    create = "60m"
    delete = "60m"
  }
}

resource "ibm_is_image" "bigiq_custom_image" {
  name = local.bigiq_image_name
  resource_group = data.ibm_resource_group.group.id
  href = data.external.bigiq_public_image.result.image_sql_url
  operating_system = "centos-7-amd64"
  timeouts {
    create = "60m"
    delete = "60m"
  }
}

output "bigip_image_name" {
  value = ibm_is_image.bigip_custom_image.name
}

output "bigip_image_id" {
  value = ibm_is_image.bigip_custom_image.id
}

output "bigip_image_status" {
  value = ibm_is_image.bigip_custom_image.status
}

output "bigiq_image_name" {
  value = ibm_is_image.bigiq_custom_image.name
}

output "bigiq_image_id" {
  value = ibm_is_image.bigiq_custom_image.id
}

output "bigiq_image_status" {
  value = ibm_is_image.bigiq_custom_image.status
}