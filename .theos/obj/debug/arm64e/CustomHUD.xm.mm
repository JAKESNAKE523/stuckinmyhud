#line 1 "CustomHUD.xm"
#include "CustomHUD.h"


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class SBVolumeControl; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBVolumeControl(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBVolumeControl"); } return _klass; }
#line 3 "CustomHUD.xm"
@implementation customHUD

int interactions = 0;
BOOL isTouching = false;
-(void)updateVolume:(float)arg1 {
  interactions += 1;

  CGRect newSliderFrame = sliderView.frame;

  if(interactions > 1 && !isTouching){
    newSliderFrame.size.height = 10;
  }

  CGRect newFillFrame = fillView.bounds;
  newFillFrame.size.width = sliderView.bounds.size.width * arg1;

  if(dismissalTimer){
    [dismissalTimer invalidate];
    dismissalTimer = nil;
    dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(dismissCustomHUD) userInfo:nil repeats:NO];
  }

  [UIView animateWithDuration:0.2f animations:^{
    if(!isTouching)
      sliderView.layer.cornerRadius = 3.5;
    [fillView setFrame:newFillFrame];
    [sliderView setFrame:newSliderFrame];
  }];
}
-(instancetype)initWithFrame:(CGRect)frame{
  volumeControl = [_logos_static_class_lookup$SBVolumeControl() sharedInstance];

  UIWindow *hudWindow = [super initWithFrame:frame];
  hudWindow.hidden = NO;
  hudWindow.windowLevel = UIWindowLevelAlert + 1.0;

  sliderView = [[UIView alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width*0.05,-45,[[UIScreen mainScreen] bounds].size.width * 0.9,40)];
  [sliderView setBackgroundColor:[UIColor clearColor]];
  sliderView.clipsToBounds = YES;
  sliderView.layer.cornerRadius = 0.25 * sliderView.bounds.size.height;

  UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThinMaterialDark]];

  CGRect blurFrame = sliderView.bounds;
  blurFrame.size.height = 100;
  [blurView setFrame:blurFrame];
  [sliderView addSubview:blurView];
  


  fillView = [[UIView alloc] initWithFrame:CGRectMake(0,0,sliderView.frame.size.width*[volumeControl _getMediaVolumeForIAP],100)];
  [fillView setBackgroundColor:[UIColor clearColor]];
  fillView.clipsToBounds = YES;

  UIVisualEffectView *fillBlurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleSystemThickMaterialLight]];
  CGRect fillBlurFrame = sliderView.bounds;
  fillBlurFrame.size.height = 100;
  [fillBlurView setFrame:fillBlurFrame];

  [fillView addSubview:fillBlurView];
  [sliderView addSubview:fillView];

  hudWindow.userInteractionEnabled = YES;
  sliderView.userInteractionEnabled = YES;
  blurView.userInteractionEnabled = NO;
  fillBlurView.userInteractionEnabled = NO;

  [hudWindow addSubview:sliderView];

  trackInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,100,30)];
  trackInfoLabel.text = @"";
  trackInfoLabel.numberOfLines = 1;
  trackInfoLabel.adjustsFontSizeToFitWidth = YES;
  trackInfoLabel.clipsToBounds = YES;
  trackInfoLabel.backgroundColor = [UIColor clearColor];
  trackInfoLabel.textColor = [UIColor blackColor];
  trackInfoLabel.textAlignment = NSTextAlignmentCenter;
  [trackInfoLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
  [sliderView addSubview:trackInfoLabel];

  NSLayoutConstraint *labelWidthConstraint = [NSLayoutConstraint
                                        constraintWithItem:trackInfoLabel
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:sliderView
                                        attribute:NSLayoutAttributeWidth
                                        multiplier:0.8
                                        constant:0];
  NSLayoutConstraint *labelHeightConstraint = [NSLayoutConstraint
                                        constraintWithItem:trackInfoLabel
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:sliderView
                                        attribute:NSLayoutAttributeHeight
                                        multiplier:1
                                        constant:0];
  NSLayoutConstraint *labelXConstraint = [NSLayoutConstraint
                                        constraintWithItem:trackInfoLabel
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:sliderView
                                        attribute:NSLayoutAttributeCenterX
                                        multiplier:1
                                        constant:0];
  NSLayoutConstraint *labelYConstraint = [NSLayoutConstraint
                                        constraintWithItem:trackInfoLabel
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:sliderView
                                        attribute:NSLayoutAttributeCenterY
                                        multiplier:1
                                        constant:0];
  [sliderView addConstraint:labelWidthConstraint];
  [sliderView addConstraint:labelHeightConstraint];
  [sliderView addConstraint:labelXConstraint];
  [sliderView addConstraint:labelYConstraint];



  [self updateNowPlayingInfo];

  dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(dismissCustomHUD) userInfo:nil repeats:NO];


  [UIView animateWithDuration:0.5 animations:^{
    sliderView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width*0.05,40,[[UIScreen mainScreen] bounds].size.width * 0.9,40);
  } completion:^(BOOL complete) {

    UIGestureRecognizer *fingerMovement = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(fingerMoved:)];
    [sliderView addGestureRecognizer:fingerMovement];
  }];
  return (customHUD *) hudWindow;
}
-(void)fingerMoved:(UIGestureRecognizer *)gesture {
  if(gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged){
    if(sliderView.bounds.size.height < 50){
    CGRect newSliderFrame = sliderView.frame;
    newSliderFrame.size.height = 50;

    [UIView animateWithDuration:0.2f animations:^{
      sliderView.layer.cornerRadius = 0.25 * sliderView.bounds.size.height;
      [sliderView setFrame:newSliderFrame];
      }];
    }

    CGPoint fingerLoc = [gesture locationInView:sliderView];
    float volume = fingerLoc.x > sliderView.bounds.size.width ? 1 : (fingerLoc.x < 0 ? 0 : fingerLoc.x/sliderView.bounds.size.width);

    isTouching = true;

    if ([volumeControl respondsToSelector:@selector(setMediaVolume:)]) [volumeControl setMediaVolume:volume];
    else if ([volumeControl respondsToSelector:@selector(_setMediaVolumeForIAP:)]) [volumeControl _setMediaVolumeForIAP:volume];
  } else {
    CGRect newSliderFrame = sliderView.frame;
    newSliderFrame.size.height = 10;

    [UIView animateWithDuration:0.2f animations:^{
      sliderView.layer.cornerRadius = 3.5;
      [sliderView setFrame:newSliderFrame];
    }];
    isTouching = false;
  }
}
-(void)dismissCustomHUD {
  isTouching = false;
  [dismissalTimer invalidate];
  dismissalTimer = nil;
  [UIView animateWithDuration:0.5f animations:^{
    sliderView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width*0.05,-45,[[UIScreen mainScreen] bounds].size.width * 0.9,10);
  } completion:^(BOOL finished){
    self.hidden = YES;
    
  }];
}
-(void)updateNowPlayingInfo{
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoTitle]) {
        NSString * track = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle];
        trackInfoLabel.text = track;
      }
  });
}
@end
#line 188 "CustomHUD.xm"
