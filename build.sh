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

git clone https://github.com/xSourcerer/local_manifests --depth 1 -b evo .repo/local_manifests

/opt/crave/resync.sh

. build/envsetup.sh

lunch lineage_surya-userdebug

rm -rf vendor/evolution-priv/keys

croot && git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template vendor/evolution-priv/keys

cd vendor/evolution-priv/keys
./keys.sh
croot

m evolution
