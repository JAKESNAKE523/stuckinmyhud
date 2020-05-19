#line 1 "Tweak.xm"
#include <RemoteLog.h>
#import <MediaRemote/MediaRemote.h>

@interface SBElasticSliderView : UIView
@end

@interface SBElasticVolumeViewController : UIViewController
@property (nonatomic,readonly) SBElasticSliderView * sliderView;
@property (nonatomic, retain) UIView * artworkFrame;
-(void)updateArtworkFrame;
-(UIImage *)getArtwork;
@end


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
static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static UIImage * _logos_method$_ungrouped$SBElasticVolumeViewController$getArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); 

#line 14 "Tweak.xm"

__attribute__((used)) static UILabel * _logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setArtworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad(self, _cmd);
  UIView* artworkFrame = [[UIView alloc] initWithFrame:CGRectMake(self.sliderView.bounds.origin.x + self.sliderView.bounds.size.width + 10,0,self.sliderView.bounds.size.height * 2,self.sliderView.bounds.size.height * 2)];
  UIVisualEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
  UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];

  [artworkFrame setBackgroundColor:[UIColor clearColor]];
  artworkFrame.clipsToBounds = YES;
  artworkFrame.layer.cornerRadius = 0.2 * self.sliderView.bounds.size.height;

  blurView.frame = artworkFrame.bounds;
  [artworkFrame addSubview:blurView];

  [self.sliderView addSubview:artworkFrame];
  RLog(@"Loading view..");

  self.artworkFrame = artworkFrame;
}
static void _logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long state, BOOL arg2, id arg3){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(self, _cmd, state, arg2, arg3);
  [self updateArtworkFrame];
}
 static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  self.artworkFrame.frame = CGRectMake(self.sliderView.bounds.origin.x + self.sliderView.bounds.size.width + 10,0,self.sliderView.bounds.size.height,self.sliderView.bounds.size.height);
  RLog(@"Update frame");
}
 static UIImage * _logos_method$_ungrouped$SBElasticVolumeViewController$getArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          
      }
  });

  return nil;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBElasticVolumeViewController = objc_getClass("SBElasticVolumeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(transitionToState:animated:completion:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(updateArtworkFrame), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$updateArtworkFrame, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; memcpy(_typeEncoding + i, @encode(UIImage *), strlen(@encode(UIImage *))); i += strlen(@encode(UIImage *)); _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(getArtwork), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$getArtwork, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(artworkFrame), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setArtworkFrame:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setArtworkFrame, _typeEncoding); } } }
#line 54 "Tweak.xm"
