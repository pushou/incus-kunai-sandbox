# goal
provide kunai-sandbox as a nested VM  in an debian Incus  VM


## install incus on your host
./install-incus.sh

## create profile
incus profile create kunai-sandbox < kunai-sandbox.profile

# 16GiB is comfortable you can try with 8GiB if you have not sufficient resources
incus launch images:debian/13/cloud sandbox-vm-13 --vm --profile kunai-sand#box -c limits.cpu=2 -c limits.memory=16GiB
