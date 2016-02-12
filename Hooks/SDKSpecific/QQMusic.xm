#import "../SharedDefine.pch"
%group QQMusic
%hook AppData
-(BOOL)IsForbiddenIP{

	return NO;
}
%end
%end
extern void init_QQMusic_hook(){//Don't Change This Function Name Or ELSE YOU WILL GET COMPILE ERROR
if (objc_getClass("AppData")!=NULL){%init(QQMusic);
}
}
