#line 1 "Tweak.x"

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

@class LibraryViewController; @class MusicArtworkComponentImageView; 
static void (*_logos_orig$_ungrouped$LibraryViewController$viewDidAppear)(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$LibraryViewController$viewDidAppear(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST, SEL); static void (*_logos_orig$_ungrouped$MusicArtworkComponentImageView$layoutSubviews)(_LOGOS_SELF_TYPE_NORMAL MusicArtworkComponentImageView* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$MusicArtworkComponentImageView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MusicArtworkComponentImageView* _LOGOS_SELF_CONST, SEL); 

#line 1 "Tweak.x"
#include <RemoteLog.h>

  static void _logos_method$_ungrouped$LibraryViewController$viewDidAppear(_LOGOS_SELF_TYPE_NORMAL id _LOGOS_SELF_CONST __unused self, SEL __unused _cmd){
    RLog(@"Hooked");

  }


  static void _logos_method$_ungrouped$MusicArtworkComponentImageView$layoutSubviews(_LOGOS_SELF_TYPE_NORMAL MusicArtworkComponentImageView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
        RLog(@"Hooked");
  }

static __attribute__((constructor)) void _logosLocalCtor_ee39cf58(int __unused argc, char __unused **argv, char __unused **envp) {
  {Class _logos_class$_ungrouped$LibraryViewController = objc_getClass("MusicApplication.LibraryViewController"); MSHookMessageEx(_logos_class$_ungrouped$LibraryViewController, @selector(viewDidAppear), (IMP)&_logos_method$_ungrouped$LibraryViewController$viewDidAppear, (IMP*)&_logos_orig$_ungrouped$LibraryViewController$viewDidAppear);Class _logos_class$_ungrouped$MusicArtworkComponentImageView = objc_getClass("MusicArtworkComponentImageView"); MSHookMessageEx(_logos_class$_ungrouped$MusicArtworkComponentImageView, @selector(layoutSubviews), (IMP)&_logos_method$_ungrouped$MusicArtworkComponentImageView$layoutSubviews, (IMP*)&_logos_orig$_ungrouped$MusicArtworkComponentImageView$layoutSubviews);}
}
