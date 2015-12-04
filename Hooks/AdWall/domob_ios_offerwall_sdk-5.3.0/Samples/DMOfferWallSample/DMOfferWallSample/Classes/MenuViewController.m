//
//  MenuViewController.m
//  DMOfferWallSample
//
//  Created by domob.
//  Copyright (c) 2014年 domob. All rights reserved.
//

#import "MenuViewController.h"
#import "ListWallViewController.h"
#import "VideoWallViewController.h"
#import "InterstitialWallViewController.h"
#import "PointManageViewController.h"
#import "DMOfferWallManager.h"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_6_0
#import <AdSupport/AdSupport.h>
#endif

@implementation MenuViewController

#pragma mark - alloc/init
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setTitle:@"HOME"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.backgroundView = nil;
    [self.view addSubview:tableView];
    [tableView release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    [super dealloc];
}
#pragma mark - UIResponder


#pragma mark - tableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString * identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"进入列表积分墙";
            break;
        case 1:
            cell.textLabel.text = @"进入视频积分墙";
            break;
        case 2:
            cell.textLabel.text = @"进入插屏积分墙";
            break;
        case 3:
            cell.textLabel.text = @"积分管理";
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *controller = nil;
    switch (indexPath.row) {
        case 0:
            controller = [[ListWallViewController alloc] init];
            break;
        case 1:
            controller = [[VideoWallViewController alloc] init];
            break;
        case 2:
            controller = [[InterstitialWallViewController alloc] init];
            break;
        case 3:
            controller = [[PointManageViewController alloc] init];
            break;
        default:
            break;
    }
    if (controller) {
        
        [self.navigationController pushViewController:controller animated:YES];
        [controller release];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        
        UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 25)];
        titleLable.textColor = [UIColor blackColor];
        titleLable.backgroundColor = [UIColor grayColor];
        titleLable.text = @"   多盟积分墙sample";
        return [titleLable autorelease];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 25;
}

@end
