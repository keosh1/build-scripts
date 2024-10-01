#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs
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
#cherry-pick
git fetch https://github.com/DanipunK1-mondrian-DC/external_wpa_supplicant_8.git
git cherry-pick e8faf37f10bc06610d682c8fa3fc6c8c1c93fc79
# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="
riseup mondrian userdebug
make installclean
rise b
