#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/Evolution-X/manifest -b udc --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Local manifests
git clone https://github.com/keosh1/local_manifests.git -b flake .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync
/opt/crave/resync.sh
export BUILD_USERNAME=keosh1
export BUILD_HOSTNAME=crave
echo "============="
echo "Sync success"
echo "============="
# Apply all the patches.
# You need to reapply the patch after every sync
#croot
git clone https://github.com/flakeforever/device_xiaomi_mondrian-patch.git
python apply-patches.py

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="
lunch lineage_mondrian-userdebug || lunch lineage_mondrian-userdebug
make installclean
mka bacon
#croot
m evolution
