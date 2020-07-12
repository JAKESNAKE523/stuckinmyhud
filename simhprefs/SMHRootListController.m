#include "SMHRootListController.h"

@implementation SMHRootListController

-(instancetype) init {
	self = [super init];

	if(self){
		/*HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
		appearanceSettings.tintColor = [UIColor colorWithRed:0.f green:197.f/255.f blue:205.f/255.f alpha:1];
    appearanceSettings.navigationBarBackgroundColor = [UIColor colorWithRed:0.f green:197.f/255.f blue:205.f/255.f alpha:1];
		appearanceSettings.largeTitleStyle = 2;*/
    self.hb_appearanceSettings = [[SIMHAppearanceSettings alloc] init];

		self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring)];
		self.respringButton.tintColor = [UIColor whiteColor];
		self.navigationItem.rightBarButtonItem = self.respringButton;
	}
	return self;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
-(void)respring {
	pid_t pid;
	const char *args[] = {"sbreload", NULL, NULL, NULL};
	posix_spawn(&pid, "/usr/bin/sbreload", NULL, NULL, (char *const *)args, NULL);
}

@end
