#import "../SharedDefine.pch"
#import "DMOfferWallManager.h"
void (*olddmOfferWallManagerCompleteVideoOffer)(id self, SEL _cmd,DMOfferWallManager* manager,NSNumber* totalPoint,NSNumber* consumedPoint);
void newdmOfferWallManagerCompleteVideoOffer(id self, SEL _cmd,DMOfferWallManager* manager,NSNumber* totalPoint,NSNumber* consumedPoint) {
olddmOfferWallManagerCompleteVideoOffer(self,_cmd,manager,[NSNumber numberWithInt:999999],[NSNumber numberWithInt:0]);
}

extern void init_DomobAdwall_hook(){
NSMutableArray* classList=[Utils classListForSelector:@selector(dmOfferWallManagerCompleteVideoOffer:withTotalPoint:consumedPoint:)];
for(int x=0;x<classList.count;x++){
	Class Hooked=NSClassFromString([classList objectAtIndex:x]);
	MSHookMessageEx(Hooked, @selector(dmOfferWallManagerCompleteVideoOffer:withTotalPoint:consumedPoint:),
        (IMP) newdmOfferWallManagerCompleteVideoOffer, (IMP*) &olddmOfferWallManagerCompleteVideoOffer);
}
}
