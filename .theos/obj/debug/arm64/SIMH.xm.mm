#line 1 "SIMH.xm"
#include "SIMH.h"
#import <MediaPlayer/MediaPlayer.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

NSDictionary *tweakSettings;


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

@class SBVolumeHUDView; @class SBElasticVolumeViewController; @class SBVolumeControl; @class SBHUDController; @class VolumeControl; 

static __inline__ __attribute__((always_inline)) __attribute__((unused)) Class _logos_static_class_lookup$SBVolumeControl(void) { static Class _klass; if(!_klass) { _klass = objc_getClass("SBVolumeControl"); } return _klass; }
#line 12 "SIMH.xm"
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
static void (*_logos_orig$Tweak$SBElasticVolumeViewController$init)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Tweak$SBElasticVolumeViewController$init(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Tweak$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Tweak$SBElasticVolumeViewController$updatePadding$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, NSNotification *); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$_updateForAxisChange$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$Tweak$SBElasticVolumeViewController$_updateForAxisChange$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, int); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$_scheduleDismissal$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Tweak$SBElasticVolumeViewController$_scheduleDismissal$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); 

__attribute__((used)) static BOOL _logos_method$Tweak$SBElasticVolumeViewController$isShown(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$isShown); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setIsShown(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$isShown, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIView * _logos_method$Tweak$SBElasticVolumeViewController$artworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$artworkFrame); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setArtworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$artworkFrame, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImageView * _logos_method$Tweak$SBElasticVolumeViewController$imageView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageView); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setImageView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIVisualEffectView * _logos_method$Tweak$SBElasticVolumeViewController$blurView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIVisualEffectView *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$blurView); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setBlurView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIVisualEffectView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$blurView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$Tweak$SBElasticVolumeViewController$xpositionConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$xpositionConstraint); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setXpositionConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$xpositionConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$Tweak$SBElasticVolumeViewController$ypositionConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$ypositionConstraint); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setYpositionConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$ypositionConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$Tweak$SBElasticVolumeViewController$widthConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$widthConstraint); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setWidthConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$widthConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$Tweak$SBElasticVolumeViewController$heightConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$heightConstraint); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setHeightConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$heightConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$Tweak$SBElasticVolumeViewController$imageWidthConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageWidthConstraint); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setImageWidthConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageWidthConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSLayoutConstraint * _logos_method$Tweak$SBElasticVolumeViewController$imageHeightConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (NSLayoutConstraint *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageHeightConstraint); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setImageHeightConstraint(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, NSLayoutConstraint * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageHeightConstraint, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$Tweak$SBElasticVolumeViewController$init(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  RLog(@"VolController!");
  _logos_orig$Tweak$SBElasticVolumeViewController$init(self, _cmd);
}
static void _logos_method$Tweak$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$Tweak$SBElasticVolumeViewController$viewDidLoad(self, _cmd);


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


    UIVisualEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
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
 static void _logos_method$Tweak$SBElasticVolumeViewController$updatePadding$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, NSNotification * notification) {
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
static void _logos_method$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long state, BOOL arg2, id arg3){

    _logos_orig$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$(self, _cmd, state, arg2, arg3);
    [self updateArtworkFrame];

}
static void _logos_method$Tweak$SBElasticVolumeViewController$_updateForAxisChange$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1){
  _logos_orig$Tweak$SBElasticVolumeViewController$_updateForAxisChange$(self, _cmd, arg1);
  [self updateArtworkFrame];
}
static void _logos_method$Tweak$SBElasticVolumeViewController$_scheduleDismissal$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

  _logos_orig$Tweak$SBElasticVolumeViewController$_scheduleDismissal$(self, _cmd, arg1);
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
    
  }

}
 static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  
  
  NSInteger state = MSHookIvar<NSInteger>(self, "_state");
  RLog(@"%d %d",state,sizingMode);
  if(self.axis == 1 && self.artworkFrame){
    
    if((state == 1 || state == 3 || (sizingMode == 3 && state == 2)) && sizingMode != 1){
      
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
    
    if((state == 1 || state == 3 || (sizingMode == 3 && state == 2)) && sizingMode != 1){
      
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


  
  
  if(state){
    [self updateArtwork];
  }
}
 static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          UIImage * artwork = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
            self.imageView.image = artwork;
            if(dynamicColors){
              self.artworkFrame.backgroundColor = [tweakUtils averageColorFromImage:artwork];
              
            }
            self.artworkFrame.alpha = 1;
      } else{
        self.artworkFrame.alpha = 0;
      }
  });
}


