#import "../SharedDefine.pch"
%group InMobi
%hook IMSdk
+ (void)initWithAccountID:(NSString *)accountID{

	%orig(InMobiAccountID);
}
%end
%end
extern "C" void init_InMobi_hook(){
%init(InMobi);
}
