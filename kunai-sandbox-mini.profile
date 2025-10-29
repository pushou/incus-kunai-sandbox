config:
  cloud-init.user-data: |
    #cloud-config
    packages:
      - git
      - curl
      - wget
      - qemu-system
      - suricata
      - elfutils
      - locate
      - libguestfs-tools
      - xorriso
      - tcpdump

    # Définition du fuseau horaire
    timezone: Europe/Paris
  limits.cpu: "2"
  limits.memory: 16GiB
description: cloud init profile
devices:
  agent:
    source: agent:config
    type: disk
  eth0:
    name: eth0
    nictype: bridged
    parent: incusbr0
    type: nic
  root:
    path: /
    pool: default
    size: 20GiB
    type: disk
name: kunai-sandbox
used_by: []
project: default
