#import <MediaRemote/MediaRemote.h>
#import <UIKit/UIKit.h>

@interface customHUD : UIWindow{
  UIView * sliderView;
  UIView * fillView;
  UILabel * trackInfoLabel;
  NSTimer * dismissalTimer;
}
@property (strong, nonatomic) UIViewPropertyAnimator *animator;
@property float animationSpeed;
-(instancetype)initWithFrame:(CGRect)frame;
-(void)updateVolume:(float)arg1;
-(void)present;


@end
