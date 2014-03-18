//
//  NBFindPWViewController.m
//  iCareer
//
//  Created by YANGRui on 14-3-11.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBFindPWViewController.h"

@interface NBFindPWViewController ()
{
    int second;
    NSTimer *timer;
}
@property (weak , nonatomic) IBOutlet UITextField *phoneField;
@property (weak , nonatomic) IBOutlet UITextField *codeField;
@property (weak , nonatomic) IBOutlet UITextField *emailField;
@property (weak , nonatomic) IBOutlet UIView *emailView;
@property (weak , nonatomic) IBOutlet UIButton *codeButton;

- (IBAction)codeButtonClicked:(id)sender;

@end

@implementation NBFindPWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"找回密码";
        second = 10;
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
    if (self.findType == emailType)
    {
        [self.view addSubview:self.emailView];
    }
}


#pragma mark - IBAction Method


- (IBAction)codeButtonClicked:(id)sender
{
    self.codeButton.enabled = NO;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                    selector:@selector(startTiming)
                                   userInfo:nil
                                    repeats:YES];
}



#pragma mark - 计时器

- (void)startTiming
{
    NSString *title = [NSString stringWithFormat:@"%d秒",second];
    [self.codeButton setTitle:title forState:UIControlStateNormal];
    
    if (second == 0)
    {
        [timer invalidate];
        [self.codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.codeButton.enabled = YES;
        second = 10;
    }
    second --;
}



#pragma mark - 隐藏键盘

- (void)dismissKeyboard
{
    [self.phoneField resignFirstResponder];
    [self.codeField resignFirstResponder];
    [self.emailField resignFirstResponder];
}

#pragma mark - viewWillDisappear

- (void)viewWillDisappear:(BOOL)animated
{
    [timer invalidate];
}

#pragma mark 内存警告

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)test:(id)sender {
}
@end
