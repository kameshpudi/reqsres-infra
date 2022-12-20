
variable "location" {
  description = "Azure location where the resources are deployed to"
  type        = string
  default     = "westeurope"
}

variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "d-emea-app-rg"
}

variable "plan_name" {
  description = "Name of the resource group"
  type        = string
  default     = "kkreqsres2022_plan"
}
variable "service_name" {
  description = "Name of the resource group"
  type        = string
  default     = "kkreqsres2022"
}
variable "stg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "kkreqsresfun2023"
}
