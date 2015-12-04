//
//  AdViewVideo.h
//  AdViewVideo
//
//  Created by maming on 15-4-8.
//  Copyright (c) 2015年 maming. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol AdViewVideoDelegate <NSObject>

@optional
//***** ADVideoTypeInstl 应用回调
- (void)AdViewVideoPlayStarted;
- (void)AdViewVideoPlayEnded;
- (void)AdViewVideoClosedWithState:(BOOL)isPlayEnded;

//***** ADVideoTypePreMovie 应用回调

/*
 * 参数videoSource:贴片广告视频播放地址数组
 * 参数cUrl:广告点击跳转地址
 * 参数clickReportArr:第三方点击汇报地址数组，可能为空 如有值必须汇报否则影响收益
 * 参数showReportArr:第三方展示汇报地址数组，可能为空 如有值必须汇报否则影响收益
 */
- (void)AdViewVideoDidReceiveData:(NSArray*)videoSource withClickUrl:(NSString*)cUrl reportClickArr:(NSArray*)clickReportArr reportShowArr:(NSArray*)showReportArr;
- (void)AdViewVideoFailReceiveDataWithError:(NSError*)error;
@end

typedef enum {
    ADVideoTypeInstl,
    ADVideoTypePreMovie,
}ADVideoType;

@interface AdViewVideo: NSObject

+ (id)playVideoWithAppId:(NSString*)appId controller:(UIViewController*)controller videoType:(ADVideoType)videoType delegate:(id<AdViewVideoDelegate>)videoDelegate;

@end
