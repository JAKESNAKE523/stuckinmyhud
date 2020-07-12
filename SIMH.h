#include <RemoteLog.h>
#import <MediaRemote/MediaRemote.h>
#import "CustomHUD.h"

BOOL enabled;
BOOL useCustomHUD;
int sizingMode;
float padding;
BOOL dynamicColors;
float colorAlpha;
int viewMode;
BOOL isInitialized;
BOOL isVisible;
float animationSpeed;

void updatePrefs();
void updatePrefs_HP();
void init();

@interface SBElasticSliderView : UIView
@end

@interface SBElasticVolumeViewController : UIViewController
@property (nonatomic,readonly) SBElasticSliderView * sliderView;
@property (nonatomic, retain) UIView * artworkFrame;
@property (nonatomic, retain) UIImageView * imageView;
@property (nonatomic, retain) UIVisualEffectView * blurView;
@property (nonatomic, retain) UIColor * adaptiveColor;
@property (nonatomic, retain) NSLayoutConstraint *ypositionConstraint;
@property (nonatomic, retain) NSLayoutConstraint *xpositionConstraint;
@property (nonatomic, retain) NSLayoutConstraint *heightConstraint;
@property (nonatomic, retain) NSLayoutConstraint *widthConstraint;
@property (nonatomic, retain) NSLayoutConstraint *imageHeightConstraint;
@property (nonatomic, retain) NSLayoutConstraint *imageWidthConstraint;
@property BOOL isShown;
@property BOOL enlarged;
@property int axis;
-(void)updatePadding;
-(void)updateArtwork;
-(void)updateArtworkFrame;
-(UIImage *)getArtwork;
-(void)_actuallyDismiss;
+ (instancetype)sharedInstance;
@end

@interface SBVolumeControl : NSObject {
  	unsigned long long _mode;
}
@property (nonatomic, retain) customHUD * volHUD;
@property (nonatomic, retain) UIWindow * hudWindow;
@property (nonatomic, retain) UIView * sliderView;
@property (nonatomic, retain) UIView * fillView;
@property (nonatomic, retain) UILabel * trackInfoLabel;
@property (nonatomic, retain) NSTimer *dismissalTimer;
+ (id)sharedInstance;
-(void)presentCustomHUD:(float)arg1;
-(void)_presentVolumeHUDWithVolume:(float)arg1;
-(void)fingerMoved:(UIGestureRecognizer *)gesture;
-(void)_updateEffectiveVolume:(float)arg1;
-(void)setVolume:(float)arg1 forCategory:(id)arg2 ;
+ (instancetype)sharedVolumeControl;
- (float)getMediaVolume;
- (void)setMediaVolume:(float)volume;
-(void)_setMediaVolumeForIAP:(float)arg1 ;
-(void)updateNowPlayingInfo;
-(void)_presentVolumeHUDWithVolume:(float)arg1 ;
-(float)_getMediaVolumeForIAP;
+ (instancetype)sharedInstance;
@end

@interface VolumeControl : NSObject
@property (nonatomic, retain) customHUD * volHUD;
-(void)presentCustomHUD:(float)arg1;
-(void)_presentVolumeHUDWithVolume:(float)arg1;
-(void)_effectiveVolumeChanged:(id)arg1 ;
-(void)_presentVolumeHUDWithMode:(int)arg1 volume:(float)arg2 ;
@end

@interface SBMediaController : NSObject
@property (assign) BOOL suppressHUD;
-(void)setVolume:(float)arg1;
+(id)sharedInstance;
@end

@interface SBVolumeHUDView : UIView
-(void)updateArtwork;
@property (nonatomic, retain) UIImageView * imageView;
@end

@interface SBHUDController : NSObject
@property (nonatomic, retain) customHUD * volHUD;
-(void)presentHUDView:(id)arg1 autoDismissWithDelay:(double)arg2 ;
@end
@interface tweakUtils : NSObject
+(UIColor *)averageColorFromImage:(UIImage *)image;

@end
