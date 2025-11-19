terraform {
  required_providers {
    incus = {
      source = "lxc/incus"
    }
  }
}

provider "incus" {
  generate_client_certificates = true
  accept_remote_certificate    = true
  default_remote               = "freevirt"

  remote {
    name    = "local"
    address = "unix://"
  }

  remote {
    name    = "freevirt"
    address = "https://freevirt.iutbeziers.fr:8443"
    token   = "eyJjbGllbnRfbmFtZSI6ImluY3VzLXVpIiwiZmluZ2VycHJpbnQiOiIyNDI4Y2ZlZjEwMWY3MzIyNTc5MTI4YmYwZjVkNTBjNzRjYTExYTAyOGMxZjAyODIzZjYzYTE4YjcwNWQ4MTVkIiwiYWRkcmVzc2VzIjpbIjEwLjYuMjU1LjEyMTo4NDQzIiwiMTAuNzcuMjYuMTo4NDQzIiwiW2ZkNDI6OTU4MDo1ZGQxOjQzNWU6OjFdOjg0NDMiXSwic2VjcmV0IjoiYzE2ZWUwMzczYzc2Mjg4YWQ2MjJiNmI3YzAwYjRjNDg0YzdkNGM1YzMzMTVmYmNkMmYxNGYwN2ZhNDE4ZGM4YiIsImV4cGlyZXNfYXQiOiIwMDAxLTAxLTAxVDAwOjAwOjAwWiJ11"
  }
}
