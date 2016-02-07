#import "AdViewViewDelegate.h"
#import "../SharedDefine.pch"
@implementation AdViewViewDelegate
@synthesize originalDelegate;


- (id) initWithOriginalDelegate:(id)origDeleg {
    self = [super init];

    if (self) { // Store original delegate
        [self setOriginalDelegate:(origDeleg)];
    }
    return self;
}
- (BOOL)respondsToSelector:(SEL)aSelector {
    return [originalDelegate respondsToSelector:aSelector];
}


- (id)forwardingTargetForSelector:(SEL)sel {
    return originalDelegate;
}


- (void)dealloc {
    [originalDelegate release];
    [super dealloc];
}
- (NSString *)adViewApplicationKey{
    return InMobiAccountID;
}
- (void)adViewDidReceiveAd:(id)adViewView{

}

- (void)adViewFailRequestAd:(id)adViewView error:(NSError*)error{

}

- (void)adViewDidFailToReceiveAd:(id)adViewView usingBackup:(BOOL)yesOrNo{

}
- (void)adViewDidClickAd:(id)adViewView{

}

- (void)adViewStartGetAd:(id)adViewView{

}
- (void)adViewDidReceiveInternet:(id)adViewView reachability:(BOOL)bReachable{

}

- (void)adViewDidAnimateToNewAdIn:(id)adViewView{

}

- (void)adViewReceivedGenericRequest:(id)adViewView{

}
-(id)viewControllerForPresentingModalView{
return nil;
 }

- (void)adViewReceivedNotificationAdsAreOff:(id)adViewView{

}
- (void)adViewWillPresentFullScreenModal{

}
- (void)adViewDidDismissFullScreenModal{

}

@end