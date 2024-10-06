#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b los21 https://github.com/keosh1/local_manifests.git .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=keosh1
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# ...and run our repopicks script
curl https://raw.githubusercontent.com/keosh1/local_manifests/refs/heads/los21/repopicks.sh | bash

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
riseup mondrian userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
rise b
