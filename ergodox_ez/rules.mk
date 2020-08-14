MOUSEKEY_ENABLE  = yes # Mouse keys(+4700)
EXTRAKEY_ENABLE  = yes # Audio control and System control(+450)
CONSOLE_ENABLE   = no  # Console for debug(+400)
COMMAND_ENABLE   = yes # Commands for debug and configuration
CUSTOM_MATRIX    = yes # Custom matrix file for the ErgoDox EZ
NKRO_ENABLE      = yes # USB Nkey Rollover - if this doesn't work, see here: https://github.com/tmk/tmk_keyboard/wiki/FAQ#nkro-doesnt-work
UNICODE_ENABLE   = yes # Unicode
SWAP_HANDS_ENABLE= yes # Allow swapping hands of keyboard
SLEEP_LED_ENABLE = no
API_SYSEX_ENABLE = no
RGBLIGHT_ENABLE = yes
RGB_MATRIX_ENABLE = no # enable later
RGB_HID_ENABLE = yes


ifeq ($(strip $(RGB_MATRIX_ENABLE)), no)
  SRC += i2c_master.c
endif

ifeq ($(strip $(RGB_HID_ENABLE)), yes)
	RAW_ENABLE = yes
  SRC += rgb_hid_protocol.c
endif

LAYOUTS = ergodox
