#import "../SharedDefine.pch"
%group Chartboost
%hook Chartboost
+ (void)startWithAppId:(id)arg1 appSignature:(id)arg2 delegate:(id)arg3{


}

%end
%end
extern void init_Chartboost_hook(){
%init(Chartboost);
}
