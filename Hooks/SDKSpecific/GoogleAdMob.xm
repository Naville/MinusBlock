#import "../SharedDefine.pch"
typedef struct GADAdSize {
  CGSize size;
  NSUInteger flags;
} GADAdSize;
%group GoogleAD

%hook GADBannerView
-(id)init{
  return nil;
}
- (id)initWithAdSize:(GADAdSize)adSize{
adSize.size=CGSizeMake(0,0);
return %orig;
}
- (void)loadRequest:(id)request{

}
%end
%hook GADInterstitial
-(id)init{
  return nil;
}
- (id)initWithAdUnitID:(NSString *)adUnitID{

//No we don't simply return nil for stability's sake
return %orig(GADadUnitID);
}
- (void)loadRequest:(id)request{

}
%end
%hook GADAdLoader
- (id)initWithAdUnitID:(NSString *)adUnitID
              rootViewController:(id)rootViewController
                         adTypes:(NSArray *)adTypes
                         options:(NSArray *)options{
                         	return nil;
                         }

- (void)loadRequest:(id)request{

}
%end
%hook GADRequest
+ (id)request{
	return nil;
}
+ (id)init{
	return nil;
}
%end

%end

extern  void init_GoogleAdMob_hook(){
        %init(GoogleAD);
}






