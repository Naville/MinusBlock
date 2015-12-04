
%ctor{
	NSLog(@"Loading Minus Block");
	extern void GlobalInit();
	GlobalInit();
}