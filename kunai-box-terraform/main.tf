resource "incus_instance" "srv-instance" {
  count   = 2
  project = "default"
  profiles  = [incus_profile.kunai_profile.name]

  # Utilisation de l'index pour donner un nom unique à chaque instance
  name  = "srv-node-0${count.index + 1}"

  # Image utilisée pour la création de l'instance
  image = "images:ubuntu/jammy/cloud"

  type  = "virtual-machine"

  config = {
    "boot.autostart" = true
  }

}
