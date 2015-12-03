#import "./Utils.h"
#import "./SharedDefine.pch"
@implementation Utils : NSObject
+ (NSArray*)filterList{
NSMutableArray* returnArray=[NSMutableArray array];
NSArray* AdBlockSubscriptionList=AdBlockSubscriptionListConst;
	for(int i=0;i<[AdBlockSubscriptionList count];i++){
		NSString* subList=[NSString stringWithContentsOfURL:[NSURL URLWithString:[AdBlockSubscriptionList objectAtIndex:i]] encoding:NSUTF8StringEncoding error:nil];
		NSMutableArray* breakDownList=[NSMutableArray arrayWithArray:[subList componentsSeparatedByString:@"\n"]];
		[returnArray addObjectsFromArray:breakDownList];
		//Comments in the original file can safely be ignored

	}
	return returnArray;
}
+(BOOL)checkURL:(NSString*)URL{
NSArray* regularList=[Utils filterList];
	for(int i =0;i<regularList.count;i++){
		if ([URL rangeOfString:[regularList objectAtIndex:i] options:NSRegularExpressionSearch].location != NSNotFound){

			return FALSE;
		}



	}
	return TRUE;

}
@end