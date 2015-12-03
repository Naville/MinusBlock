#import "../SharedDefine.pch"
%group GoogleAd


%hook GADInterstitial
- (id)initWithAdUnitID:(NSString *)adUnitID{

//No we don't simply return nil for stability's sake
return %orig(GADadUnitID);
}
%end






%end

