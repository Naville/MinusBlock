#import "../SharedDefine.pch"
%group Vungle
%hook VungleSDK
- (void)startWithAppId:(id)arg1{}
- (id)init{return nil;}
- (void)setup{}
- (void)requestAd{}
- (id)deviceInfo{return nil;}
+ (id)sharedSDK{return nil;}
%end
%end
extern void init_Vungle_hook(){
%init(Vungle);
}
