terraform {
  required_providers {
    ibm = {
      source = "IBM-Cloud/ibm"
    }
  }
}

provider "ibm" {
  /* Uncomment ibmcloud_api_key while testing from CLI */
  ibmcloud_api_key = var.api_key
  generation       = 2
  region           = var.region
  ibmcloud_timeout = 300
}

data "ibm_resource_group" "group" {
  name = var.resource_group
}
