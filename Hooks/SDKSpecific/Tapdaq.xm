#import "../SharedDefine.pch"
%group Tapdaq
%hook TDConfig
+ (id)pathToConfigurationFile{return nil;}
+ (id)frameworkBundle{return nil;}
+ (id)sharedInstance{return nil;}
- (id)getOrientationStringForOrientation:(unsigned long long)arg1{return nil;}
- (id)getAdSizeStringForAdSize:(unsigned long long)arg1{return nil;}
- (id)getAdUnitStringForAdUnit:(unsigned long long)arg1{return nil;}
- (void)persist{}
- (id)sdkIdentifierPrefix{return nil;}
- (id)sdkIdentifier{return nil;}
- (id)nativeAdvertUrl{return nil;}
- (int)maxCachedAdverts{return 0;}
- (id)launchEventUrl{return nil;}
- (id)clickEventUrl{return nil;}
- (id)impressionEventUrl{return nil;}
- (id)bootupEventUrl{return nil;}
- (id)baseUrl{return nil;}
- (id)apiVersion{return nil;}
- (id)init{return nil;}
%end
%hook Tapdaq
+ (id)sharedSession{
	return nil;
}
- (void)launch{

}
- (void)sendClick:(id)arg1{}
- (void)triggerClick:(id)arg1{}
- (void)sendImpression:(id)arg1{}
- (void)triggerImpression:(id)arg1{}
- (void)showInterstitial:(id)arg1{}
- (void)showInterstitial{}
- (void)loadNativeAdvertForAdUnit:(unsigned long long)arg1 size:(unsigned long long)arg2 orientation:(unsigned long long)arg3{}
- (id)getNativeAdvertForAdUnit:(unsigned long long)arg1 size:(unsigned long long)arg2 orientation:(unsigned long long)arg3{return nil;}
- (id)getNativeAdvertForAdUnit:(unsigned long long)arg1 size:(unsigned long long)arg2{return nil;}
- (void)loadInterstitialAdvertForOrientation:(unsigned long long)arg1{}
- (id)getInterstitialAdvertForOrientation:(unsigned long long)arg1{return nil;}
- (id)getInterstitialAdvert{return nil;}
- (void)setApplicationId:(id)arg1 clientKey:(id)arg2 config:(id)arg3{}
- (void)setApplicationId:(id)arg1 clientKey:(id)arg2 orientation:(unsigned long long)arg3{}
- (void)setApplicationId:(id)arg1 clientKey:(id)arg2{}
- (id)init{return nil;}

%end
%end
extern void init_Tapdaq_hook(){
%init(Tapdaq);
}
