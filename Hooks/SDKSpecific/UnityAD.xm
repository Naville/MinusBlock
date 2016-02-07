#import "../SharedDefine.pch"
%group UnityAD
%hook UnityAds
+ (id)sharedInstance{
	return nil;
}
- (BOOL)startWithGameId:(NSString *)gameId andViewController:(id)viewController{return YES;}
- (BOOL)startWithGameId:(NSString *)gameId{return YES;}
- (BOOL)canShowAds{return NO;}
- (BOOL)canShow{return NO;}
- (BOOL)show:(NSDictionary *)options{return NO;}
- (BOOL)show{return NO;}
- (BOOL)hide{return YES;}
%end
%end
extern void init_UnityAD_hook(){
if(objc_getClass("UnityAds")!=NULL){
%init(UnityAD);
}
}
