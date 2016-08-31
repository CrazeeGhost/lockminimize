#import <SpringBoard/SpringBoard.h>
#import <objc/runtime.h>


static void lockStateChanged( CFNotificationCenterRef center, void*observer, CFStringRef name, 		const void *object, CFDictionaryRef userInfo )
{
	UIAlertView *alert = [[objc_getClass("UIAlertView") alloc] initWithTitle:@"State Changed"
		message:@"Unlock State changed"
		delegate:nil
		cancelButtonTitle:@"Cool"
		otherButtonTitles:nil];
	[alert show];
	[alert release];
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
