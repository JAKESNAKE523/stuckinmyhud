include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = SIMHPrefs

ARCHS=arm64e arm64

SIMHPrefs_FILES = SIMHAppearanceSettings.m SMHRootListController.m
SIMHPrefs_INSTALL_PATH = /Library/PreferenceBundles
SIMHPrefs_FRAMEWORKS = UIKit
SIMHPrefs_PRIVATE_FRAMEWORKS = Preferences
SIMHPrefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
SIMHPrefs_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SIMHPrefs.plist$(ECHO_END)
