#!/bin/bash
#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=hotdogg
export DEVICE_COMMON=sm8150-common
export VENDOR=oneplus

export DEVICE_BRINGUP_YEAR=2020

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

LIBGF_UD_HAL=../../../vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib/libgf_ud_hal.so
LIB64GF_UD_HAL=../../../vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib64/libgf_ud_hal.so

sed -i "s|vendor.boot.verifiedbootstate|vendor.boot.fingerprintbstate|g" "$LIBGF_UD_HAL"
sed -i "s|vendor.boot.verifiedbootstate|vendor.boot.fingerprintbstate|g" "$LIB64GF_UD_HAL"
