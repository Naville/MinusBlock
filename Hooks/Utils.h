@interface Utils : NSObject {

}

+ (NSArray*)filterList;
+(BOOL)checkURL:(NSString*)URL;
+(NSMutableArray*)classListForSelector:(SEL)Selector;

@end