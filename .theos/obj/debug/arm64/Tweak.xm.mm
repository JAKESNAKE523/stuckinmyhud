#line 1 "Tweak.xm"
#include <RemoteLog.h>
#import <MediaRemote/MediaRemote.h>

@interface SBElasticSliderView : UIView
@end

@interface SBElasticVolumeViewController : UIViewController
@property (nonatomic,readonly) SBElasticSliderView * sliderView;
@property (nonatomic, retain) UIView * artworkFrame;
@property (nonatomic, retain) UIImageView * imageView;
@property (nonatomic, retain) UIImage * nowplayingArt;
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
static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$)(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL, long long, BOOL, id); static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$SBElasticVolumeViewController$loadArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST, SEL); 

#line 16 "Tweak.xm"

__attribute__((used)) static UILabel * _logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UILabel *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setArtworkFrame(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UILabel * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImageView * _logos_method$_ungrouped$SBElasticVolumeViewController$imageView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIImageView *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$imageView); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setImageView(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIImageView * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$imageView, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
__attribute__((used)) static UIImage * _logos_method$_ungrouped$SBElasticVolumeViewController$nowplayingArt(SBElasticVolumeViewController * __unused self, SEL __unused _cmd) { return (UIImage *)objc_getAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$nowplayingArt); }; __attribute__((used)) static void _logos_method$_ungrouped$SBElasticVolumeViewController$setNowplayingArt(SBElasticVolumeViewController * __unused self, SEL __unused _cmd, UIImage * rawValue) { objc_setAssociatedObject(self, (void *)_logos_method$_ungrouped$SBElasticVolumeViewController$nowplayingArt, rawValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
static void _logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad(self, _cmd);

  UIImage *nowplayingArt = [UIImage alloc];

  UIView* artworkFrame = [[UIView alloc] initWithFrame:CGRectMake(self.sliderView.bounds.origin.x + self.sliderView.bounds.size.width + 10,0,self.sliderView.bounds.size.height * 2,self.sliderView.bounds.size.height * 2)];
  UIVisualEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
  UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blur];

  [artworkFrame setBackgroundColor:[UIColor clearColor]];
  artworkFrame.clipsToBounds = YES;
  artworkFrame.layer.cornerRadius = 0.2 * self.sliderView.bounds.size.height;

  blurView.frame = artworkFrame.bounds;
  [artworkFrame addSubview:blurView];

  UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(artworkFrame.bounds.origin.x + artworkFrame.bounds.size.width*0.1,artworkFrame.bounds.origin.y + artworkFrame.bounds.size.height*0.1, artworkFrame.bounds.size.width*0.8, artworkFrame.bounds.size.height*0.8)];
  imageView.image = nowplayingArt;
  [artworkFrame addSubview:imageView];

  [self.sliderView addSubview:artworkFrame];
  RLog(@"Loading view..");

  self.artworkFrame = artworkFrame;
  self.imageView = imageView;
  self.nowplayingArt = nowplayingArt;
}
static void _logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, long long state, BOOL arg2, id arg3){
  _logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$(self, _cmd, state, arg2, arg3);
  [self updateArtworkFrame];
}
 static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateArtworkFrame(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  UIView *artworkFrame = self.artworkFrame;

  self.artworkFrame.frame = CGRectMake(self.sliderView.bounds.origin.x + self.sliderView.bounds.size.width + 10,0,self.sliderView.bounds.size.height,self.sliderView.bounds.size.height);
  self.imageView.frame = CGRectMake(artworkFrame.bounds.origin.x + artworkFrame.bounds.size.width*0.1,artworkFrame.bounds.origin.y + artworkFrame.bounds.size.height*0.1, artworkFrame.bounds.size.width*0.8, artworkFrame.bounds.size.height*0.8);
  RLog(@"Update frame");
}
 static void _logos_method$_ungrouped$SBElasticVolumeViewController$updateArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          
          
          
          self.nowplayingArt = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
      }
  });
}
 static void _logos_method$_ungrouped$SBElasticVolumeViewController$loadArtwork(_LOGOS_SELF_TYPE_NORMAL SBElasticVolumeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
  
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$SBElasticVolumeViewController = objc_getClass("SBElasticVolumeViewController"); MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$viewDidLoad);MSHookMessageEx(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(transitionToState:animated:completion:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$, (IMP*)&_logos_orig$_ungrouped$SBElasticVolumeViewController$transitionToState$animated$completion$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(updateArtworkFrame), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$updateArtworkFrame, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(updateArtwork), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$updateArtwork, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(loadArtwork), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$loadArtwork, _typeEncoding); }{ char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(artworkFrame), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$artworkFrame, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UILabel *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setArtworkFrame:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setArtworkFrame, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImageView *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(imageView), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$imageView, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImageView *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setImageView:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setImageView, _typeEncoding); } { char _typeEncoding[1024]; sprintf(_typeEncoding, "%s@:", @encode(UIImage *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(nowplayingArt), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$nowplayingArt, _typeEncoding); sprintf(_typeEncoding, "v@:%s", @encode(UIImage *)); class_addMethod(_logos_class$_ungrouped$SBElasticVolumeViewController, @selector(setNowplayingArt:), (IMP)&_logos_method$_ungrouped$SBElasticVolumeViewController$setNowplayingArt, _typeEncoding); } } }
#line 74 "Tweak.xm"