static void (*_logos_orig$iOS12$SBVolumeHUDView$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST, SEL); static void _logos_method$iOS12$SBVolumeHUDView$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$iOS12$SBVolumeHUDView$didMoveToSuperview)(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST, SEL); static void _logos_method$iOS12$SBVolumeHUDView$didMoveToSuperview(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST, SEL); static void _logos_method$iOS12$SBVolumeHUDView$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST, SEL); 

static void _logos_method$iOS12$SBVolumeHUDView$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$iOS12$SBVolumeHUDView$viewDidLoad(self, _cmd);

}


static void (*_logos_orig$customHUDGroup$SBVolumeControl$_presentVolumeHUDWithVolume$)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL, float); static void _logos_method$customHUDGroup$SBVolumeControl$_presentVolumeHUDWithVolume$(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL, float); static void (*_logos_orig$customHUDGroup$SBVolumeControl$_updateEffectiveVolume$)(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL, float); static void _logos_method$customHUDGroup$SBVolumeControl$_updateEffectiveVolume$(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST, SEL, float); 

__attribute__((used)) static customHUD * _logos_method$customHUDGroup$SBVolumeControl$volHUD(SBVolumeControl * __unused self, SEL __unused _cmd) { return (customHUD *)objc_getAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$volHUD); }; __attribute__((used)) static void _logos_method$customHUDGroup$SBVolumeControl$setVolHUD(SBVolumeControl * __unused self, SEL __unused _cmd, customHUD * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$volHUD, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIWindow * _logos_method$customHUDGroup$SBVolumeControl$hudWindow(SBVolumeControl * __unused self, SEL __unused _cmd) { return (UIWindow *)objc_getAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$hudWindow); }; __attribute__((used)) static void _logos_method$customHUDGroup$SBVolumeControl$setHudWindow(SBVolumeControl * __unused self, SEL __unused _cmd, UIWindow * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$hudWindow, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIView * _logos_method$customHUDGroup$SBVolumeControl$sliderView(SBVolumeControl * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$sliderView); }; __attribute__((used)) static void _logos_method$customHUDGroup$SBVolumeControl$setSliderView(SBVolumeControl * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$sliderView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIView * _logos_method$customHUDGroup$SBVolumeControl$fillView(SBVolumeControl * __unused self, SEL __unused _cmd) { return (UIView *)objc_getAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$fillView); }; __attribute__((used)) static void _logos_method$customHUDGroup$SBVolumeControl$setFillView(SBVolumeControl * __unused self, SEL __unused _cmd, UIView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$fillView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$customHUDGroup$SBVolumeControl$trackInfoLabel(SBVolumeControl * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$trackInfoLabel); }; __attribute__((used)) static void _logos_method$customHUDGroup$SBVolumeControl$setTrackInfoLabel(SBVolumeControl * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$trackInfoLabel, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static NSTimer * _logos_method$customHUDGroup$SBVolumeControl$dismissalTimer(SBVolumeControl * __unused self, SEL __unused _cmd) { return (NSTimer *)objc_getAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$dismissalTimer); }; __attribute__((used)) static void _logos_method$customHUDGroup$SBVolumeControl$setDismissalTimer(SBVolumeControl * __unused self, SEL __unused _cmd, NSTimer * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$customHUDGroup$SBVolumeControl$dismissalTimer, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }


static void _logos_method$customHUDGroup$SBVolumeControl$_presentVolumeHUDWithVolume$(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, float arg1) {
  if(!self.volHUD){
    self.volHUD = [[customHUD alloc] initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,160)];
  }
  [self.volHUD setAnimationSpeed:animationSpeed];
  [self.volHUD present];
}
static void _logos_method$customHUDGroup$SBVolumeControl$_updateEffectiveVolume$(_LOGOS_SELF_TYPE_NORMAL SBVolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, float arg1) {
  [self.volHUD updateVolume:arg1];
}




