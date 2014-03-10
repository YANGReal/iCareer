//
//  NBMainViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBMainViewController.h"

@interface NBMainViewController ()

@property (weak, nonatomic) IBOutlet DBTileButton *chanceButton;//机会
@property (weak , nonatomic) IBOutlet DBTileButton *messageButton;//消息
@property (weak , nonatomic) IBOutlet DBTileButton *resumeButton;//简历
@property (weak , nonatomic) IBOutlet DBTileButton *recommendButton;//推荐
@property (weak , nonatomic) IBOutlet DBTileButton *evaluatingButton;//评测
@property (weak , nonatomic) IBOutlet DBTileButton *circleButton;//圈子

@end

@implementation NBMainViewController

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
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    [self setupUIBarButtonItem];
}

- (void)setupUIBarButtonItem
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(0, 0, 100, 20)];
    [titleLabel setText:@"手机双选会"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:20]];
    [self.navigationItem setTitleView:titleLabel];

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"重庆" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"#f5544b"] forState:UIControlStateNormal];
    [leftButton setFrame:RECT(0, 0, 40, 20)];
    [leftButton addTarget:self action:@selector(leftBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"登录" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithHexString:@"#f5544b"] forState:UIControlStateNormal];
    [rightButton setFrame:RECT(0, 0, 40, 20)];
    [rightButton addTarget:self action:@selector(rightBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

#pragma mark -----UIBarButtonItemAction-----
- (void)leftBarButtonItemClicked
{
    DLog(@"this is leftItem!");
}

- (void)rightBarButtonItemClicked
{
    DLog(@"this is rightItem!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
