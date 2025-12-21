
variable "vms" {
  type = map(object({
    nic_name             = string
    location             = string
    resource_group_name  = string
    subnet_name1         = string
    pipname1             = string
    virtual_network_name = string

    ip_configuration = map(object({
      name                          = string
      private_ip_address_allocation = string

    }))
    vm_name        = string
    vm_size        = string
    admin_username = string
    admin_password = string

    os_disk = map(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = map(object({
      offer     = string
      sku       = string
      publisher = string
      version   = string

    }))
  }))

}

