# TWRP Device Tree for Symphony Z60+ (Unisoc T616 / UMS9230)

- **Chipset**: UNISOC T616 (UMS9230)
- **Android**: 12 (Virtual A/B)
- **Display**: 720×1600 HD+
- **Touch**: chipone-tddi
- **Kernel**: 5.4.254-ab181

## Build with GitHub Actions

Push this repo to GitHub → Actions builds automatically.

## Manual Build

```bash
. build/envsetup.sh
lunch twrp_Z60_plus-eng
make recoveryimage
```

## Flash

```bash
adb reboot fastboot
fastboot flash boot_a out/target/product/Z60_plus/boot.img
fastboot flash vbmeta --disable-verity --disable-verification vbmeta.img
fastboot reboot recovery
```
