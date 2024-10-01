crave run  --no-patch -- "rm -rf .repo/local_manifests; \
git clone https://github.com/keosh1/local_manifests.git --depth 1 -b flake .repo/local_manifests
/opt/crave/resync.sh
source build/envsetup.sh
git fetch https://github.com/DanipunK1-mondrian-DC/external_wpa_supplicant_8.git
cd external/wpa_supplicant_8
git cherry-pick e8faf37f10bc06610d682c8fa3fc6c8c1c93fc79
cd
cd /crave-devspaces/risingos
riseup mondrian userdebug && make installclean
rise b
