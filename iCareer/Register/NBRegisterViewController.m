//
//  NBRegisterViewController.m
//  iCareer
//
//  Created by andy on 14-3-12.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBRegisterViewController.h"

@interface NBRegisterViewController ()

@end

@implementation NBRegisterViewController

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
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(0, 0, 100, 25)];
    [titleLabel setText:@"注册账号"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
    [self.navigationItem setTitleView:titleLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
