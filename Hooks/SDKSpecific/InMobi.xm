#import "../SharedDefine.pch"
%group InMobi
%hook IMInterstitial
-(id)initWithAppId:(id)obj{
return nil;
}
%end
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
	if(objc_getClass("IMSdk")!=NULL ||objc_getClass("InMobi")!=NULL||objc_getClass("IMInterstitial")!=NULL ){
			%init(InMobi);
			}
}
