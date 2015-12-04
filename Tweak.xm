#import "./Hooks/Utils.h"
%ctor{
	Utils* Utility=[Utils sharedManager];
	[Utility setup];
	//Setup Filter List before Applying Hook
	NSLog(@"Loading Minus Block");
	extern void GlobalInit();
	GlobalInit();
}