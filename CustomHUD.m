#include "CustomHUD.h"
#import <objc/runtime.h>
#import "RemoteLog.h"

@interface SBVolumeControl : NSObject {
  unsigned long long _mode;
}
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


@implementation customHUD

@synthesize animationSpeed = _animationSpeed;

int interactions = 0;
BOOL isTouching = false;
BOOL isDismissing = false;
-(void)updateVolume:(float)arg1 {
  interactions += 1;

  CGRect newSliderFrame = sliderView.frame;

  if(interactions > 1 && !isTouching){
    newSliderFrame.size.height = 10;
    trackInfoLabel.hidden = YES;
  }

  CGRect newFillFrame = fillView.bounds;
  newFillFrame.size.width = sliderView.bounds.size.width * arg1;
  float modifier = 0;
  if(isDismissing){
    isDismissing = false;
    [self.animator stopAnimation:YES];
    modifier = 0.3;
    newSliderFrame.origin.y = 40;
    dismissalTimer = nil;
    dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(dismissCustomHUD) userInfo:nil repeats:NO];
  } else if(dismissalTimer){
    [dismissalTimer invalidate];
    dismissalTimer = nil;
    dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(dismissCustomHUD) userInfo:nil repeats:NO];
  }


  self.animator = [[UIViewPropertyAnimator alloc] initWithDuration:(0.2f+modifier)/self.animationSpeed dampingRatio:1 animations:^{
    if(!isTouching)
      sliderView.layer.cornerRadius = 3.5;
    [fillView setFrame:newFillFrame];
    [sliderView setFrame:newSliderFrame];
  }];
  [self.animator startAnimation];
}
-(instancetype)initWithFrame:(CGRect)frame{//} vcInstance:(id)volumeControlInstance{
  SBVolumeControl *volumeControl = [objc_getClass("SBVolumeControl") sharedInstance];


  //volumeControl = volumeControlInstance;

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
  //[sliderView setTranslatesAutoresizingMaskIntoConstraints:NO];


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





  self.hidden = YES;

  return (customHUD *) hudWindow;
}
-(void)present{
  if(self.hidden){
    sliderView.layer.cornerRadius = 10;
    dismissalTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(dismissCustomHUD) userInfo:nil repeats:NO];
    self.hidden = NO;
    [UIView animateWithDuration:0.5/self.animationSpeed animations:^{
      sliderView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width*0.05,40,[[UIScreen mainScreen] bounds].size.width * 0.9,40);
    } completion:^(BOOL complete) {

      UIGestureRecognizer *fingerMovement = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(fingerMoved:)];
      [sliderView addGestureRecognizer:fingerMovement];
    }];
    [self updateNowPlayingInfo];
    trackInfoLabel.hidden = NO;

  }
}
-(void)fingerMoved:(UIGestureRecognizer *)gesture {
  SBVolumeControl *volumeControl = [objc_getClass("SBVolumeControl") sharedInstance];
  if(gesture.state == UIGestureRecognizerStateBegan || gesture.state == UIGestureRecognizerStateChanged){
    if(sliderView.bounds.size.height < 50){
    CGRect newSliderFrame = sliderView.frame;
    newSliderFrame.size.height = 50;

    [UIView animateWithDuration:0.2f/self.animationSpeed animations:^{
      sliderView.layer.cornerRadius = 0.2 * newSliderFrame.size.height;
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

    [UIView animateWithDuration:0.2f/self.animationSpeed animations:^{
      sliderView.layer.cornerRadius = 3.5;
      [sliderView setFrame:newSliderFrame];
    }];
    isTouching = false;
  }
}
-(void)dismissCustomHUD {
  RLog(@"Dismissing");

  isDismissing = true;
  [UIView animateWithDuration:0.5f/self.animationSpeed animations:^{
    trackInfoLabel.hidden = YES;
    sliderView.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width*0.05,-45,[[UIScreen mainScreen] bounds].size.width * 0.9,10);
  } completion:^(BOOL finished){
    if(isDismissing){
      isDismissing =false;
      self.hidden = YES;
      interactions = 0;
      isTouching = false;
      [dismissalTimer invalidate];
      dismissalTimer = nil;
      RLog(@"Dismissed");
    }

  }];
}

-(void)updateNowPlayingInfo{
  RLog(@"Loading track info");
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;
      RLog(@"Querying track info");
      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoTitle]) {
        NSString * track = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoTitle];
        trackInfoLabel.text = track;
        RLog(@"Loaded track info");

      }
  });
}
@end
