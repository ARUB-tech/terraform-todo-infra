rg = {
  rg1 = {
    name     = "dev-arubrg-013"
    location = "UAE North"
  }

}
vnet = {
  vnet1 = {
    name                = "dev-vnet-12"
    location            = "UAE North"
    resource_group_name = "dev-arubrg-013"
    address_space       = ["10.0.0.0/16"]
    subnets = {
      sub1 = {
        name             = "dev-sub-001"
        address_prefixes = ["10.0.1.0/24"]
      }
      sub2 = {
        name             = "dev-sub-002"
        address_prefixes = ["10.0.2.0/24"]
      }
    }

  }

}

public_ips = {
  "publicip1" = {
    name                = "dev_public_ip1"
    resource_group_name = "dev-arubrg-013"
    location            = "UAE North"
    allocation_method   = "Static"


  }

}


nsgs = {
  web-nsg = {
    location            = "UAE North"
    resource_group_name = "dev-arubrg-013"
    rules = [
      {
        name                       = "Allow-HTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "Allow-SSH"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }


}

vms = {
  vm1 = {
    nic_name             = "dev-nic-001"
    location             = "UAE North"
    resource_group_name  = "dev-arubrg-013"
    subnet_name1         = "dev-sub-001"
    pipname1             = "dev_public_ip1"
    virtual_network_name = "dev-vnet-12"
    vm_name              = "dev-vm-001"
    vm_size              = "Standard_D2s_v3"
    //"Standard_D2s_v3" //"Standard_F2"
    admin_username = "vm12"
    admin_password = "Abdurrub123"


    ip_configuration = {
      ip_config1 = {
        name                          = "internal"
        private_ip_address_allocation = "Dynamic"
      }
    }
    os_disk = {
      disk1 = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }
    source_image_reference = {
      image1 = {
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        publisher = "Canonical"
        version   = "latest"


      }

    }
  }


}

servers = {
  sql1 = {
    name                         = "sql-server-1-dev-013"
    resource_group_name          = "dev-arubrg-013"
    location                     = "UAE North"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "Password@123"
    minimum_tls_version          = "1.2"
    tags = {
      env = "dev"
    }
  }
}

sqldb = {
  db1 = {
    name                = "sqldb-server-1-dev-013"
    resource_group_name = "dev-arubrg-013"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    server_name         = "sql-server-1-dev-013"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    read_scale          = "true"
    sku_name            = "S0"
    zone_redundant      = "true"
    enclave_type        = "VBS"
  }
}


# "Standard_D2s_v3"
# "UAE North"
