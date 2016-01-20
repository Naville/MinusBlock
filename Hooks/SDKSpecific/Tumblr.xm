#import "../SharedDefine.pch"
%group Tumblr
%hook TMAPIResponseTimelineObject
-(BOOL) isPostWithDecoratedAdvertisementTypeRequiringManufacturedSortID{

	return TRUE;
}
%end
%hook TMAdvertisement
+(BOOL) isRecommendationType:(int)type{
	return FALSE;
}
+(BOOL) showsFollowButtonOnPostsOfType:(int)type{
	return FALSE;
}
+(BOOL) isDecoratedAdvertisementTypeRequiringManufacturedSortID:(int)ID{
	return FALSE;
}
+(BOOL) isDecoratedAdvertisementWithManufacturedSortID:(id)obj{
	return FALSE;
}
%end

%end
extern void init_Tumblr_hook(){
%init(Tumblr);
}
