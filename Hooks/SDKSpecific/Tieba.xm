#import "../SharedDefine.pch"
//#import "./TBDefines/TBDefines.h"
//static void (*downloadAppFromAppStore)(id self, SEL _cmd);

//static void newdownloadAppFromAppStore(id self, SEL _cmd) {}
%group Tieba
%hook TBC2048ViewController
-(void)downloadAppFromAppStore{
}
%end
%hook TBC2048PromotionView
- (id)initWithFrame:(void*)arg1{
return nil;
}
-(void)downloadAppFromAppStore{
	[self dealloc];
}
- (void)bindData{
	[self dealloc];
}
- (void)setupUI{
	[self dealloc];
}
%end
%hook TBCPromotionCell
+ (_Bool)shouldShowAppImg{
		return NO;
}
+ (_Bool)shouldShowAppIcon{
	return NO;
}
- (void)openUrl:(id)arg1{

}
- (void)bindData:(id)arg1{

}
%end
%hook TBCPromotionGoodsItem
-(id)init{
	return nil;
}
%end
%hook TBCPromotionItem
-(id)init{
	return nil;
}
%end





%end

extern void init_Tieba_hook(){
if(objc_getClass("TBCPromotionCell")!=NULL){
%init(Tieba)
}
}
