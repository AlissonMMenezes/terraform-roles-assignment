variable "data_factory_name" {
  type        = string
  description = "Data Factory Name"
}

variable "storage_account_name" {
  type        = string
  description = "Storage Account Name"
}

variable "key_vault_name" {
  type        = string
  description = "Storage Account Name"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "data_experts" {
  type        = list(string)
  description = "list of data experts"
  default     = []
}