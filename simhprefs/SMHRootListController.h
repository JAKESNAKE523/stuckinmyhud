#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSHeaderFooterView.h>
#import <CepheiPrefs/HBRootListController.h>
#import <CepheiPrefs/HBAppearanceSettings.h>
#import <Cephei/HBPreferences.h>
#import "spawn.h"

@interface SMHRootListController : HBRootListController
@property(nonatomic, retain) UIBarButtonItem *respringButton;
@end
@interface SIMHAppearanceSettings : HBAppearanceSettings
@end
