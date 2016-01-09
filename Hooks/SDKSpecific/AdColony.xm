#import "../SharedDefine.pch"
%group AdColony
%hook AdColony
+ (void)configureWithAppID:(NSString *)appID zoneIDs:(NSArray *)zoneIDs delegate:(id)del logging:(BOOL)log{

}
%end
%end
extern void init_AdColony_hook(){
%init(AdColony);
}
