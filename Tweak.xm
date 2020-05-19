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

%hook SBElasticVolumeViewController
%property (nonatomic, retain) UILabel *artworkFrame;
%property (nonatomic, retain) UIImageView * imageView;
%property (nonatomic, retain) UIImage * nowplayingArt;
-(void)viewDidLoad{
  %orig;

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
-(void)transitionToState:(long long)state animated:(BOOL)arg2 completion:(id)arg3{
  %orig;
  [self updateArtworkFrame];
}
%new -(void)updateArtworkFrame{
  UIView *artworkFrame = self.artworkFrame;

  self.artworkFrame.frame = CGRectMake(self.sliderView.bounds.origin.x + self.sliderView.bounds.size.width + 10,0,self.sliderView.bounds.size.height,self.sliderView.bounds.size.height);
  self.imageView.frame = CGRectMake(artworkFrame.bounds.origin.x + artworkFrame.bounds.size.width*0.1,artworkFrame.bounds.origin.y + artworkFrame.bounds.size.height*0.1, artworkFrame.bounds.size.width*0.8, artworkFrame.bounds.size.height*0.8);
  RLog(@"Update frame");
}
%new -(void)updateArtwork{
  MRMediaRemoteGetNowPlayingInfo(dispatch_get_main_queue(), ^(CFDictionaryRef information) {
      NSDictionary *dict = (__bridge NSDictionary *)information;

      if (dict && dict[(__bridge NSString *)kMRMediaRemoteNowPlayingInfoArtworkData]) {
          //[config colorizeView:[UIImage imageWithData:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]]];
          //[self loadArtwork:[dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData]];
          //return [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
          self.nowplayingArt = [dict objectForKey:(__bridge NSString*)kMRMediaRemoteNowPlayingInfoArtworkData];
      }
  });
}
%new -(void)loadArtwork{
  //self
}
%end
