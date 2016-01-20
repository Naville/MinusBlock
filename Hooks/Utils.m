#import "./Utils.h"
#import "./SharedDefine.pch"
@implementation Utils : NSObject
@synthesize filterList = _filterList;
+(id)sharedManager{
 	static Utils *sharedUtils = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedUtils = [[self alloc] init];
    });
    return sharedUtils;


}

-(void)setup{
NSMutableArray* LocalArray=[NSMutableArray arrayWithContentsOfFile:FiltListPath];
dispatch_queue_t imageQueue = dispatch_queue_create("FilterUpdate",NULL);
dispatch_async(imageQueue, ^{
    NSMutableArray* returnArray=[NSMutableArray array];
    NSArray* AdBlockSubscriptionList=AdBlockSubscriptionListConst;
    for(int i=0;i<[AdBlockSubscriptionList count];i++){
        NSString* subList=[NSString stringWithContentsOfURL:[NSURL URLWithString:[AdBlockSubscriptionList objectAtIndex:i]] encoding:NSUTF8StringEncoding error:nil];
        NSMutableArray* breakDownList=[NSMutableArray arrayWithArray:[subList componentsSeparatedByString:@"\n"]];
        [returnArray addObjectsFromArray:breakDownList];
     }
     [returnArray writeToFile:FiltListPath atomically:YES];
        
        
}); 

_filterList=LocalArray;
}
-(BOOL)checkURL:(NSString*)URL{
NSArray* regularList=_filterList;
	for(int i =0;i<regularList.count;i++){
		if ([URL rangeOfString:[regularList objectAtIndex:i] options:NSRegularExpressionSearch].location != NSNotFound){

			return FALSE;
		}



	}
	return TRUE;

}
+(NSMutableArray*)classListForSelector:(SEL)Selector{
int numClasses;
NSMutableArray* returnArray=[NSMutableArray array];
Class *classes = NULL;

classes = NULL;
numClasses = objc_getClassList(NULL, 0);
NSLog(@"Number of classes: %d", numClasses);

if (numClasses > 0 )
{
    classes = (__unsafe_unretained Class *)malloc(sizeof(Class) * numClasses);
    numClasses = objc_getClassList(classes, numClasses);
    for (int i = 0; i < numClasses; i++) {
        id obj=[[classes[i] alloc] init];
        if([obj respondsToSelector:Selector]){

        [returnArray addObject:NSStringFromClass([obj class])];
        }
    }
    free(classes);
}

return returnArray;
}
@end