#import "./Hooks/Utils.h"
#import "./Hooks/SharedDefine.pch"
#import <Foundation/Foundation.h>
#include <unistd.h>
#include <sys/types.h>
void InitForCallBack(const struct mach_header* mh, intptr_t vmaddr_slide){
	//Will Stuck The Program.
	//This is only for dealing with tweaks binded with AD,no need to fix this in a hurry.
extern void GlobalInit();
GlobalInit();	
}
void MoveIAPCrazy(){
	NSFileManager* fm=[NSFileManager defaultManager];
NSArray* fileList=[fm contentsOfDirectoryAtPath:@"/Library/MobileSubstrate/DynamicLibraries" error:nil];
for(int i=0;i<fileList.count;i++){
	NSString* Name=[fileList objectAtIndex:i];
	if([Name containsString:@"IAPCrazy"]&&[Name containsString:@".plist"]){
		NSLog(@"IAPCrazy PLIST Found:%@\nMoving",Name);
		[fm moveItemAtPath:[NSString stringWithFormat:@"/Library/MobileSubstrate/DynamicLibraries/%@",Name] toPath:@"/Library/MobileSubstrate/DynamicLibraries/IAPCrazy.plist" error:nil];

	}
	if([Name containsString:@"IAPCrazy"]&&[Name containsString:@".dylib"]){
		NSLog(@"IAPCrazy DYLIB Found:%@\nMoving",Name);
		[fm moveItemAtPath:[NSString stringWithFormat:@"/Library/MobileSubstrate/DynamicLibraries/%@",Name] toPath:@"/Library/MobileSubstrate/DynamicLibraries/IAPCrazy.dylib" error:nil];

	}

}


}

%ctor{
	MoveIAPCrazy();
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
