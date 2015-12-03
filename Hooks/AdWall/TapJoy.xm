#import "../SharedDefine.pch"
%group TapJoy
%hook NSNotification
- (void)postNotificationName:(NSString *)aName object:(id)anObject{
	if([aName isEqualToString:@"TJC_TAP_POINTS_RESPONSE_NOTIFICATION"]){
		%orig(aName,[NSNumber numberWithInt:99999999]);

	}
	else{

		%orig;
	}

}
%end
%end
extern "C" void init_TapJoy_hook(){
%init(TapJoy);
}
