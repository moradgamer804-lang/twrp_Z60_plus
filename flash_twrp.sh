#!/bin/bash
# TWRP Flash Script for Symphony Z60+ (Unisoc T616)
# Usage: ./flash_twrp.sh boot.img

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 twrp_boot.img"
    exit 1
fi

TWRP_IMG="$1"
VBMETA="vbmeta-sign.img"

echo "=== TWRP Flash for Symphony Z60+ ==="

# Check device
fastboot devices | head -1
if [ $? -ne 0 ]; then
    echo "Device not in fastboot mode!"
    exit 1
fi

# Step 1: Backup stock boot
echo "[1/4] Backing up stock boot..."
fastboot flash boot_a "$TWRP_IMG"
fastboot reboot fastboot 2>/dev/null

sleep 3
fastboot devices

# Step 2: Disable AVB
echo "[2/4] Disabling AVB..."
fastboot flash vbmeta --disable-verity --disable-verification "$VBMETA" 2>/dev/null || \
    fastboot flash vbmeta_a --disable-verity --disable-verification "$VBMETA"

# Step 3: Verify
echo "[3/4] Verifying..."
fastboot getvar all 2>&1 | grep -E "slot|version"

# Step 4: Reboot recovery
echo "[4/4] Rebooting to recovery..."
fastboot reboot recovery

echo "=== Done! ==="
