#import "../SharedDefine.pch"
#import <substrate.h>
#import <UIKit/UIKit.h>

//#define LOG

@interface TBRichTextVO : NSObject
@property(copy, nonatomic) NSString *shareText; // @synthesize shareText;
@property(retain, nonatomic) NSMutableString *richTextCopyString; // @synthesize richTextCopyString;
@property(retain, nonatomic) NSMutableArray *iVedioArray; // @synthesize iVedioArray;
@property(retain, nonatomic) NSMutableArray *iEmojiArray; // @synthesize iEmojiArray;
@property(retain, nonatomic) NSMutableArray *iImageArray; // @synthesize iImageArray;
@property(retain, nonatomic) NSMutableAttributedString *attributedString;
@end


@interface TBCUserItem : NSObject
@property(copy, nonatomic) NSString *uName; 
@property(copy, nonatomic) NSString *uNameShow; 
@end
@interface TBCFloorItem : NSObject
@property(copy, nonatomic) NSString *iFloorId;
@property(retain, nonatomic) TBRichTextVO *iRichTextVO; // @synthesize iRichTextVO=_iRichTextVO;
@property(retain, nonatomic) NSArray *contentArray; // @synthesize contentArray=_contentArray;
@property(retain, nonatomic) TBCUserItem *authorInfo; // @synthesize authorInfo=_authorInfo;
@end
@interface TBCPBCellItem :NSObject
@property(copy, nonatomic) NSString *bimg_format; // @synthesize bimg_format=_bimg_format;
@property(copy, nonatomic) NSString *bimg_url; 
@property(retain, nonatomic) NSDictionary *xiaoYingInfo;
@property(retain, nonatomic) TBCUserItem *authorInfo;
@property(retain, nonatomic) NSMutableArray *addPostList; // @synthesize addPostList=_addPostList;
@property(retain, nonatomic) NSMutableArray *replyFloorArray; // @synthesize replyFloorArray=_replyFloorArray;
@property(retain, nonatomic) NSMutableArray *contentArray; // @synthesize contentArray=_contentArray;
@property(retain, nonatomic) TBRichTextVO *iSignatureRichTextVO; // @synthesize iSignatureRichTextVO=_iSignatureRichTextVO;
@property(retain, nonatomic) TBRichTextVO *iRichTextVO; // @synthesize iRichTextVO=_iRichTextVO;
@end

@interface TBCFrsDataItem : NSObject

