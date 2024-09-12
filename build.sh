#! /bin/sh

rm -rf .repo/local_manifests

rm -rf kernel/xiaomi/*
rm -rf vendor/xiaomi/*
rm -rf device/xiaomi/*
rm -rf hardware/xiaomi
rm -rf vendor/evolution-priv

repo init -u https://github.com/Evolution-X/manifest.git --depth 1 -b udc --git-lfs

git clone https://github.com/xSourcerer/local_manifests --depth 1 -b surya .repo/local_manifests

/opt/crave/resync.sh

#git clone --recursive https://github.com/crdroidandroid/android_kernel_xiaomi_surya kernel/xiaomi/surya
PROJECT_ROOT=$(pwd)
cd kernel/xiaomi/surya
git submodule init
git submodule update --recursive

cd $PROJECT_ROOT

export BUILD_BROKEN_DUP_RULES=true
export BUILD_USERNAME=Saki
export BUILD_HOSTNAME=crave
source build/envsetup.sh

croot && git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template vendor/evolution-priv/keys
cd vendor/evolution-priv/keys
./keys.sh

croot # move to the root directory of project

lunch lineage_surya-user
# make clean
m evolution
