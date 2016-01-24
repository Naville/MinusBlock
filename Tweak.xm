#import "./Hooks/Utils.h"
#import "./Hooks/SharedDefine.pch"
#import <Foundation/Foundation.h>
void InitForCallBack(const struct mach_header* mh, intptr_t vmaddr_slide){
	//Will Stuck The Program.
	//This is only for dealing with tweaks binded with AD,no need to fix this in a hurry.
extern void GlobalInit();
GlobalInit();	
}
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
	NSLog(@"Setting Up CallBacks");
	//_dyld_register_func_for_add_image(InitForCallBack);
	extern void GlobalInit();
	GlobalInit();
	}
	else{
		NSLog(@"Skipping Loading");
	}
}
