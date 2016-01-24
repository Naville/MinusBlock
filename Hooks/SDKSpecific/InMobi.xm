#import "../SharedDefine.pch"
%group InMobi
%hook InMobi
+(void)initialize:(id)obj{
	
}
%end
%hook IMSdk
+ (void)initWithAccountID:(NSString *)accountID{

	%orig(InMobiAccountID);
}
%end
%end
extern  void init_InMobi_hook(){
%init(InMobi);
}
