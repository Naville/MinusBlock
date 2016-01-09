#import "../SharedDefine.pch"
%group Heyzap
%hook HeyzapAds
+ (void) startWithPublisherID: (NSString *) publisherID andOptions: (NSUInteger) options{

}
+ (void) startWithPublisherID:(NSString *)publisherID andOptions:(NSUInteger)options andFramework: (NSString *) framework{

}
+ (void) startWithPublisherID: (NSString *) publisherID{

}

+ (BOOL) isStarted{
	return NO;
}
+ (void)setBundleIdentifier:(NSString *)bundleIdentifier{
	
}
%end
%end
extern void init_Heyzap_hook(){
%init(Heyzap);
}
