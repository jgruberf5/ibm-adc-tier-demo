##################################################################################
# resource_group - The IBM Cloud resource group to create the VPC
##################################################################################
variable "resource_group" {
  type        = string
  default     = "schematics"
  description = "The IBM Cloud resource group to create the VPC"
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

##################################################################################
# download_region - The VPC region to Download the Public BIG-IP COS Image
##################################################################################
variable "download_region" {
  type        = string
  default     = "us-south"
  description = "The VPC region to Download the Public BIG-IP COS Image"
  # when IBM Schematics 0.13 has the IBM provider installed
  #validation {
  #  condition = contains(['us-south', 'us-east', 'eu-gb', 'eu-de', 'jp-tok', 'au-syd'], var.download_region)
  #  error_message = "download_region must be a public VPC region"
  #}
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
# bigiq_version - The version of BIG-IQ image to Import
##################################################################################
variable "bigiq_version" {
  type        = string
  default     = "7.1"
  description = "The version of BIG-IQ image to Import"
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
# bigiq_profile - The name of the VPC profile to use for the F5 BIG-IQ instance
##################################################################################
variable "bigiq_profile" {
  type        = string
  default     = "bx2-4x16"
  description = "The resource profile to be used when provisioning the F5 BIG-IQ instance"
}

##################################################################################
# phone_home_url - The web hook URL to POST status to when F5 BIG-IQ onboarding completes
##################################################################################
variable "phone_home_url" {
  type        = string
  default     = ""
  description = "The URL to POST status when BIG-IQ is finished onboarding"
}

##################################################################################
# schematic template for license pool playbooks
##################################################################################
variable "license_type" {
  type        = string
  default     = "none"
  description = "How to license, may be 'none','bigiq_regkey','regkeypool','utilitypool'"
}

variable "license_pool_name" {
  type        = string
  default     = "none"
  description = "The name of the BIG-IP license pool to create"
}

variable "license_utility_regkey" {
  type        = string
  default     = "none"
  description = "The BIG-IP utility pool regkey to create offerings to grant"
}

variable "license_offerings_1" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_2" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_3" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_4" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_5" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_6" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_7" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_8" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_9" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}

variable "license_offerings_10" {
  type        = string
  default     = "none"
  description = "The BIG-IP regkey pool offering key"
}
