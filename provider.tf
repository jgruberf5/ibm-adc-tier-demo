terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
    }
  }
}

provider "ibm" {
  generation       = 2
  region           = var.region
  ibmcloud_timeout = 300
}

data "ibm_resource_group" "group" {
  name = var.resource_group
}
