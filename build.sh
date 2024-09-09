#! /bin/sh

crave run --no-patch -- "
repo init -u https://github.com/Evolution-X/manifest.git --depth 1 -b udc --git-lfs
/opt/crave/resync.sh
git clone https://github.com/xSourcerer/local_manifests --depth 1 -b main .repo/local_manifests
/opt/crave/resync.sh
. build/envsetup.sh
lunch lineage_surya-userdebug
croot && git clone https://github.com/Evolution-X/vendor_evolution-priv_keys-template vendor/evolution-priv/keys
cd vendor/evolution-priv/keys
./keys.sh
croot
m evolution
"