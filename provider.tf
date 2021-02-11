variable "resource_group" {
    default = ""
}

variable "api_key" {
  default = ""
}

variable "ssh_public_key" {
  default = ""
}

variable "ssh_private_key" {
  default = ""
}

variable "region" {
  default     = "us-south"
  description = "Region to test."
}

variable "zone" {
  default     = "1"
  description = "Zones in each region to test."
}

terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
    }
  }
}

provider "ibm" {
/* Uncomment ibmcloud_api_key while testing from CLI */
#  ibmcloud_api_key = var.api_key
  generation       = 2
  region           = var.region
  ibmcloud_timeout = 300
}