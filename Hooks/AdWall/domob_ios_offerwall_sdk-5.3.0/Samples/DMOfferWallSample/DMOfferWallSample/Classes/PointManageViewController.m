//
//  PointManageViewController.m
//  DMOfferWallSample
//
//  Created by domob.
//  Copyright (c) 2014年 domob. All rights reserved.
//

#import "PointManageViewController.h"
#import "DMOfferWallManager.h"
#import "Toast+UIView.h"

@interface PointManageViewController ()<DMOfferWallManagerDelegate> {
    
    DMOfferWallManager *_manager;
    
    UITextField *_pointFiled;
    UILabel *_pointLabel;
    UILabel *_statusLabel;
    UILabel *_consumeLabel;
}


@end

@implementation PointManageViewController

#pragma mark - Alloc/Init

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
	[self setTitle:@"积分管理"];
    
    UIControl *mainView = [[UIControl alloc] initWithFrame:self.view.bounds];
    [mainView addTarget:self action:@selector(hideKeyBoard) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:mainView];
    [mainView release];
    
    UIButton *cosumeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    cosumeButton.frame = CGRectMake(20, 100, 100, 20);
    [cosumeButton setTitle:@"消费指定积分" forState:UIControlStateNormal];
    [cosumeButton addTarget:self action:@selector(consume) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:cosumeButton];
    
    _pointFiled = [[UITextField alloc] initWithFrame:CGRectMake(130, 100, 100, 20)];
    _pointFiled.text = @"123";
    _pointFiled.keyboardType = UIKeyboardTypeNumberPad;
    _pointFiled.layer.borderColor = [[UIColor blackColor] CGColor];
    _pointFiled.layer.borderWidth = 1;
    [mainView addSubview:_pointFiled];
    [_pointFiled release];
    
    UIButton *checkButton = [UIButton buttonWithType:UIButtonTypeSystem];
    checkButton.frame = CGRectMake(20, 130, 280, 20);
    [checkButton setTitle:@"检查积分" forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(checkSocre) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:checkButton];
    
    UILabel *statusTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, 120, 20)];
    statusTitleLabel.text = @"积分墙状态：";
    statusTitleLabel.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:statusTitleLabel];
    [statusTitleLabel release];
    
    _statusLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 160, 120, 20)];
    [mainView addSubview:_statusLabel];
    [_statusLabel release];
    
    UILabel *pointTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, 120, 20)];
    pointTitleLabel.text = @"总积分：";
    pointTitleLabel.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:pointTitleLabel];
    [pointTitleLabel release];
    
    _pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 190, 120, 20)];
    [mainView addSubview:_pointLabel];
    [_pointLabel release];
    
    UILabel *consumeTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 120, 20)];
    consumeTitleLabel.text = @"总消费积分：";
    consumeTitleLabel.textAlignment = NSTextAlignmentRight;
    [mainView addSubview:consumeTitleLabel];
    [consumeTitleLabel release];
    
    _consumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(135, 220, 120, 20)];
    [mainView addSubview:_consumeLabel];
    [_consumeLabel release];
    
    UIButton *checkStatusButton = [UIButton buttonWithType:UIButtonTypeSystem];
    checkStatusButton.frame = CGRectMake(20, 250, 280, 20);
    [checkStatusButton setTitle:@"检查积分墙可用状态" forState:UIControlStateNormal];
    [checkStatusButton addTarget:self action:@selector(checkStatus) forControlEvents:UIControlEventTouchUpInside];
    [mainView addSubview:checkStatusButton];
    
    NSLog(@"Start to init DMOfferWallManager");
    _manager = [[DMOfferWallManager alloc] initWithPublisherID:@"96ZJ39xwzegKfwTA/L"
                                                     andUserID:nil];
    _manager.delegate = self;
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

- (void)consume {
    
    NSString *point = [_pointFiled text];
    
    [_manager consumeWithPointNumber:point.length>0?[point integerValue]:0];
}

- (void)checkSocre {
    
    [_manager checkOwnedPoint];
}

- (void)checkStatus {
    
    [_manager checkOfferWallEnableState];
}

- (void)hideKeyBoard {
    
    [_pointFiled resignFirstResponder];
}

#pragma mark - Manager Delegate

// 积分查询成功之后，回调该接口，获取总积分和总已消费积分。
- (void)dmOfferWallManager:(DMOfferWallManager *)manager
        receivedTotalPoint:(NSNumber *)totalPoint
        totalConsumedPoint:(NSNumber *)consumedPoint {
    
    _pointLabel.text = [NSString stringWithFormat:@"%d", [totalPoint integerValue]];
    _consumeLabel.text = [NSString stringWithFormat:@"%d", [consumedPoint integerValue]];
}

// 积分查询失败之后，回调该接口，返回查询失败的错误原因。
- (void)dmOfferWallManager:(DMOfferWallManager *)manager
      failedCheckWithError:(NSError *)error {
    NSLog(@"<demo>dmOfferWallManager:failedCheckWithError:%@", error);

}

// 消费请求正常应答后，回调该接口，并返回消费状态（成功或余额不足），以及总积分和总已消费积分。
- (void)dmOfferWallManager:(DMOfferWallManager *)manager
    consumedWithStatusCode:(DMOfferWallConsumeStatus)statusCode
                totalPoint:(NSNumber *)totalPoint
        totalConsumedPoint:(NSNumber *)consumedPoint {
    
    switch (statusCode) {
        case eDMOfferWallConsumeSuccess:
            [self.view makeToast:@"消费成功！"];
            break;
        case eDMOfferWallConsumeInsufficient:
            [self.view makeToast:@"消费失败，余额不足！"];
            break;
        case eDMOfferWallConsumeDuplicateOrder:
            [self.view makeToast:@"订单重复！"];
            break;
        default:
            break;
    }
    
    _pointLabel.text = [NSString stringWithFormat:@"%d", [totalPoint integerValue]];
    _consumeLabel.text = [NSString stringWithFormat:@"%d", [consumedPoint integerValue]];
}

//  消费请求异常应答后，回调该接口，并返回异常的错误原因。
- (void)dmOfferWallManager:(DMOfferWallManager *)manager
    failedConsumeWithError:(NSError *)error {
    
    NSLog(@"<demo>dmOfferWallManager:failedConsumeWithError:%@", error);
}

//  积分墙是否可用。
- (void)dmOfferWallManager:(DMOfferWallManager *)manager
      didCheckEnableStatus:(BOOL)enable {
    
    _statusLabel.text = enable?@"可用":@"不可用";
}

@end
