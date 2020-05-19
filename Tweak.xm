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

%hook SBElasticVolumeViewController
%property (nonatomic, retain) UILabel *artworkFrame;
-(void)viewDidLoad{
  %orig;
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
-(void)transitionToState:(long long)state animated:(BOOL)arg2 completion:(id)arg3{
  %orig;
  [self updateArtworkFrame];
}
%new -(void)updateArtworkFrame{
  self.artworkFrame.frame = CGRectMake(self.sliderView.bounds.origin.x + self.sliderView.bounds.size.width + 10,0,self.sliderView.bounds.size.height,self.sliderView.bounds.size.height);
  RLog(@"Update frame");
}
%new -(UIImage *)getArtwork{
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          //[config colorizeView:[UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]]];
      }
  });

  return nil;
}
%end
