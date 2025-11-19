locals {
  cloudinit_data = templatefile("${path.module}/kunai-sandbox.yml", {})
}


resource "incus_profile" "kunai_profile" {
  name = "kunai_profile"

  config = {
    "limits.cpu" = 2
    "cloud-init.user-data" = local.cloudinit_data
  }


  device {
    name = "shared"
    type = "disk"

    properties = {
      source = "/tmp"
      path   = "/tmp"
    }
  }

  device {
    type = "disk"
    name = "root"

    properties = {
      pool = "zstore"
      path = "/"
    }
  }


  device {
    type = "nic"
    name = "eth0"
    properties = {
       nictype = "bridged"
       parent = "incusbr0"
  }
  }
}

