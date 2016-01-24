#import "../SharedDefine.pch"
%group IAPCrazy
%hook ICZUtil
-(void)loadadcontnet{
NSLog(@" >>>>>>>>>>>>>>>>>>> Don't try load content ");
}
-(void)loadAdmobInterstital{
NSLog(@" >>>>>>>>>>>>>>>>>>> Don't try load admob ");
}
%end
%end
extern void RealInitIAPCrazy(const struct mach_header* mh, intptr_t vmaddr_slide){
	 for(int i=0;i<_dyld_image_count();i++){
	 	NSString* Name=[NSString stringWithUTF8String: _dyld_get_image_name(i)];
	 	//NSLog(@"ImageName:%@",Name);
	 	if([Name containsString:@"IAPCrazy"]==YES){
	 		NSLog(@"Inside IAPCrazy ImageHook");
			%init(IAPCrazy);

	 	}

	 }
}

extern void init_IAPCrazy_hook(){
NSLog(@"Setting Up IAPCrazy ImageHooks");
_dyld_register_func_for_add_image(RealInitIAPCrazy);
}
