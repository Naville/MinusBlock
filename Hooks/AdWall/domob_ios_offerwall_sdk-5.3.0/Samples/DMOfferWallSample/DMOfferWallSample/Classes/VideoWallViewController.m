//
//  VideoWallViewController.m
//  DMOfferWallSample
//
//  Created by domob.
//  Copyright (c) 2014年 domob. All rights reserved.
//

#import "VideoWallViewController.h"
#import "DMOfferWallManager.h"

@interface VideoWallViewController ()<DMOfferWallManagerDelegate> {
    
    DMOfferWallManager *_manager;
}

@end

@implementation VideoWallViewController

#pragma mark - Alloc/Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setTitle:@"视频"];
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    presentButton.frame = CGRectMake(50, 100, 120, 25);
    [presentButton setTitle:@"显示视频积分墙" forState:UIControlStateNormal];
    [presentButton addTarget:self action:@selector(showVideoWall) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentButton];
    
    NSLog(@"Start to init DMOfferWallManager");
    _manager = [[DMOfferWallManager alloc] initWithPublisherID:@"96ZJ39xwzegKfwTA/L"
                                                      andUserID:nil];
    _manager.delegate = self;
    // !!!:重要：如果需要禁用应用内下载，请将此值设置为YES。
    _manager.disableStoreKit = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    _manager.delegate = nil;
    [_manager release];
    _manager = nil;
    
    [super dealloc];
}

#pragma mark - UIResponder

- (void)showVideoWall {
    
    [_manager presentOfferWallWithType:eDMOfferWallTypeVideo];
}

#pragma mark - Manager Delegate

// 积分墙开始加载列表数据
- (void)dmOfferWallManagerDidStartLoad:(DMOfferWallManager *)manager
                         offerWallType:(DMOfferWallType)type {
    
    switch (type) {
            
        case eDMOfferWallTypeList:
            NSLog(@"<demo>ListWallDidStartLoad");
            break;
        case eDMOfferWallTypeVideo:
            NSLog(@"<demo>VideoWallDidStartLoad");
            break;
        case eDMOfferWallTypeInterstitial:
            NSLog(@"<demo>InterstitialWallDidStartLoad");
            break;
        default:
            break;
    }
}

// 积分墙加载完成。
- (void)dmOfferWallManagerDidFinishLoad:(DMOfferWallManager *)manager
                          offerWallType:(DMOfferWallType)type {
    
    switch (type) {
            
        case eDMOfferWallTypeList:
            NSLog(@"<demo>ListWallDidFinishLoad");
            break;
        case eDMOfferWallTypeVideo:
            NSLog(@"<demo>VideoWallDidFinishLoad");
            break;
        case eDMOfferWallTypeInterstitial:
            NSLog(@"<demo>InterstitialWallDidFinishLoad");
            break;
        default:
            break;
    }
}

// 积分墙加载失败。可能的原因由error部分提供，例如网络连接失败、被禁用等。
- (void)dmOfferWallManager:(DMOfferWallManager *)manager
       failedLoadWithError:(NSError *)error
             offerWallType:(DMOfferWallType)type {
    
    switch (type) {
            
        case eDMOfferWallTypeList:
            NSLog(@"<demo>ListWallFailedLoadWithError:%@",error);
            break;
        case eDMOfferWallTypeVideo:
            NSLog(@"<demo>VideoWallFailedLoadWithError:%@",error);
            break;
        case eDMOfferWallTypeInterstitial:
            NSLog(@"<demo>InterstitialWallFailedLoadWithError:%@",error);
            break;
        default:
            break;
    }
}

// 当积分墙要被呈现出来时，回调该方法
- (void)dmOfferWallManagerWillPresent:(DMOfferWallManager *)manager
                        offerWallType:(DMOfferWallType)type {
    
    switch (type) {
            
        case eDMOfferWallTypeList:
            NSLog(@"<demo>ListWallWillPresent");
            break;
        case eDMOfferWallTypeVideo:
            NSLog(@"<demo>VideoWallWillPresent");
            break;
        case eDMOfferWallTypeInterstitial:
            NSLog(@"<demo>InterstitialWallWillPresent");
            break;
        default:
            break;
    }
}

//  积分墙页面关闭。
- (void)dmOfferWallManagerDidClosed:(DMOfferWallManager *)manager
                      offerWallType:(DMOfferWallType)type {
    
    switch (type) {
            
        case eDMOfferWallTypeList:
            NSLog(@"<demo>ListWallDidClosed");
            break;
        case eDMOfferWallTypeVideo:
            NSLog(@"<demo>VideoWallDidClosed");
            break;
        case eDMOfferWallTypeInterstitial:
            NSLog(@"<demo>InterstitialWallDidClosed");
            break;
        default:
            break;
    }
}

// 成功获取视频积分
- (void)dmOfferWallManagerCompleteVideoOffer:(DMOfferWallManager *)manager
                              withTotalPoint:(NSNumber *)totalPoint
                               consumedPoint:(NSNumber *)consumedPoint {
    NSLog(@"CompleteVideoOfferWithTotalpoint:%@ consumedPoint:%@",totalPoint,consumedPoint);
}

// 获取视频积分出错
- (void)dmOfferWallManagerUncompleteVideoOffer:(DMOfferWallManager *)manager withError:(NSError *)error {
    
    NSLog(@"UncompleteVideoOfferWithError:%@",error);
}

@end
