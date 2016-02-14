#import "../SharedDefine.pch"
#import <substrate.h>
#import <UIKit/UIKit.h>
@interface TBCPBCell : UITableViewCell
@end
@interface TBCFrsCell : UITableViewCell
@end
@interface TBCFrsActivitiesCell : UIImageView
@end
@interface TBCFloorContentView:UIView
@end
%group Tieba

#if 1
%hook TBCMTStatusBarDisplayer
- (void)showStatusBarMessage:(id)arg1 type:(int)arg2{
	
}
- (void)onNewMessage{
	
}
- (void)onNewReplyAtMessage:(id)arg1{
	
}
%end
#endif
%hook TBCFrsCell
- (void)setObject:(id)arg1{

	if([NSStringFromClass([arg1 class]) isEqualToString:@"TBCFrsDataItem"]){
		id TBCUI=MSHookIvar<id>(arg1,"_authorInfo");//TBCUserItem
		NSString* userName=MSHookIvar<NSString*>(TBCUI,"_uNameShow");
		if([TiebaFilterList containsObject:userName]){
			[self setHidden:YES];
			[self removeFromSuperview];

		}
	}
	%orig;
}
%end

/*
%hook TBCFrsActivityCell
+ (double)tableView:(id)arg1 rowHeightForObject:(id)arg2{
	return 0;
}
- (void)setObject:(id)arg1{}
- (void)setupActivityView{}

%end
*/
%hook TBCFrsActivitiesCell
+ (double)tableView:(id)arg1 rowHeightForObject:(id)arg2{
	return 0;
}
- (void)setupActivityView{
	UILabel* A=MSHookIvar<UILabel*>(self,"_activitiesLabel");
	UIImageView* B=MSHookIvar<UIImageView*>(self,"_activitiesIcon");
	UIImageView* C=MSHookIvar<UIImageView*>(self,"_arrow");
	[A setHidden:YES];
	[A removeFromSuperview];
	[B setHidden:YES];
	[B removeFromSuperview];
	[C setHidden:YES];
	[C removeFromSuperview];
	[self setHidden:YES];
	[self removeFromSuperview];
}
- (void)setObject:(id)arg1{
	UILabel* A=MSHookIvar<UILabel*>(self,"_activitiesLabel");
	UIImageView* B=MSHookIvar<UIImageView*>(self,"_activitiesIcon");
	UIImageView* C=MSHookIvar<UIImageView*>(self,"_arrow");
	[A setHidden:YES];
	[A removeFromSuperview];
	[B setHidden:YES];
	[B removeFromSuperview];
	[C setHidden:YES];
	[C removeFromSuperview];
	[self setHidden:YES];
	[self removeFromSuperview];
}
%end
%hook TBCPBCell
- (void)reloadInnerFloor{
	NSLog(@"reloadInnerFloor");
	id A=MSHookIvar<id>(self,"_topCellView");
	NSString* userName=MSHookIvar<UILabel*>(A,"_nameLable").text;
	if([TiebaFilterList containsObject:userName]&& userName!=nil){
		[self setHidden:YES];
		[MSHookIvar<UIView*>(self,"_pbRichTextView") setHidden:YES];
		[MSHookIvar<UIView*>(self,"_pbRichTextView") removeFromSuperview];
		[self removeFromSuperview];

	}
	else{
		%orig;
	}
	NSLog(@"reloadInnerFloor END");
}
%end



%hook TBCFloorContentView
- (void)setFloorCellData:(id)arg1{//arg1 TBCFloorItem
	NSLog(@"setFloorCellData:");
	id TBCUI=MSHookIvar<id>(arg1,"_authorInfo");//TBCUserItem
	NSString* userName=MSHookIvar<NSString*>(TBCUI,"_uNameShow");
	if([TiebaFilterList containsObject:userName]){
	MSHookIvar<NSArray*>(arg1,"_contentArray")=[NSArray array];
	[self setHidden:YES];
	[self removeFromSuperview];

	}
	else{
	%orig(arg1);
		}
	NSLog(@"setFloorCellData: Done");
}
%end
%hook BannerMgr
- (id)getBannerList:(int)arg1{return nil;}
- (id)getInfoByIndex:(int)arg1{return nil;}
- (int)getInfoListCount{return 0;}
- (void)refreshInfoList{}
- (void)getDataFromDB{}
- (void)initAll{}
%end
%hook TBClientAppDelegate
- (void)showVIPLaunchImageWithDuration:(double)arg1{}
- (void)showADLaunchImage:(id)arg1 withDuration:(double)arg2{}
- (void)sendUseTime{}
- (void)sendOpen{}
%end
%hook TBCBannerCell
- (void)bindData:(id)arg1 isNeedRefresh:(_Bool)arg2{}
- (id)initWithStyle:(long long)arg1 reuseIdentifier:(id)arg2{return nil;}
%end
%hook TBCHomeBannerItem
- (void)addJsonToPropertyMappingRules{
	%orig;
	MSHookIvar<NSString*>(self,"_bannerId")=@"";
	MSHookIvar<NSString*>(self,"_imageUrlString")=@"";
	MSHookIvar<NSString*>(self,"_linkString")=@"";
}
- (id)init{
	id ret=%orig;
	MSHookIvar<NSString*>(ret,"_bannerId")=@"";
	MSHookIvar<NSString*>(ret,"_imageUrlString")=@"";
	MSHookIvar<NSString*>(ret,"_linkString")=@"";
	return ret;
}
%end


%hook TBCHomeRecommendItem
- (void)addJsonToPropertyMappingRules{
	%orig;
	MSHookIvar<NSArray*>(self,"_banners")=[NSArray array];
}
%end
%hook TBC2048ViewController
-(void)downloadAppFromAppStore{
}
%end
%hook TBC2048PromotionView
-(void)downloadAppFromAppStore{
}
- (void)bindData{
}
- (void)setupUI{
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
%hook TBCFrsBannerItem
-(id)init{
	return nil;
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


%hook TBCFrsViewController
- (id)getPromotionCell{return nil;}
- (void)tbcFrsBannerLoadFinished{}
- (void)openPromotionUrl:(id)arg1 withAdLogType:(int)arg2{}
- (BOOL)need2ShowBanner{return NO;}
- (void)viewWillAppear:(BOOL)arg1{
	MSHookIvar<BOOL>(self,"_showBanner")=NO;
	%orig;
}
%end

%end

extern void init_Tieba_hook(){
if(objc_getClass("TBCPromotionCell")!=NULL){
%init(Tieba)
}
}
