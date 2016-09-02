#import <SpringBoard/SpringBoard.h>
#import <SpringBoard/SBApplicationController.h>
#import <SpringBoard/SBUIController.h>
#import <objc/runtime.h>

void lockStateChanged( CFNotificationCenterRef center, void*observer, CFStringRef name, const void *object, CFDictionaryRef userInfo )
{
	//SpringBoard *sbObj = [objc_getClass("SpringBoard") alloc];
	//[sbObj undim];
	//SBApplication *app = [[objc_getClass("SBApplicationController") sharedInstance] 				applicationWithDisplayIdentifier:@"com.apple.springboard"];
	//[[objc_getClass("SBUIController") sharedInstance] activateApplicationFromSwitcher: app];

}


%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {
	%orig;
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(),
                                (void*)self,
                                lockStateChanged,
                                CFSTR("com.apple.springboard.lockstate"),
                                NULL,
                                CFNotificationSuspensionBehaviorDeliverImmediately);
}

%end

