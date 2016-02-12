#import "../SharedDefine.pch"
#import <substrate.h>
#import <UIKit/UIKit.h>
@interface TBCPBCell : UITableViewCell
@end
@interface TBCFrsCell : UITableViewCell
@end
%group Tieba

%hook TBCFrsCell
- (void)setObject:(id)arg1{

	if([NSStringFromClass([arg1 class]) isEqualToString:@"TBCFrsDataItem"]){
		id TBCUI=MSHookIvar<id>(arg1,"_authorInfo");//TBCUserItem
		NSString* userName=MSHookIvar<NSString*>(TBCUI,"_uNameShow");
		if([TiebaFilterList containsObject:userName]){
			UITableViewCell* Current=self;
			[Current setHidden:YES];

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
//- (void)setObject:(id)arg1{}
//- (void)setupActivityView{}
%end
%hook TBCPBCell
- (void)reloadInnerFloor{
	id A=MSHookIvar<id>(self,"_topCellView");
	NSString* userName=MSHookIvar<UILabel*>(A,"_nameLable").text;
	if([TiebaFilterList containsObject:userName]){
		//UITableViewCell* Current=self;
		//[Current setHidden:YES];
		id X=MSHookIvar<id>(self,"_pbRichTextView");
		id TBRichText=MSHookIvar<id>(X,"_richTextVO");
		MSHookIvar<NSMutableAttributedString *>(TBRichText,"_attributedString")=[[NSMutableAttributedString alloc] initWithString:TiebaBlockNote];  
		MSHookIvar<NSMutableArray *>(TBRichText,"iImageArray")=[NSMutableArray array];
		MSHookIvar<NSMutableArray *>(TBRichText,"iEmojiArray")=[NSMutableArray array];
		MSHookIvar<NSMutableArray *>(TBRichText,"iVedioArray")=[NSMutableArray array];
		MSHookIvar<NSMutableArray *>(TBRichText,"_iVoiceArray")=[NSMutableArray array];
		MSHookIvar<NSMutableArray *>(TBRichText,"_xiaoYingArray")=[NSMutableArray array];
		MSHookIvar<NSString *>(TBRichText,"shareText")=@"Blocked By MinusBlock";
		MSHookIvar<NSString *>(TBRichText,"richTextCopyString")=[NSMutableString stringWithString:TiebaBlockNote];
	}
	%orig;
}
%end



%hook TBCFloorContentView
- (void)setFloorCellData:(id)arg1{//arg1 TBCFloorItem

	id TBCUI=MSHookIvar<id>(arg1,"_authorInfo");//TBCUserItem
	NSString* userName=MSHookIvar<NSString*>(TBCUI,"_uNameShow");
	if([TiebaFilterList containsObject:userName]){
	MSHookIvar<NSArray*>(arg1,"_contentArray")=[NSArray array];
	id TBRichText=MSHookIvar<id>(arg1,"_iRichTextVO");
	MSHookIvar<NSMutableAttributedString *>(TBRichText,"_attributedString")=[[NSMutableAttributedString alloc] initWithString:TiebaBlockNote];  
	MSHookIvar<NSMutableArray *>(TBRichText,"iImageArray")=[NSMutableArray array];
	MSHookIvar<NSMutableArray *>(TBRichText,"iEmojiArray")=[NSMutableArray array];
	MSHookIvar<NSMutableArray *>(TBRichText,"iVedioArray")=[NSMutableArray array];
	MSHookIvar<NSMutableArray *>(TBRichText,"_iVoiceArray")=[NSMutableArray array];
	MSHookIvar<NSMutableArray *>(TBRichText,"_xiaoYingArray")=[NSMutableArray array];
	MSHookIvar<NSString *>(TBRichText,"shareText")=@"Blocked By MinusBlock";
	MSHookIvar<NSString *>(TBRichText,"richTextCopyString")=[NSMutableString stringWithString:TiebaBlockNote];
	}
	%orig;
}
%end
%hook BannerMgr
+ (id)sharedMgr{
	return nil;
}
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
- (id)init{
	id ret=%orig;
	MSHookIvar<NSArray*>(ret,"_banners")=[NSArray array];
	return ret;
}
%end
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
