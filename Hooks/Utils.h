@interface Utils : NSObject {

}
@property (atomic, copy) NSArray *filterList;
+(id)sharedManager;
-(void)setup;
-(BOOL)checkURL:(NSString*)URL;
+(NSMutableArray*)classListForSelector:(SEL)Selector;

@end