#include "SIMH.h"
#import <MediaPlayer/MediaPlayer.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

NSDictionary *tweakSettings;

@implementation tweakUtils
+(UIColor *)averageColorFromImage:(UIImage *)image {

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char rgba[4];
    CGContextRef context = CGBitmapContextCreate(rgba, 1, 1, 8, 4, colorSpace, kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);

    CGContextDrawImage(context, CGRectMake(0, 0, 1, 1), image.CGImage);
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(context);

    if(rgba[3] > 0) {
        CGFloat alpha = ((CGFloat)rgba[3])/255.0;
        CGFloat multiplier = alpha/255.0;
        return [UIColor colorWithRed:((CGFloat)rgba[0])*multiplier
                               green:((CGFloat)rgba[1])*multiplier
                                blue:((CGFloat)rgba[2])*multiplier
                               alpha:colorAlpha];
    }
    else {
        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0
                               green:((CGFloat)rgba[1])/255.0
                                blue:((CGFloat)rgba[2])/255.0
                               alpha:colorAlpha];
    }
}
@end
%group Tweak
%hook SBElasticVolumeViewController
%property (assign) BOOL isShown;
%property (nonatomic, retain) UIView *artworkFrame;
%property (nonatomic, retain) UIImageView * imageView;
%property (nonatomic, retain) UIVisualEffectView * blurView;
%property (nonatomic, retain) NSLayoutConstraint *xpositionConstraint;
%property (nonatomic, retain) NSLayoutConstraint *ypositionConstraint;
%property (nonatomic, retain) NSLayoutConstraint *widthConstraint;
%property (nonatomic, retain) NSLayoutConstraint *heightConstraint;
%property (nonatomic, retain) NSLayoutConstraint *imageWidthConstraint;
%property (nonatomic, retain) NSLayoutConstraint *imageHeightConstraint;
-(void)init{
  RLog(@"VolController!");
  %orig;
}
-(void)viewDidLoad{
  %orig;


  if(!self.artworkFrame){
    NSInteger state = MSHookIvar<NSInteger>(self, "_state");
    RLog(@"YELLO W%d", state);
    CGRect frame;
    if((state == 1 || state == 3) && sizingMode != 0){
      frame = CGRectMake(20,0,200,200);
    } else {
      frame = CGRectMake(100,-70,60,60);
    }
    UIView* artworkFrame = [[UIView alloc]initWithFrame:frame];

    [artworkFrame setBackgroundColor:[UIColor clearColor]];
    artworkFrame.clipsToBounds = YES;
    artworkFrame.layer.cornerRadius = 0.2 * self.sliderView.bounds.size.height;
    [artworkFrame setTranslatesAutoresizingMaskIntoConstraints:NO];


    UIVisualEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];//UIBlurEffectStyleRegular
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    blurView.hidden = YES;
    blurView.frame = artworkFrame.bounds;
    [blurView setTranslatesAutoresizingMaskIntoConstraints:NO];


    NSLayoutConstraint *blurWidthConstraint = [NSLayoutConstraint
                                          constraintWithItem:blurView
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeWidth
                                          multiplier:1.0
                                          constant:0];

    NSLayoutConstraint *blurHeightConstraint = [NSLayoutConstraint
                                          constraintWithItem:blurView
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1.0
                                          constant:0];
    NSLayoutConstraint *centreYConstraintBlurView = [NSLayoutConstraint
                                          constraintWithItem:blurView
                                          attribute:NSLayoutAttributeCenterX
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeCenterX
                                          multiplier:1.0
                                          constant:0];

    [artworkFrame addConstraint:blurHeightConstraint];
    [artworkFrame addConstraint:blurWidthConstraint];
    [artworkFrame addConstraint:centreYConstraintBlurView];

    [artworkFrame addSubview:blurView];

    [self.sliderView addSubview:artworkFrame];

    self.ypositionConstraint = [NSLayoutConstraint
                                          constraintWithItem:artworkFrame
                                          attribute:NSLayoutAttributeCenterY
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.sliderView
                                          attribute:NSLayoutAttributeCenterY
                                          multiplier:1.0
                                          constant:0];
    self.xpositionConstraint = [NSLayoutConstraint
                                          constraintWithItem:artworkFrame
                                          attribute:NSLayoutAttributeLeft
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.sliderView
                                          attribute:NSLayoutAttributeRight
                                          multiplier:1.0
                                          constant:8];
    self.heightConstraint = [NSLayoutConstraint
                                          constraintWithItem:artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.sliderView
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1.0
                                          constant:0];

    self.widthConstraint = [NSLayoutConstraint
                                          constraintWithItem:artworkFrame
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.sliderView
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1.0
                                          constant:0];

    [self.sliderView addConstraint:self.xpositionConstraint];
    [self.sliderView addConstraint:self.ypositionConstraint];
    [self.sliderView addConstraint:self.heightConstraint];
    [self.sliderView addConstraint:self.widthConstraint];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(artworkFrame.bounds.origin.x + artworkFrame.bounds.size.width*padding,artworkFrame.bounds.origin.y + artworkFrame.bounds.size.height*padding, artworkFrame.bounds.size.width*(1-padding), artworkFrame.bounds.size.height*(1-padding))];
    [self updateArtwork];
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 0.2 * imageView.bounds.size.height;
    [imageView setBackgroundColor:[UIColor clearColor]];
    [artworkFrame addSubview:imageView];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSLayoutConstraint *centreXConstraintImgView = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeCenterX
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeCenterX
                                          multiplier:1.0
                                          constant:0];
    NSLayoutConstraint *centreYConstraintImgView = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeCenterY
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeCenterY
                                          multiplier:1.0
                                          constant:0];
    self.imageHeightConstraint = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1-(padding*2)
                                          constant:0];

    self.imageWidthConstraint = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1-(padding*2)
                                          constant:0];
    [artworkFrame addConstraint:centreXConstraintImgView];
    [artworkFrame addConstraint:centreYConstraintImgView];
    [artworkFrame addConstraint:self.imageHeightConstraint];
    [artworkFrame addConstraint:self.imageWidthConstraint];

    self.artworkFrame = artworkFrame;
    self.imageView = imageView;
    self.blurView = blurView;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatePadding:) name:@"HPlus" object:nil];
  }
}
%new -(void)updatePadding:(NSNotification *)notification {
  RLog(@"Try Update");
  if(self.imageView){
    RLog(@"UPDATING IMAGE PADIDNG");
      [self.artworkFrame removeConstraint:self.imageWidthConstraint];
      [self.artworkFrame removeConstraint:self.imageHeightConstraint];

    self.imageHeightConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.imageView
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1-(padding*2)
                                          constant:0];

    self.imageWidthConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.imageView
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1-(padding*2)
                                          constant:0];
    [self.artworkFrame addConstraint:self.imageWidthConstraint];
    [self.artworkFrame addConstraint:self.imageHeightConstraint];
    [UIView animateWithDuration:0.5f/animationSpeed animations:^{
      [self.artworkFrame layoutIfNeeded];
    }];
  }
}
-(void)transitionToState:(long long)state animated:(BOOL)arg2 completion:(id)arg3{

    %orig;
    [self updateArtworkFrame];

}
-(void)_updateForAxisChange:(int)arg1{
  %orig;
  [self updateArtworkFrame];
}
-(void)_scheduleDismissal:(id)arg1 {

  %orig;
  if([[NSString stringWithFormat:@"%@", arg1] isEqual:@"Deflator-transition-out-guard"]){
    [self.sliderView removeConstraint:self.heightConstraint];
    [self.sliderView removeConstraint:self.widthConstraint];
    self.heightConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.artworkFrame
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.sliderView
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:0.4
                                          constant:0];

    self.widthConstraint = [NSLayoutConstraint
                                          constraintWithItem:self.artworkFrame
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self.sliderView
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:0.4
                                          constant:0];
    [self.sliderView addConstraint:self.heightConstraint];
    [self.sliderView addConstraint:self.widthConstraint];

    [UIView animateWithDuration:0.5f/animationSpeed animations:^{
      [self.sliderView layoutIfNeeded];
    }];
      RLog(@"Did Do");
  } else
  {
    RLog(@"%@", arg1);
    //RLog(@"Y %d", self.artworkFrame.bounds.origin.y);
  }

}
%new -(void)updateArtworkFrame{
  //CGRect frame;
  //CGRect imageFrame;
  NSInteger state = MSHookIvar<NSInteger>(self, "_state");
  RLog(@"%d %d",state,sizingMode);
  if(self.axis == 1 && self.artworkFrame){
    //Landscape
    if((state == 1 || state == 3 || (sizingMode == 3 && state == 2)) && sizingMode != 1){
      //Big
      [self.sliderView removeConstraint:self.heightConstraint];
      [self.sliderView removeConstraint:self.widthConstraint];
      [self.sliderView removeConstraint:self.xpositionConstraint];
      [self.sliderView removeConstraint:self.ypositionConstraint];

      self.heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeWidth
                                            multiplier:0.7
                                            constant:0];

      self.widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeWidth
                                            multiplier:0.7
                                            constant:0];

      self.xpositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeCenterX
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeCenterX
                                            multiplier:1.0
                                            constant:0];
      self.ypositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeTop
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeBottom
                                            multiplier:1.0
                                            constant:8];
      [self.sliderView addConstraint:self.heightConstraint];
      [self.sliderView addConstraint:self.widthConstraint];
      [self.sliderView addConstraint:self.xpositionConstraint];
      [self.sliderView addConstraint:self.ypositionConstraint];

    }else if(state == 2 || (state != 0 && sizingMode == 1)){
      //Small
      [self.sliderView removeConstraint:self.xpositionConstraint];
      [self.sliderView removeConstraint:self.heightConstraint];
      [self.sliderView removeConstraint:self.widthConstraint];
      [self.sliderView removeConstraint:self.ypositionConstraint];

      self.heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeWidth
                                            multiplier:0.2
                                            constant:0];
      self.xpositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeLeft
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                            constant:8];
      self.widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeWidth
                                            multiplier:0.2
                                            constant:0];

      self.ypositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute: NSLayoutAttributeTop
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                            constant:0];

      [self.sliderView addConstraint:self.heightConstraint];
      [self.sliderView addConstraint:self.widthConstraint];
      [self.sliderView addConstraint:self.xpositionConstraint];
      [self.sliderView addConstraint:self.ypositionConstraint];

    } else {
      [self.sliderView removeConstraint:self.heightConstraint];
      [self.sliderView removeConstraint:self.widthConstraint];
      self.heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:0.1
                                            constant:0];

      self.widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:0.1
                                            constant:0];
      [self.sliderView addConstraint:self.heightConstraint];
      [self.sliderView addConstraint:self.widthConstraint];
    }
  } else if (self.artworkFrame){
    //Portrait
    if((state == 1 || state == 3 || (sizingMode == 3 && state == 2)) && sizingMode != 1){
      //Big
      [self.sliderView removeConstraint:self.heightConstraint];
      [self.sliderView removeConstraint:self.widthConstraint];
      [self.sliderView removeConstraint:self.xpositionConstraint];
      [self.sliderView removeConstraint:self.ypositionConstraint];

      self.heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:1.0
                                            constant:0];

      self.widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:1.0
                                            constant:0];

      self.xpositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeLeft
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeRight
                                            multiplier:1.0
                                            constant:8];
      self.ypositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeCenterY
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeCenterY
                                            multiplier:1.0
                                            constant:0];
      [self.sliderView addConstraint:self.heightConstraint];
      [self.sliderView addConstraint:self.widthConstraint];
      [self.sliderView addConstraint:self.xpositionConstraint];
      [self.sliderView addConstraint:self.ypositionConstraint];

    }else if(state == 2 || (state != 0 && sizingMode == 1)){
      //Small
      [self.sliderView removeConstraint:self.xpositionConstraint];
      [self.sliderView removeConstraint:self.heightConstraint];
      [self.sliderView removeConstraint:self.widthConstraint];
      [self.sliderView removeConstraint:self.ypositionConstraint];

      self.heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:0.4
                                            constant:0];
      self.xpositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeLeft
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeLeft
                                            multiplier:1.0
                                            constant:0];
      self.widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:0.4
                                            constant:0];

      self.ypositionConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute: NSLayoutAttributeBottom
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeTop
                                            multiplier:1.0
                                            constant:-8];

      [self.sliderView addConstraint:self.heightConstraint];
      [self.sliderView addConstraint:self.widthConstraint];
      [self.sliderView addConstraint:self.xpositionConstraint];
      [self.sliderView addConstraint:self.ypositionConstraint];

    } else {
      [self.sliderView removeConstraint:self.heightConstraint];
      [self.sliderView removeConstraint:self.widthConstraint];
      self.heightConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeHeight
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:0.1
                                            constant:0];

      self.widthConstraint = [NSLayoutConstraint
                                            constraintWithItem:self.artworkFrame
                                            attribute:NSLayoutAttributeWidth
                                            relatedBy:NSLayoutRelationEqual
                                            toItem:self.sliderView
                                            attribute:NSLayoutAttributeHeight
                                            multiplier:0.1
                                            constant:0];
      [self.sliderView addConstraint:self.heightConstraint];
      [self.sliderView addConstraint:self.widthConstraint];
    }

  }




  [UIView animateWithDuration:0.5f/animationSpeed animations:^{
    [self.sliderView layoutIfNeeded];
    if(state != 3){
      self.artworkFrame.layer.cornerRadius = 0.2 * self.artworkFrame.bounds.size.height;
      self.imageView.layer.cornerRadius = 0.2 * self.imageView.bounds.size.height;

    }
  }];


  //Check that the state is a nonzero number
  //If it isn't, then the view is exiting or entering and may not exist or already have been disposed of.
  if(state){
    [self updateArtwork];
  }
}
%new -(void)updateArtwork{
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          UIImage * artwork = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
            self.imageView.image = artwork;
            if(dynamicColors){
              self.artworkFrame.backgroundColor = [tweakUtils averageColorFromImage:artwork];
              //TODO add blurred artwork as background
            }
            self.artworkFrame.alpha = 1;
      } else{
        self.artworkFrame.alpha = 0;
      }
  });
}
%end
%end
%group iOS12
%hook SBVolumeHUDView
-(void)viewDidLoad{
  %orig;

}
%end
%end
%group customHUDGroup
%hook SBVolumeControl
%property (nonatomic, retain) customHUD * volHUD;
%property (nonatomic, retain) UIWindow * hudWindow;
%property (nonatomic, retain) UIView * sliderView;
%property (nonatomic, retain) UIView * fillView;
%property (nonatomic, retain) UILabel * trackInfoLabel;
%property (nonatomic, retain) NSTimer * dismissalTimer;


