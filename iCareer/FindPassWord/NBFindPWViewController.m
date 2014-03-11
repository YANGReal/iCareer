//
//  NBFindPWViewController.m
//  iCareer
//
//  Created by YANGRui on 14-3-11.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBFindPWViewController.h"

@interface NBFindPWViewController ()

@property (weak , nonatomic) IBOutlet UITextField *textField1;
@property (weak , nonatomic) IBOutlet UITextField *textField2;

@end

@implementation NBFindPWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"找回密码";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupViews];
    // Do any additional setup after loading the view from its nib.
}


- (void)setupViews
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard
{
    [self.textField1 resignFirstResponder];
    [self.textField2 resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
