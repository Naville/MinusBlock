#import "../SharedDefine.pch"
#import "AdViewVideoDelegate.h"
%group AdView
%hook AdViewVideo
+ (id)playVideoWithAppId:(NSString*)appId controller:(UIViewController*)controller videoType:(ADVideoType)videoType delegate:(id)videoDelegate{
	AdViewVideoDelegate* delegateProxy = [[AdViewVideoDelegate alloc] initWithOriginalDelegate:videoDelegate];
	id origResult = %orig(appId,controller,videoType,delegateProxy);
	return origResult;



}
%end
%end
extern "C" void init_AdView_hook(){
%init(AdView);
}
