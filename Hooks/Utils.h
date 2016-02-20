@interface Utils : NSObject {

}
@property (atomic, copy) NSArray *filterList;
@property (atomic, copy) NSArray *TiebaBlockedList;
@property (atomic, copy) NSArray *TiebaRoughBlockList;
+(id)sharedManager;
-(void)setup;
-(BOOL)checkURL:(NSString*)URL;
+(NSMutableArray*)classListForSelector:(SEL)Selector;
-(BOOL)TiebaShouldBlock:(NSString*)userName;

@end