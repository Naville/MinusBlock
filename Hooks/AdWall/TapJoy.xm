#import "../SharedDefine.pch"
%group TapJoy
%hook Tapjoy
+ (void)connect:(NSString *)sdkKey{}
+ (void)connect:(NSString *)sdkKey options:(NSDictionary *)optionsDict{}
+ (void)startSession{}
+ (void)endSession{}
+ (void)setVideoAdDelegate:(id)delegate{
	
}

%end
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
%hook TJPlacement
+ (id)placementWithName:(NSString*)placementName delegate:(id)delegate{
	return nil;
}

/**
 * Sends the placement request to the server
 *
 * @return n/a
 */
- (void)requestContent{

}

/**
 * Shows the content that was received from the server after sending this placement
 * @return n/a
 */
- (void)showContentWithViewController:(id)viewController{

}
%end
%end
extern  void init_TapJoy_hook(){
%init(TapJoy);
}
