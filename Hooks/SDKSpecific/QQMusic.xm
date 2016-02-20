#import "../SharedDefine.pch"
%group QQMusic
%hook AppData
-(BOOL)IsForbiddenIP{

	return NO;
}
%end
%hook BETouchView
- (void)setTarget:(id)arg1 Fun:(SEL)arg2{
NSLog(@"SEL:%@ Target:%@",NSStringFromSelector(arg2),arg1);
%orig;
}
%end
%end
extern void init_QQMusic_hook(){//Don't Change This Function Name Or ELSE YOU WILL GET COMPILE ERROR
if (objc_getClass("AppData")!=NULL){%init(QQMusic);
}
}
