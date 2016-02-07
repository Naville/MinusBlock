#import "AdViewViewDelegate.h"
@interface AdViewViewDelegate : NSObject{
    id originalDelegate;        // The NSURLConnectionDelegate we're going to proxy
}

@property (retain) id originalDelegate; // Need retain or the delegate gets freed before we're done using it.


- (id) initWithOriginalDelegate:(id)origDeleg;
- (BOOL)respondsToSelector:(SEL)aSelector;
- (id)forwardingTargetForSelector:(SEL)sel;
- (void)dealloc;

@end