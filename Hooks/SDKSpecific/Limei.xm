#import "../SharedDefine.pch"
%group Limei
%hook MBJoyView
-(id)initWithAdUnitId:(NSString *)adUnitId adType:(int)type rootViewController:(id)rootVC userInfo:(NSDictionary *)userinfo{

	return %orig(InMobiAccountID,type,rootVC,userinfo);
}
-(void)request{

}
-(void)display{

}
-(void)show{
}
%end
%end
extern void init_Limei_hook(){
%init(Limei);
}
