#include <RemoteLog.h>
#import <MediaRemote/MediaRemote.h>

BOOL enabled;
BOOL alwaysSmall;
float padding;
int mode;

@interface SBElasticSliderView : UIView
@end

@interface SBElasticVolumeViewController : UIViewController
@property (nonatomic,readonly) SBElasticSliderView * sliderView;
@property (nonatomic, retain) UIView * artworkFrame;
@property (nonatomic, retain) UIImageView * imageView;
@property (nonatomic, retain) UIVisualEffectView * blurView;
@property (nonatomic, retain) UIColor * adaptiveColor;
@property BOOL isShown;
@property BOOL enlarged;
@property int axis;
-(UIColor *)averageColorFromImage:(UIImage *)image;
-(void)updateArtwork;
-(void)updateArtworkFrame;
-(UIImage *)getArtwork;
-(void)_actuallyDismiss;
@end