-(void)_presentVolumeHUDWithVolume:(float)arg1 {
  if(!self.volHUD){
    self.volHUD = [[customHUD alloc] initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,160)];
  }
  [self.volHUD setAnimationSpeed:animationSpeed];
  [self.volHUD present];
}
-(void)_updateEffectiveVolume:(float)arg1 {
  [self.volHUD updateVolume:arg1];
}
%end
%end
%group iOS12
%hook SBVolumeHUDView
%property (nonatomic, retain) UIImageView * imageView;
-(void)didMoveToSuperview {
  if(!self.imageView){

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
    [self updateArtwork];
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 0.2 * imageView.bounds.size.height;
    [imageView setBackgroundColor:[UIColor clearColor]];
    //[self addSubview:imageView];
    [self insertSubview:imageView atIndex:1];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];

    NSLayoutConstraint *centreXConstraintImgView = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeCenterX
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeCenterX
                                          multiplier:1.0
                                          constant:0];
    NSLayoutConstraint *centreYConstraintImgView = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeCenterY
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeCenterY
                                          multiplier:1.0
                                          constant:0];
    NSLayoutConstraint *heightConstraintIV = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeHeight
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1
                                          constant:0];

    NSLayoutConstraint *widthConstraintIV = [NSLayoutConstraint
                                          constraintWithItem:imageView
                                          attribute:NSLayoutAttributeWidth
                                          relatedBy:NSLayoutRelationEqual
                                          toItem:self
                                          attribute:NSLayoutAttributeHeight
                                          multiplier:1
                                          constant:0];
    [self addConstraint:centreXConstraintImgView];
    [self addConstraint:centreYConstraintImgView];
    [self addConstraint:heightConstraintIV];
    [self addConstraint:widthConstraintIV];

    self.imageView = imageView;
  }
}
%new -(void)updateArtwork{
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          UIImage * artwork = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
            self.imageView.image = artwork;
            if(dynamicColors){
              self.imageView.backgroundColor = [tweakUtils averageColorFromImage:artwork];
            }
      } else{
        self.imageView.alpha = 0;
      }
  });
}