__attribute__((used)) static UIImageView * _logos_method$iOS12$SBVolumeHUDView$imageView(SBVolumeHUDView * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_method$iOS12$SBVolumeHUDView$imageView); }; __attribute__((used)) static void _logos_method$iOS12$SBVolumeHUDView$setImageView(SBVolumeHUDView * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$iOS12$SBVolumeHUDView$imageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$iOS12$SBVolumeHUDView$didMoveToSuperview(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
  if(!self.imageView){

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,10,10)];
    [self updateArtwork];
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 0.2 * imageView.bounds.size.height;
    [imageView setBackgroundColor:[UIColor clearColor]];
    
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
 static void _logos_method$iOS12$SBVolumeHUDView$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBVolumeHUDView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
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




static void (*_logos_orig$12customHUD$VolumeControl$_presentVolumeHUDWithMode$volume$)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL, int, float); static void _logos_method$12customHUD$VolumeControl$_presentVolumeHUDWithMode$volume$(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL, int, float); static void (*_logos_orig$12customHUD$VolumeControl$setMediaVolume$)(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL, float); static void _logos_method$12customHUD$VolumeControl$setMediaVolume$(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST, SEL, float); static void (*_logos_orig$12customHUD$SBHUDController$presentHUDView$autoDismissWithDelay$)(_LOGOS_SELF_TYPE_NORMAL SBHUDController* _LOGOS_SELF_CONST, SEL, id, double); static void _logos_method$12customHUD$SBHUDController$presentHUDView$autoDismissWithDelay$(_LOGOS_SELF_TYPE_NORMAL SBHUDController* _LOGOS_SELF_CONST, SEL, id, double); 



static void _logos_method$12customHUD$VolumeControl$_presentVolumeHUDWithMode$volume$(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1, float arg2) {





  _logos_orig$12customHUD$VolumeControl$_presentVolumeHUDWithMode$volume$(self, _cmd, arg1, arg2);
}
static void _logos_method$12customHUD$VolumeControl$setMediaVolume$(_LOGOS_SELF_TYPE_NORMAL VolumeControl* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, float arg1) {
  
  _logos_orig$12customHUD$VolumeControl$setMediaVolume$(self, _cmd, arg1);
}


