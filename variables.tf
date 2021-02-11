##################################################################################
# resource_group - The IBM Cloud resource group to create the TMOS VPC Custom Image
##################################################################################
variable "resource_group" {
  type        = string
  default     = "schematics"
  description = "The IBM Cloud resource group to create the TMOS VPC Custom Image"
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