%end
%end

%group 12customHUD
%hook VolumeControl


-(void)_presentVolumeHUDWithMode:(int)arg1 volume:(float)arg2 {
/*  if(!self.volHUD){
    self.volHUD = [[customHUD alloc] initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,160)];
  }
  [self.volHUD setAnimationSpeed:animationSpeed];
  [self.volHUD present];*/
  %orig;
}
-(void)setMediaVolume:(float)arg1 {
  //[self.volHUD updateVolume:arg1];
  %orig;
}
%end
%hook SBHUDController
%property (nonatomic, retain) customHUD * volHUD;
-(void) presentHUDView:(id)arg1 autoDismissWithDelay:(double)arg2{
  if(!self.volHUD){
    self.volHUD = [[customHUD alloc] initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,160)];
  }
  [self.volHUD setAnimationSpeed:animationSpeed];
  //[self.volHUD updateVolume]
  [self.volHUD present];
}
%end
%end

%ctor{
  updatePrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs, CFSTR("com.jakesnake.simhprefs/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs_HP, CFSTR("com.jakesnake.simhprefs/changed_hp"), NULL, CFNotificationSuspensionBehaviorCoalesce);
  init();
}

void init(){
  if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13.0") && enabled){
    if(!useCustomHUD){
      %init(Tweak)
    } else if(useCustomHUD){
      %init(customHUDGroup)
    }
  } else if(enabled){
    if(!useCustomHUD){
      %init(iOS12)
    } else{
      %init(12customHUD)
    }
  }
}

