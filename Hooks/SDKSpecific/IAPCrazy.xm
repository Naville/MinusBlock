#import "../SharedDefine.pch"
#define FrogLog @"你们啊，不要总想着搞个什么大新闻，放个5~6MB的垃圾代码就为显示广告，就来把用户骚扰一番,你们啊,Naive!我是身经百战，见得多了我感觉你们啊，还是要学习一个英语的那套理论，不要连单词都拼不好，就来搞什么越狱开发。人丑就要多读书，识得唔识得啊?"

%group IAPCrazy
%hook ICRERecomAppItem
- (id)init{
	return nil;
}
%end
%hook ICREPromoteItem
- (id)init{
	return nil;
}
%end
%hook ICRERecomAppCell
- (void)updateAppImage:(id)arg1 withUrl:(id)arg2{}
- (void)ppClicked:(id)arg1{}
- (void)appStoreClicked:(id)arg1{}
- (void)calBtnRect{}
- (void)layoutSubviews{}
- (void)cellWillAppear{}
- (void)cellDidLoad{}
%end
%hook ICREPromoteAppCell
- (void)updateAppImage:(id)arg1 withUrl:(id)arg2{

}
- (void)btnClicked{

}
- (void)calBtnRect{

}
- (void)cellWillAppear{

}
- (void)cellDidLoad{

}
-(id)init{
	return nil;
}
%end
%hook ZMICRecommandAppManager
- (void)loadAppsInfo:(id)arg1 sinfo:(id)arg2{
	
}
- (void)updateJsonMap{

}
- (void)reloadData{

}
- (void)updateDataFromServerWithList:(id)arg1{

}
- (void)updateData{

}
%end
%hook ZMICRecommandApp
+ (id)convertFromRecommandInfo:(id)arg1{
	return nil;
}
+ (id)appWithDictionary:(id)arg1{
	return nil;
}
- (void)loadIconImageForContianer:(id)arg1{
}
- (id)getIconImage:(id)arg1{
	return nil;
}
- (id)initWithDictionary:(id)arg1{
	return nil;
}
%end
%hook ZMICPromoteAppManager
- (id)apps:(int)arg1{
	return nil;
}
- (void)initContent:(id)arg1{

}
%end
%hook ZMICPromoteApp
+ (id)convertFromRecommandInfo:(id)arg1{
	return nil;
}
+ (id)appWithDictionary:(id)arg1{
	return nil;
}
- (void)loadIconImageForContianer:(id)arg1{
}
- (id)getIconImage:(id)arg1{
	return nil;
}
- (id)initWithDictionary:(id)arg1{
	return nil;
}
%end
%hook ICZUtil
-(void)loadadcontnet{
NSLog(FrogLog);
}
-(void)loadAdmobInterstital{
NSLog(FrogLog);
}
%end
%end
extern void RealInitIAPCrazy(const struct mach_header* mh, intptr_t vmaddr_slide){
	 for(int i=0;i<_dyld_image_count();i++){
	 	NSString* Name=[NSString stringWithUTF8String: _dyld_get_image_name(i)];
	 	//NSLog(@"ImageName:%@",Name);
	 	if([Name containsString:@"IAPCrazy"]&&Name!=nil){//Just Incase
	 		NSLog(@"Init IAPCrazy ImageHook");
			%init(IAPCrazy);

	 	}

	 }
}

extern void init_IAPCrazy_hook(){
NSLog(@"Setting Up IAPCrazy ImageHooks");
_dyld_register_func_for_add_image(RealInitIAPCrazy);
}
