INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

ARCHS=arm64 arm64e

TWEAK_NAME = stuckinmyhud

stuckinmyhud_FILES = SIMH.xm
stuckinmyhud_CFLAGS = -fobjc-arc
stuckinmyhud_PRIVATE_FRAMEWORKS += MediaRemote

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += simhprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
