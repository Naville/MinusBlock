#import "./Utils.h"
static NSArray* AdBlockSubscriptionList=[@"https://easylist-downloads.adblockplus.org/easylist.txt",@"https://easylist-downloads.adblockplus.org/adwarefilters.txt",@"https://easylist-downloads.adblockplus.org/easylistchina.txt"];
@implementation Utils : NSObject
+ (NSArray*)filterList{
NSMutableArray* returnArray=[NSMutableArray array];
	for(int i=0;i<AdBlockSubscriptionList.count;i++){
		NSString* subList=[NSString stringWithContentsOfURL:[NSURL URLWithString:[AdBlockSubscriptionList objectAtIndex:i]]];
		NSMutableArray* breakDownList=[NSMutableArray arrayWithArray:[subList componentsSeparatedByString:@"\n"]];
		[returnArray addObjectsFromArray:breakDownList];
		//Comments in the original file can safely be ignored

	}
	return returnArray;
}
@end