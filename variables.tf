##################################################################################
# resource_group - The IBM Cloud resource group to create the TMOS VPC Custom Image
##################################################################################
variable "resource_group" {
  type        = string
  default     = "schematics"
  description = "The IBM Cloud resource group to create the TMOS VPC Custom Image"
}

##################################################################################
# download_region - The VPC region to Download the Public TMOS COS Image
##################################################################################
variable "download_region" {
  type        = string
  default     = "us-south"
  description = "The VPC region to Download the Public TMOS COS Image"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['us-south', 'us-east', 'eu-gb', 'eu-de', 'jp-tok', 'au-syd'], var.download_region)
  #  error_message = "download_region must be a public VPC region"
  #}
}

##################################################################################
# vpc_image_name - The VPC Custom Image Name
##################################################################################
variable "vpc_image_name" {
  type        = string
  default     = ""
  description = "The VPC Custom Image Name"
}

##################################################################################
# tmos_version - The version of TMOS image to Import
##################################################################################
variable "tmos_version" {
  type        = string
  default     = "15.1"
  description = "The version of TMOS image to Import"
}

##################################################################################
# tmos_image_type - The type of TMOS image to Import
##################################################################################
variable "tmos_image_type" {
  type        = string
  default     = "ltm"
  description = "Select between ltm or all TMOS VE images"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['ltm', 'all'], var.tmos_image_type)
  #  error_message = "tmos_image_type can be ltm or all only"
  #}
}

##################################################################################
# api_key - api_key to be used for infrastructure creation
##################################################################################
variable "api_key" {
  default = ""
}

##################################################################################
# ssh_public_key - public key to use for ssh
##################################################################################
variable "ssh_public_key" {
  default = ""
}

variable "ssh_private_key" {
  default = ""
}

##################################################################################
# Region to create environment
##################################################################################
variable "region" {
  default     = "us-south"
  description = "Region to test."
}

##################################################################################
# zone - 1-3, zone in which to create environment
##################################################################################
variable "zone" {
  default     = "1"
  description = "Zones in each region to test."
}
