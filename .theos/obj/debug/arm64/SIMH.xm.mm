#line 1 "SIMH.xm"
#include "SIMH.h"

NSDictionary *tweakSettings;


void updatePrefs() {
  RLog(@"Changing prefs");
  tweakSettings = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.jakesnake.simhprefs"];

  enabled = [[tweakSettings valueForKey:@"isEnabled"] boolValue];
  alwaysSmall = [[tweakSettings valueForKey:@"alwaysSmall"] boolValue];
  padding = [[tweakSettings valueForKey:@"padding"] floatValue] / 100;
}


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

@class SBElasticVolumeViewController; 


#line 15 "SIMH.xm"
static void (*_logos_orig$Tweak$SBElasticVolumeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Tweak$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$_updateForAxisChange$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, int); static void _logos_method$Tweak$SBElasticVolumeViewController$_updateForAxisChange$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, int); static void (*_logos_orig$Tweak$SBElasticVolumeViewController$_scheduleDismissal$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Tweak$SBElasticVolumeViewController$_scheduleDismissal$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static UIColor * _logos_method$Tweak$SBElasticVolumeViewController$averageColorFromImage$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, UIImage *); 

__attribute__((used)) static BOOL _logos_method$Tweak$SBElasticVolumeViewController$isShown(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { NSValue * value = objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$isShown); BOOL rawValue; [value getValue:&rawValue]; return rawValue; }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setIsShown(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, BOOL rawValue) { NSValue * value = [NSValue valueWithBytes:&rawValue objCType:@encode(BOOL)]; objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$isShown, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UILabel * _logos_method$Tweak$SBElasticVolumeViewController$artworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$artworkFrame); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setArtworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$artworkFrame, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImageView * _logos_method$Tweak$SBElasticVolumeViewController$imageView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageView); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setImageView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$imageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIVisualEffectView * _logos_method$Tweak$SBElasticVolumeViewController$blurView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIVisualEffectView *)objc_getAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$blurView); }; __attribute__((used)) static void _logos_method$Tweak$SBElasticVolumeViewController$setBlurView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIVisualEffectView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$Tweak$SBElasticVolumeViewController$blurView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

