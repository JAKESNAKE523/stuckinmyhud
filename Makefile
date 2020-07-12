export TARGET = iphone:clang:13.0:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

ARCHS=arm64 arm64e

TWEAK_NAME = stuckinmyhud

stuckinmyhud_FILES = SIMH.xm CustomHUD.m
stuckinmyhud_CFLAGS = -fobjc-arc
stuckinmyhud_PRIVATE_FRAMEWORKS += MediaRemote
stuckinmyhud_EXTRA_FRAMEWORKS += Cephei, CepheiPrefs

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += simhprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
