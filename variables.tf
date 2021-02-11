##################################################################################
# resource_group - The IBM Cloud resource group to create the VPC
##################################################################################
variable "resource_group" {
  type        = string
  default     = "schematics"
  description = "The IBM Cloud resource group to create the VPC"
}

##################################################################################
# download_region - The VPC region to Download the Public BIG-IP COS Image Catalog
##################################################################################
variable "download_region" {
  type        = string
  default     = "us-south"
  description = "The VPC region to Download the Public BIG-IP COS Image Catalog"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['us-south', 'us-east', 'eu-gb', 'eu-de', 'jp-tok', 'au-syd'], var.download_region)
  #  error_message = "download_region must be a public VPC region"
  #}
}

##################################################################################
# bigip_image_name - The VPC Custom Image Name for BIG-IP
##################################################################################
variable "bigip_image_name" {
  type        = string
  default     = ""
  description = "The VPC Custom Image Name for BIG-IP"
}

##################################################################################
# bigip_version - The version of BIG-IP image to Import
##################################################################################
variable "bigip_version" {
  type        = string
  default     = "15.1"
  description = "The version of BIG-IP image to Import"
}

##################################################################################
# bigip_image_type - The type of BIG-IP image to Import
##################################################################################
variable "bigip_image_type" {
  type        = string
  default     = "ltm"
  description = "Select between ltm or all BIG-IP VE images"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['ltm', 'all'], var.bigip_image_type)
  #  error_message = "bigip_image_type can be ltm or all only"
  #}
}


##################################################################################
# bigiq_image_name - The VPC Custom Image Name for BIGIQ
##################################################################################
variable "bigiq_image_name" {
  type        = string
  default     = ""
  description = "The VPC Custom Image Name for BIGIQ"
}

##################################################################################
# bigiq_version - The version of BIG-IQ image to Import
##################################################################################
variable "bigiq_version" {
  type        = string
  default     = "7.1"
  description = "The version of BIG-IQ image to Import"
}

##################################################################################
# bigiq_image_type - The type of BIG-IQ image to Import
##################################################################################
variable "bigiq_image_type" {
  type        = string
  default     = "standard"
  description = "Select between standard or large BIG-IQ VE images"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['ltm', 'all'], var.bigiq_image_type)
  #  error_message = "bigiq_image_type can be ltm or all only"
  #}
}

##################################################################################
# api_key - api_key to be used for infrastructure creation
##################################################################################
#variable "api_key" {
#  default = ""
#}

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
# Region to create VPC environment
##################################################################################
variable "region" {
  default     = "us-south"
  description = "Region to create VPC environment"
}

##################################################################################
# zone - 1-3, zone in which to create VPC environment
##################################################################################
variable "zone" {
  default     = "1"
  description = "Zones in each region to create VPC environment"
}
