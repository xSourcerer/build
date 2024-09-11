#! /bin/sh

rm -rf .repo/local_manifests

rm -rf kernel/xiaomi/*
rm -rf vendor/xiaomi/*
rm -rf device/xiaomi/*
rm -rf hardware/xiaomi

repo init -u https://github.com/Evolution-X/manifest.git --depth 1 -b udc --git-lfs

git clone https://github.com/xSourcerer/local_manifests --depth 1 -b crd .repo/local_manifests

#git clone --recursive https://github.com/crdroidandroid/android_kernel_xiaomi_surya kernel/xiaomi/surya
cd kernel/xiaomi/surya
git submodule init
git submodule update --recursive

/opt/crave/resync.sh

export BUILD_BROKEN_DUP_RULES=true
source build/envsetup.sh

croot # move to the root directory of project

lunch lineage_surya-userdebug
# make clean
m evolution