__attribute__((used)) static customHUD * _logos_method$12customHUD$SBHUDController$volHUD(SBHUDController * __unused self, SEL __unused _cmd) { return (customHUD *)objc_getAssociatedObject(self, (void *)_logos_method$12customHUD$SBHUDController$volHUD); }; __attribute__((used)) static void _logos_method$12customHUD$SBHUDController$setVolHUD(SBHUDController * __unused self, SEL __unused _cmd, customHUD * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$12customHUD$SBHUDController$volHUD, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$12customHUD$SBHUDController$presentHUDView$autoDismissWithDelay$(_LOGOS_SELF_TYPE_NORMAL SBHUDController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, double arg2){
  if(!self.volHUD){
    self.volHUD = [[customHUD alloc] initWithFrame:CGRectMake(0,0,[[UIScreen mainScreen] bounds].size.width,160)];
  }
  [self.volHUD setAnimationSpeed:animationSpeed];
  
  [self.volHUD present];
}



static __attribute__((constructor)) void _logosLocalCtor_594b20b3(int __unused argc, char __unused **argv, char __unused **envp){
  updatePrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs, CFSTR("com.jakesnake.simhprefs/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs_HP, CFSTR("com.jakesnake.simhprefs/changed_hp"), NULL, CFNotificationSuspensionBehaviorCoalesce);
  init();
}

void init(){
  if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"13.0") && enabled){
    if(!useCustomHUD){

      {Class _logos_class$Tweak$SBElasticVolumeViewController = objc_getClass("SBElasticVolumeViewController"); MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(init), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$init, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$init);MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(viewDidLoad), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$viewDidLoad, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(NSNotification *), strlen(@encode(NSNotification *))); i += strlen(@encode(NSNotification *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(updatePadding:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$updatePadding$, _typeEncoding); }MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(transitionToState:animated:completion:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$);MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(_updateForAxisChange:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$_updateForAxisChange$, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$_updateForAxisChange$);MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(_scheduleDismissal:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$_scheduleDismissal$, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$_scheduleDismissal$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(updateArtworkFrame), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$updateArtworkFrame, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(updateArtwork), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$updateArtwork, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(isShown), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$isShown, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setIsShown:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setIsShown, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(artworkFrame), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$artworkFrame, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setArtworkFrame:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setArtworkFrame, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(imageView), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$imageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setImageView:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setImageView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIVisualEffectView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(blurView), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$blurView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIVisualEffectView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setBlurView:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setBlurView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(xpositionConstraint), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$xpositionConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setXpositionConstraint:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setXpositionConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(ypositionConstraint), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$ypositionConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setYpositionConstraint:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setYpositionConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(widthConstraint), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$widthConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setWidthConstraint:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setWidthConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(heightConstraint), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$heightConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setHeightConstraint:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setHeightConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(imageWidthConstraint), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$imageWidthConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setImageWidthConstraint:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setImageWidthConstraint, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(imageHeightConstraint), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$imageHeightConstraint, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSLayoutConstraint *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setImageHeightConstraint:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setImageHeightConstraint, _typeEncoding); } } } else if(useCustomHUD){


      {Class _logos_class$customHUDGroup$SBVolumeControl = objc_getClass("SBVolumeControl"); MSHookMessageEx(_logos_class$customHUDGroup$SBVolumeControl, @selector(_presentVolumeHUDWithVolume:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$_presentVolumeHUDWithVolume$, (IMP*)&_logos_orig$customHUDGroup$SBVolumeControl$_presentVolumeHUDWithVolume$);MSHookMessageEx(_logos_class$customHUDGroup$SBVolumeControl, @selector(_updateEffectiveVolume:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$_updateEffectiveVolume$, (IMP*)&_logos_orig$customHUDGroup$SBVolumeControl$_updateEffectiveVolume$);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(customHUD *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(volHUD), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$volHUD, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(customHUD *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(setVolHUD:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$setVolHUD, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIWindow *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(hudWindow), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$hudWindow, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIWindow *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(setHudWindow:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$setHudWindow, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(sliderView), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$sliderView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(setSliderView:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$setSliderView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIView *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(fillView), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$fillView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIView *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(setFillView:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$setFillView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(trackInfoLabel), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$trackInfoLabel, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(setTrackInfoLabel:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$setTrackInfoLabel, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(NSTimer *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(dismissalTimer), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$dismissalTimer, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(NSTimer *)); class_addMethod(_logos_class$customHUDGroup$SBVolumeControl, @selector(setDismissalTimer:), (IMP)&_logos_method$customHUDGroup$SBVolumeControl$setDismissalTimer, _typeEncoding); } } } } else if(enabled){
    if(!useCustomHUD){

      {Class _logos_class$iOS12$SBVolumeHUDView = objc_getClass("SBVolumeHUDView"); MSHookMessageEx(_logos_class$iOS12$SBVolumeHUDView, @selector(viewDidLoad), (IMP)&_logos_method$iOS12$SBVolumeHUDView$viewDidLoad, (IMP*)&_logos_orig$iOS12$SBVolumeHUDView$viewDidLoad);MSHookMessageEx(_logos_class$iOS12$SBVolumeHUDView, @selector(didMoveToSuperview), (IMP)&_logos_method$iOS12$SBVolumeHUDView$didMoveToSuperview, (IMP*)&_logos_orig$iOS12$SBVolumeHUDView$didMoveToSuperview);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$iOS12$SBVolumeHUDView, @selector(updateArtwork), (IMP)&_logos_method$iOS12$SBVolumeHUDView$updateArtwork, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$iOS12$SBVolumeHUDView, @selector(imageView), (IMP)&_logos_method$iOS12$SBVolumeHUDView$imageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$iOS12$SBVolumeHUDView, @selector(setImageView:), (IMP)&_logos_method$iOS12$SBVolumeHUDView$setImageView, _typeEncoding); } } } else{





      {Class _logos_class$12customHUD$VolumeControl = objc_getClass("VolumeControl"); MSHookMessageEx(_logos_class$12customHUD$VolumeControl, @selector(_presentVolumeHUDWithMode:volume:), (IMP)&_logos_method$12customHUD$VolumeControl$_presentVolumeHUDWithMode$volume$, (IMP*)&_logos_orig$12customHUD$VolumeControl$_presentVolumeHUDWithMode$volume$);MSHookMessageEx(_logos_class$12customHUD$VolumeControl, @selector(setMediaVolume:), (IMP)&_logos_method$12customHUD$VolumeControl$setMediaVolume$, (IMP*)&_logos_orig$12customHUD$VolumeControl$setMediaVolume$);Class _logos_class$12customHUD$SBHUDController = objc_getClass("SBHUDController"); MSHookMessageEx(_logos_class$12customHUD$SBHUDController, @selector(presentHUDView:autoDismissWithDelay:), (IMP)&_logos_method$12customHUD$SBHUDController$presentHUDView$autoDismissWithDelay$, (IMP*)&_logos_orig$12customHUD$SBHUDController$presentHUDView$autoDismissWithDelay$);{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(customHUD *)); class_addMethod(_logos_class$12customHUD$SBHUDController, @selector(volHUD), (IMP)&_logos_method$12customHUD$SBHUDController$volHUD, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(customHUD *)); class_addMethod(_logos_class$12customHUD$SBHUDController, @selector(setVolHUD:), (IMP)&_logos_method$12customHUD$SBHUDController$setVolHUD, _typeEncoding); } } } } }  void updatePrefs() {
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

    [[_logos_static_class_lookup$SBVolumeControl() sharedInstance] _setMediaVolumeForIAP:[[_logos_static_class_lookup$SBVolumeControl() sharedInstance] _getMediaVolumeForIAP]];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"HPlus" object:nil];
  } else {
    isInitialized = TRUE;
  }

}
