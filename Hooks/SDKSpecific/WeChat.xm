#import "../SharedDefine.pch"
%group WeChat
%hook FindFriendEntryViewController
- (int)numberOfSectionsInTableView:(id)arg1{
	return 2;
}
%end
%end
extern void init_WeChat_hook(){//Don't Change This Function Name Or ELSE YOU WILL GET COMPILE ERROR
if (objc_getClass("FindFriendEntryViewController")!=NULL){
	%init(WeChat);
}
}
