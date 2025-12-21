variable "sqldb" {
  type = map(object({
    name         = string
    server_name = string 
    resource_group_name= string                // additional diya 
    collation    = optional(string)
    license_type = optional(string)
    max_size_gb  = optional(number)
    sku_name     = optional(string)
    enclave_type = optional(string)
  }))
}
