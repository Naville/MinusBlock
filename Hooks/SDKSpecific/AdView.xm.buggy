#import "../SharedDefine.pch"
#import "AdViewVideoDelegate.h"
#import "AdViewViewDelegate.h"
%group AdView
%hook AdViewVideo
+ (id)playVideoWithAppId:(NSString*)appId controller:(UIViewController*)controller videoType:(ADVideoType)videoType delegate:(id)videoDelegate{
	AdViewVideoDelegate* delegateProxy = [[AdViewVideoDelegate alloc] initWithOriginalDelegate:videoDelegate];
	id origResult = %orig(appId,controller,videoType,delegateProxy);
	return origResult;



}
%end
%hook AdViewView
+ (id)requestAdViewViewWithDelegate:(id)delegate{
return [[AdViewViewDelegate alloc] initWithOriginalDelegate:delegate];
}
- (void)updateAdViewConfig{

}

- (void)requestFreshAd{}
- (void)rollOver{}

%end
%end
extern  void init_AdView_hook(){
if(objc_getClass("AdViewVideo")!=NULL||objc_getClass("AdViewView")!=NULL){	
%init(AdView);
}
}
