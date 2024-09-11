#! /bin/sh

rm -rf .repo/local_manifests

rm -rf kernel/xiaomi/surya
rm -rf vendor/xiaomi/surya
rm -rf vendor/xiaomi/sm6150-common
rm -rf device/xiaomi/surya
rm -rf device/xiaomi/sm6150-common
rm -rf hardware/xiaomi
rm -rf vendor/xiaomi/miuicamera

repo init -u https://github.com/Evolution-X/manifest.git --depth 1 -b udc --git-lfs

git clone https://github.com/xSourcerer/local_manifests --depth 1 -b crdroid .repo/local_manifests

/opt/crave/resync.sh

. build/envsetup.sh

lunch lineage_surya-userdebug

m evolution
