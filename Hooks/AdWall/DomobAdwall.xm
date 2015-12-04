#import "../SharedDefine.pch"
#import "DMOfferWallManager.h"
void (*olddmOfferWallManagerCompleteVideoOffer)(id self, SEL _cmd,DMOfferWallManager* manager,NSNumber* totalPoint,NSNumber* consumedPoint);
void newdmOfferWallManagerCompleteVideoOffer(id self, SEL _cmd,DMOfferWallManager* manager,NSNumber* totalPoint,NSNumber* consumedPoint) {
olddmOfferWallManagerCompleteVideoOffer(self,_cmd,manager,[NSNumber numberWithInt:999999],[NSNumber numberWithInt:0]);
}
void (*olddmOfferWallManager)(id self,SEL _cmd,DMOfferWallManager * manager,NSNumber * totalPoint,NSNumber *consumedPoint);
void newdmOfferWallManager(id self,SEL _cmd,DMOfferWallManager * manager,NSNumber * totalPoint,NSNumber *consumedPoint){

olddmOfferWallManager(self,_cmd,manager,[NSNumber numberWithInt:999999],[NSNumber numberWithInt:0]);

}
void (*oldDM2)(id self,SEL _cmd,DMOfferWallManager * manager,DMOfferWallConsumeStatus statusCode,NSNumber * totalPoint,NSNumber *consumedPoint);
void newDM2(id self,SEL _cmd,DMOfferWallManager * manager,DMOfferWallConsumeStatus statusCode,NSNumber * totalPoint,NSNumber *consumedPoint){

olddmOfferWallManager(self,_cmd,manager,eDMOfferWallConsumeSuccess,[NSNumber numberWithInt:999999],[NSNumber numberWithInt:0]);

}



extern void init_DomobAdwall_hook(){
NSMutableArray* classList=[Utils classListForSelector:@selector(dmOfferWallManagerCompleteVideoOffer:withTotalPoint:consumedPoint:)];
for(int x=0;x<classList.count;x++){
	Class Hooked=NSClassFromString([classList objectAtIndex:x]);
	MSHookMessageEx(Hooked, @selector(dmOfferWallManagerCompleteVideoOffer:withTotalPoint:consumedPoint:),
        (IMP) newdmOfferWallManagerCompleteVideoOffer, (IMP*) &olddmOfferWallManagerCompleteVideoOffer);
}
NSMutableArray* classList2=[Utils classListForSelector:@selector(dmOfferWallManager:receivedTotalPoint:totalConsumedPoint:)];
for(int y=0;y<classList2.count;y++){
		Class Hooked=NSClassFromString([classList objectAtIndex:y]);
	MSHookMessageEx(Hooked, @selector(dmOfferWallManager:receivedTotalPoint:totalConsumedPoint:),
        (IMP)newdmOfferWallManager, (IMP*) &olddmOfferWallManager);


}
NSMutableArray* classList3=[Utils classListForSelector:@selector(dmOfferWallManager:consumedWithStatusCode:totalPoint:totalConsumedPoint:)];
for(int y=0;y<classList3.count;y++){
		Class Hooked=NSClassFromString([classList objectAtIndex:y]);
	MSHookMessageEx(Hooked, @selector(dmOfferWallManager:consumedWithStatusCode:totalPoint:totalConsumedPoint:),
        (IMP)newDM2, (IMP*) &oldDM2);


}

}
