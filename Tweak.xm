#import "./Hooks/Utils.h"
#import <Foundation/Foundation.h>
%ctor{
	NSString* Identifer=[[NSBundle mainBundle] bundleIdentifier];
	if([Identifer hasPrefix:@"com.apple"]&&Identifer!=nil){
		NSLog(@"Looks like Apple Binary,Skipping");
	}
	else if(Identifer!=nil){
	Utils* Utility=[Utils sharedManager];
	[Utility setup];
	//Setup Filter List before Applying Hook
	NSLog(@"Loading Minus Block");
	extern void GlobalInit();
	GlobalInit();
	}
	else{
		NSLog(@"Skipping Loading");
	}
}