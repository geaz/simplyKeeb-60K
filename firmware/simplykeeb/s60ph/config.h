#pragma once

#include "config_common.h"

#define VENDOR_ID    0x1410
#define PRODUCT_ID   0x0001
#define DEVICE_VER   0x0001
#define MANUFACTURER simplyKeeb
#define PRODUCT      s60HK

#define MATRIX_ROWS  10
#define MATRIX_COLS  6
#define MATRIX_ROW_PINS \
    { C6, D7, E6, B4, B5 }

#define MATRIX_COL_PINS \
    { F6, F7, B1, B3, B2, B6 }

#define DEBOUNCE 5

#define USE_SERIAL
#define SOFT_SERIAL_PIN D2
#define DIODE_DIRECTION COL2ROW

#define RGB_DI_PIN D3
#define RGBLED_NUM 22
#define RGBLIGHT_SPLIT
#define RGBLED_SPLIT { 11, 11 }
#define RGBLIGHT_EFFECT_RAINBOW_MOOD

#define BOOTMAGIC_LITE_ROW 0
#define BOOTMAGIC_LITE_COLUMN 1
#define BOOTMAGIC_LITE_ROW_RIGHT 4
#define BOOTMAGIC_LITE_COLUMN_RIGHT 1