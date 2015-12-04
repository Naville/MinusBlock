#import "../SharedDefine.pch"
%group GoogleAD

%hook GADInterstitial
- (id)initWithAdUnitID:(NSString *)adUnitID{

//No we don't simply return nil for stability's sake
return %orig(GADadUnitID);
}
%end

%end

extern  void init_GoogleAdMob_hook(){
        %init(GoogleAD);
}






