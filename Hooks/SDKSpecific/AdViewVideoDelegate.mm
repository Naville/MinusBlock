#import "AdViewVideoDelegate.h"
@implementation AdViewVideoDelegate
@synthesize originalDelegate;


- (AdViewVideoDelegate*) initWithOriginalDelegate:(id<AdViewVideoDelegate>)origDeleg {
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

- (void)AdViewVideoPlayStarted{
	[originalDelegate AdViewVideoPlayEnded];

}
- (void)AdViewVideoPlayEnded{
[originalDelegate AdViewVideoPlayEnded];

}
- (void)AdViewVideoClosedWithState:(BOOL)isPlayEnded{

	[originalDelegate AdViewVideoClosedWithState:YES];
}

@end