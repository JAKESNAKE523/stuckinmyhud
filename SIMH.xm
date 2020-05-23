#include "SIMH.h"

NSDictionary *tweakSettings;// = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.twickd.jakesnake.omega"];


void updatePrefs() {
  RLog(@"Changing prefs");
  tweakSettings = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"com.jakesnake.simhprefs"];

  enabled = [[tweakSettings valueForKey:@"isEnabled"] boolValue];
  alwaysSmall = [[tweakSettings valueForKey:@"alwaysSmall"] boolValue];
  padding = [[tweakSettings valueForKey:@"padding"] floatValue] / 100;
}

%group Tweak
%hook SBElasticVolumeViewController
%property (assign) BOOL isShown;
%property (nonatomic, retain) UILabel *artworkFrame;
%property (nonatomic, retain) UIImageView * imageView;
%property (nonatomic, retain) UIVisualEffectView * blurView;

-(void)viewDidLoad{
  %orig;


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
    NSLayoutConstraint *yConstraint = [NSLayoutConstraint constraintWithItem:imageView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:artworkFrame
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
-(void)transitionToState:(long long)state animated:(BOOL)arg2 completion:(id)arg3{

    %orig;
    [self updateArtworkFrame];

}
-(void)_updateForAxisChange:(int)arg1{
  %orig;
}
-(void)_scheduleDismissal:(id)arg1 {

  %orig;
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
%new -(void)updateArtworkFrame{
  CGRect frame;
  CGRect imageFrame;
  NSInteger state = MSHookIvar<NSInteger>(self, "_state");
  if(self.axis == 1){
    if(state == 1 && !alwaysSmall){
      frame = CGRectMake(33,40,148,148);
      //imageFrame = CGRectMake(15,15,118,118);

      self.artworkFrame.layer.cornerRadius = 0.09 * frame.size.height;
    } else if (state == 2 || alwaysSmall){
      frame = CGRectMake(7.5+self.sliderView.bounds.size.width,0,60,60);
      //imageFrame = CGRectMake(10,10,40,40);
      self.artworkFrame.layer.cornerRadius = 0.18 * frame.size.height;
    } else if(state == 3){
      frame = CGRectMake(self.sliderView.bounds.size.width/2-84,self.sliderView.bounds.size.height+10,168,168);
      //imageFrame = CGRectMake(17.5,17.5,133,133);
    } else{
      //imageFrame = CGRectMake(10,10,40,40);
    }
  } else if (self.axis == 2){
    if(state == 1 && !alwaysSmall){
      frame = CGRectMake(55,0,148,148);
      //imageFrame = CGRectMake(148*padding,148*padding,148*(1-padding*2),148*(1-padding*2));
      self.artworkFrame.layer.cornerRadius = 0.09 * frame.size.height;
    } else if (state == 2 || alwaysSmall){
      frame = CGRectMake(0,-70,60,60);
      //imageFrame = CGRectMake(60*padding,60*padding,60*(1-padding*2),60*(1-padding*2));
      self.artworkFrame.layer.cornerRadius = 0.18 * frame.size.height;
    } else if(state == 3){
      frame = CGRectMake(65,0,168,168);
      //imageFrame = CGRectMake(17.5,17.5,133,133);
    } else{
      //imageFrame = CGRectMake(10,10,40,40);
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
%new -(void)updateArtwork{
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
%new -(UIColor *)averageColorFromImage:(UIImage *)image {

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
%end
%end

%ctor{
  updatePrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updatePrefs, CFSTR("com.jakesnake.simhprefs/changed"), NULL, CFNotificationSuspensionBehaviorCoalesce);

  if(enabled){
    %init(Tweak)
  }
}