static void _logos_method$Tweak$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$Tweak$SBElasticVolumeViewController$viewDidLoad(self, _cmd);


  if(!self.artworkFrame){
    NSInteger state = MSHookIvar<NSInteger>(self, "_state");
    RLog(@"%d", state);
    CGRect frame;
    if((state == 1 || state == 3) && !alwaysSmall){
      frame = CGRectMake(20,0,200,200);
    } else {
      frame = CGRectMake(100,-70,60,60);
    }
    UIView* artworkFrame = [[UIView alloc]initWithFrame:frame];
    UIVisualEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];

    [artworkFrame setBackgroundColor:[UIColor clearColor]];
    artworkFrame.clipsToBounds = YES;
    artworkFrame.autoresizesSubviews = YES;
    artworkFrame.layer.cornerRadius = 0.2 * self.sliderView.bounds.size.height;


    blurView.frame = artworkFrame.bounds;
    [artworkFrame addSubview:blurView];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(artworkFrame.bounds.origin.x + artworkFrame.bounds.size.width*padding,artworkFrame.bounds.origin.y + artworkFrame.bounds.size.height*padding, artworkFrame.bounds.size.width*(1-padding), artworkFrame.bounds.size.height*(1-padding))];
    [self updateArtwork];
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 0.08 * imageView.bounds.size.height;
    [imageView setBackgroundColor:[UIColor clearColor]];
    [artworkFrame addSubview:imageView];

    [self.sliderView addSubview:artworkFrame];

    imageView.translatesAutoresizingMaskIntoConstraints = NO;

    NSLayoutConstraint *xConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:artworkFrame
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1
                                                            constant:0];
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:artworkFrame
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:imageView
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1
                                                            constant:0];
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:artworkFrame
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:(1-padding*2)
                                                            constant:0];
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:artworkFrame
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:(1-padding*2)
                                                            constant:0];
    [artworkFrame addConstraint:xConstraint];
    [artworkFrame addConstraint:yConstraint];
    [artworkFrame addConstraint:widthConstraint];
    [artworkFrame addConstraint:heightConstraint];

    self.artworkFrame = artworkFrame;
    self.imageView = imageView;
    self.blurView = blurView;
  }
}
static void _logos_method$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long state, BOOL arg2, id arg3){

    _logos_orig$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$(self, _cmd, state, arg2, arg3);
    [self updateArtworkFrame];

}
static void _logos_method$Tweak$SBElasticVolumeViewController$_updateForAxisChange$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, int arg1){
  _logos_orig$Tweak$SBElasticVolumeViewController$_updateForAxisChange$(self, _cmd, arg1);
}
static void _logos_method$Tweak$SBElasticVolumeViewController$_scheduleDismissal$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {

  _logos_orig$Tweak$SBElasticVolumeViewController$_scheduleDismissal$(self, _cmd, arg1);
  if([[NSString stringWithFormat:@"%@", arg1] isEqual:@"Deflator-transition-out-guard"]){

      [UIView animateWithDuration:0.3f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.artworkFrame setFrame:CGRectMake(0,0,60,60)];
        [self.imageView setFrame:CGRectMake(60*padding,60*padding,60*(1-padding*2),60*(1-padding*2))];
      } completion:^(BOOL finished) {
      }];
      RLog(@"Did Do");
  } else
  {
    RLog(@"%@", arg1);
  }

}
 static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  CGRect frame;
  CGRect imageFrame;
  NSInteger state = MSHookIvar<NSInteger>(self, "_state");
  if(self.axis == 1){
    if(state == 1 && !alwaysSmall){
      frame = CGRectMake(33,40,148,148);
      

      self.artworkFrame.layer.cornerRadius = 0.09 * frame.size.height;
    } else if (state == 2 || alwaysSmall){
      frame = CGRectMake(7.5+self.sliderView.bounds.size.width,0,60,60);
      
      self.artworkFrame.layer.cornerRadius = 0.18 * frame.size.height;
    } else if(state == 3){
      frame = CGRectMake(self.sliderView.bounds.size.width/2-84,self.sliderView.bounds.size.height+10,168,168);
      
    } else{
      
    }
  } else if (self.axis == 2){
    if(state == 1 && !alwaysSmall){
      frame = CGRectMake(55,0,148,148);
      
      self.artworkFrame.layer.cornerRadius = 0.09 * frame.size.height;
    } else if (state == 2 || alwaysSmall){
      frame = CGRectMake(0,-70,60,60);
      
      self.artworkFrame.layer.cornerRadius = 0.18 * frame.size.height;
    } else if(state == 3){
      frame = CGRectMake(65,0,168,168);
      
    } else{
      
    }
  }

  if(!CGRectEqualToRect(self.artworkFrame.frame, frame)){
    [UIView animateWithDuration:0.5f animations:^{
      self.artworkFrame.frame = frame;
      self.blurView.frame = CGRectMake(0,0,frame.size.width,frame.size.height);
      self.imageView.frame = imageFrame;
    }];
  }
  self.artworkFrame.backgroundColor = [self averageColorFromImage:self.imageView.image];
}
 static void _logos_method$Tweak$SBElasticVolumeViewController$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
            self.imageView.image = [UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
            self.artworkFrame.backgroundColor = [self averageColorFromImage:self.imageView.image];
            self.artworkFrame.alpha = 1;
      } else{
        self.artworkFrame.alpha = 0;
      }
  });
}
 static UIColor * _logos_method$Tweak$SBElasticVolumeViewController$averageColorFromImage$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIImage * image) {

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
                               alpha:alpha];
    }
    else {
        return [UIColor colorWithRed:((CGFloat)rgba[0])/255.0
                               green:((CGFloat)rgba[1])/255.0
                                blue:((CGFloat)rgba[2])/255.0
                               alpha:200.0/255.0];
    }
}



static __attribute__((constructor)) void _logosLocalCtor_bb6d082b(int __unused argc, char __unused **argv, char __unused **envp){
  updatePrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs, CFSTR("com.jakesnake.simhprefs/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);

  if(enabled){



    {Class _logos_class$Tweak$SBElasticVolumeViewController = objc_getClass("SBElasticVolumeViewController"); MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(viewDidLoad), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$viewDidLoad, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$viewDidLoad);MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(transitionToState:animated:completion:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$transitionToState$animated$completion$);MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(_updateForAxisChange:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$_updateForAxisChange$, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$_updateForAxisChange$);MSHookMessageEx(_logos_class$Tweak$SBElasticVolumeViewController, @selector(_scheduleDismissal:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$_scheduleDismissal$, (IMP*)&_logos_orig$Tweak$SBElasticVolumeViewController$_scheduleDismissal$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(updateArtworkFrame), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$updateArtworkFrame, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(updateArtwork), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$updateArtwork, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UIColor *), strlen(@encode(UIColor *))); i += strlen(@encode(UIColor *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIImage *), strlen(@encode(UIImage *))); i += strlen(@encode(UIImage *)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(averageColorFromImage:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$averageColorFromImage$, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(BOOL)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(isShown), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$isShown, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(BOOL)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setIsShown:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setIsShown, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(artworkFrame), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$artworkFrame, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setArtworkFrame:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setArtworkFrame, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(imageView), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$imageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setImageView:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setImageView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIVisualEffectView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(blurView), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$blurView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIVisualEffectView *)); class_addMethod(_logos_class$Tweak$SBElasticVolumeViewController, @selector(setBlurView:), (IMP)&_logos_method$Tweak$SBElasticVolumeViewController$setBlurView, _typeEncoding); } } } }
