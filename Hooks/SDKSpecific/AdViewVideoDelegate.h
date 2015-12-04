#import "AdViewVideo.h"
@interface AdViewVideoDelegate : NSObject <AdViewVideoDelegate> {
    id originalDelegate;        // The NSURLConnectionDelegate we're going to proxy
}

@property (retain) id originalDelegate; // Need retain or the delegate gets freed before we're done using it.


- (AdViewVideoDelegate*) initWithOriginalDelegate:(id)origDeleg;
- (BOOL)respondsToSelector:(SEL)aSelector;
- (id)forwardingTargetForSelector:(SEL)sel;
- (void)dealloc;

- (void)AdViewVideoPlayStarted;
- (void)AdViewVideoPlayEnded;
- (void)AdViewVideoClosedWithState:(BOOL)isPlayEnded;

@end