@property(copy, nonatomic) NSString *hotWeight; // @synthesize hotWeight=_hotWeight;
@property(nonatomic) double frsItemHeight; // @synthesize frsItemHeight=_frsItemHeight;
@property(nonatomic) _Bool needShowColorEgg; // @synthesize needShowColorEgg=_needShowColorEgg;
@property(retain, nonatomic) NSDictionary *userInfoMap; // @synthesize userInfoMap=_userInfoMap;
@property(retain, nonatomic) NSArray *postList; // @synthesize postList=_postList;
@property(retain, nonatomic) NSArray *actInfo; // @synthesize actInfo=_actInfo;
@property(retain, nonatomic) NSArray *voiceInfo; // @synthesize voiceInfo=_voiceInfo;
@property(retain, nonatomic) NSArray *pMediaCount; // @synthesize pMediaCount=_pMediaCount;
@property(retain, nonatomic) NSMutableArray *pMediaArray; // @synthesize pMediaArray=_pMediaArray;
@property(retain, nonatomic) NSMutableArray *pContentArray; // @synthesize pContentArray=_pContentArray;
@property(retain, nonatomic) NSArray *pMedia; // @synthesize pMedia=_pMedia;
@property(retain, nonatomic) NSArray *pContent; // @synthesize pContent=_pContent;
@property(retain, nonatomic) NSNumber *uIsManager; // @synthesize uIsManager=_uIsManager;
@property(retain, nonatomic) TBCUserItem *authorInfo; // @synthesize authorInfo=_authorInfo;
@property(retain, nonatomic) NSString *uIdAuthor; // @synthesize uIdAuthor=_uIdAuthor;
@property(retain, nonatomic) NSNumber *tIsNTitle; // @synthesize tIsNTitle=_tIsNTitle;
@property(retain, nonatomic) NSNumber *tIsActivity; // @synthesize tIsActivity=_tIsActivity;
@property(retain, nonatomic) NSNumber *tIsLive; // @synthesize tIsLive=_tIsLive;
@property(retain, nonatomic) NSNumber *tIsGood; // @synthesize tIsGood=_tIsGood;
@property(retain, nonatomic) NSString *tForumName; // @synthesize tForumName=_tForumName;
@property(retain, nonatomic) NSString *tForumId; // @synthesize tForumId=_tForumId;
@property(retain, nonatomic) NSString *tTimeline; // @synthesize tTimeline=_tTimeline;
@property(retain, nonatomic) NSNumber *tLastTimeInt; // @synthesize tLastTimeInt=_tLastTimeInt;
@property(retain, nonatomic) NSNumber *tReplyNum; // @synthesize tReplyNum=_tReplyNum;
@property(retain, nonatomic) NSString *tTitle; // @synthesize tTitle=_tTitle;
@property(retain, nonatomic) NSString *tID; // @synthesize tID=_tID;
@end
@interface TBCPBCell : UITableViewCell
@end
@interface TBCFrsCell : UITableViewCell
@end
@interface TBCFrsActivitiesCell : UIImageView
@end
@interface TBCFloorContentView:UIView
@end
%group Tieba
%hook TBCFrsDataListItem
-(NSMutableArray*)threadList{
	NSMutableArray* ret=[%orig mutableCopy];
	for(int i=0;i<ret.count;i++){
		TBCFrsDataItem* tmp=[ret objectAtIndex:i];
		NSString* PosterName=tmp.authorInfo.uNameShow;
		if([[Utils sharedManager] TiebaShouldBlock:PosterName]){
#ifdef LOG
			NSLog(@"TBCFrsDataListItemBlocked:%@",PosterName);
#endif
			[ret removeObject:tmp];

		}else{
#ifdef LOG
			NSLog(@"TBCFrsDataListItemPosterName:%@----%@",PosterName,tmp.authorInfo.uName);
#endif
		}

	}
	return ret;

} 
%end
%hook TBCFloorListItem
-(NSMutableArray*)subpostArray{
	NSMutableArray* ret=%orig;
	for(int i=0;i<ret.count;i++){
		TBCFloorItem* tmp=[ret objectAtIndex:i];
		NSString* PosterName=tmp.authorInfo.uNameShow;
		//NSLog(@"%@",tmp.contentArray);
		if([[Utils sharedManager] TiebaShouldBlock:PosterName]){
#ifdef LOG
			NSLog(@"TBCFloorListItemBlocked:%@",PosterName);
#endif
			[ret removeObject:tmp];
			//[tmp.iRichTextVO.attributedString.mutableString setString:TiebaBlockNote];
			//tmp.iRichTextVO.shareText=TiebaBlockNote;
			//tmp.iRichTextVO.richTextCopyString=[NSMutableString stringWithString:TiebaBlockNote];
			//tmp.iRichTextVO.iVedioArray=[NSMutableArray array];
			//tmp.iRichTextVO.iEmojiArray=[NSMutableArray array];
			//tmp.iRichTextVO.iImageArray=[NSMutableArray array];
			//tmp.contentArray=[NSArray array];
		}else{
#ifdef LOG
			NSLog(@"TBCFloorListItem:PosterName:%@",PosterName);
#endif
		}

	}
	//List of TBCFloorItem: 楼中楼
	return ret;
}
%end

%hook TBCPBListItem
-(NSMutableArray*)items{
	//楼里的回贴列表
	//List of TBCPBCellItem*
	NSMutableArray* ret=%orig;
	for(int i=0;i<ret.count;i++){
		TBCPBCellItem* tmp=[ret objectAtIndex:i]; 
		for(int j=0;j<tmp.replyFloorArray.count;j++){
			TBCFloorItem* T=[tmp.replyFloorArray objectAtIndex:j];
			NSString* replyAuthName=T.authorInfo.uNameShow;
			if([TiebaFilterList containsObject:replyAuthName]){
				NSLog(@"ReplyBlocked:%@",replyAuthName);
				[tmp.replyFloorArray removeObject:T];
			}

		}
		NSString* PosterName=tmp.authorInfo.uNameShow;
		if([[Utils sharedManager] TiebaShouldBlock:PosterName]){
#ifdef LOG
			NSLog(@"TBCPBListItemBlocked:%@",PosterName);
#endif
			[ret removeObject:tmp];

		}else{
#ifdef LOG
			NSLog(@"TBCPBListItemName:%@",PosterName);
#endif
		}

	}
	return ret;

}
%end
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