void updatePrefs() {
  RLog(@"Changing prefs");
  tweakSettings = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.jakesnake.simhprefs"];

  enabled = [tweakSettings objectForKey:@"isEnabled"] ? [[tweakSettings objectForKey:@"isEnabled"] boolValue] : YES;
  useCustomHUD = [tweakSettings objectForKey:@"customHUD"] ? [[tweakSettings objectForKey:@"customHUD"] boolValue] : NO;
  sizingMode = [tweakSettings objectForKey:@"sizingMode"] ? [[tweakSettings objectForKey:@"sizingMode"] intValue] : 2;
  padding = [tweakSettings objectForKey:@"padding"] ? [[tweakSettings objectForKey:@"padding"] floatValue] / 100 : 0.2;
  dynamicColors = [tweakSettings objectForKey:@"dynamicColors"] ? [[tweakSettings objectForKey:@"dynamicColors"] boolValue] : YES;
  colorAlpha = [tweakSettings objectForKey:@"colorAlpha"] ? [[tweakSettings objectForKey:@"colorAlpha"] floatValue] : 0.0;
  animationSpeed = [tweakSettings objectForKey:@"animationSpeed"] ? [[tweakSettings objectForKey:@"animationSpeed"] floatValue] : 1.0;

}
void updatePrefs_HP() {
  RLog(@"Changing prefs HP");
  updatePrefs();


  if(isInitialized){

    [[%c(SBVolumeControl) sharedInstance] _setMediaVolumeForIAP:[[%c(SBVolumeControl) sharedInstance] _getMediaVolumeForIAP]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HPlus" object:nil];
  } else {
    isInitialized = TRUE;
  }

}
