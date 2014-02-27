//
//  NBBaseViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBBaseViewController.h"

@interface NBBaseViewController ()

@end

@implementation NBBaseViewController

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
    self.view.frame = IP5ORIP4FRAME;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
