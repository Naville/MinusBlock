#import "../Utils.h"
#import "../SharedDefine.pch"
%hook NSURLConnection

+ (NSData *)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse **)response error:(NSError **)error {
NSString* requestString=request.URL.absoluteString;
if([Utils checkURL:requestString]){

	return %orig;
}
else{
	NSMutableURLRequest *newRequest = [request mutableCopy];
	NSURL *newURL = [NSURL URLWithString:AdURL];
	[newRequest setURL:newURL];
	return %orig(request,response,error);

}


}

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate {
	NSString* requestString=request.URL.absoluteString;
if([Utils checkURL:requestString]){

	return %orig;
}
else{
	NSMutableURLRequest *newRequest = [request mutableCopy];
	NSURL *newURL = [NSURL URLWithString:AdURL];
	[newRequest setURL:newURL];
	return %orig(request,delegate);

}



}

- (id)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately {
NSString* requestString=request.URL.absoluteString;
if([Utils checkURL:requestString]){

	return %orig;
}
else{
	NSMutableURLRequest *newRequest = [request mutableCopy];
	NSURL *newURL = [NSURL URLWithString:AdURL];
	[newRequest setURL:newURL];
	return %orig(request,delegate,startImmediately);

}
}


%end

