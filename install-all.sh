#/bin/bash
# all in one install

## install incus on your host
./install-incus.sh

## create profile
incus profile create kunai-sandbox < kunai-sandbox.profile

## launch VM
# (16GiB is comfortable you can try with 8GiB if you have not sufficient resources)
# if incus is already installed change storage with --storage
incus launch images:debian/13/cloud sandbox-vm --vm --profile kunai-sandbox -c limits.cpu=2 -c limits.memory=16GiB
