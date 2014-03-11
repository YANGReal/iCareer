//
//  NBLoginViewController.m
//  iCareer
//
//  Created by YANGRui on 14-3-11.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBLoginViewController.h"

@interface NBLoginViewController ()<UITextFieldDelegate,UIActionSheetDelegate>


@property (weak , nonatomic) IBOutlet UITextField *userField;
@property (weak , nonatomic) IBOutlet UITextField *passwordField;
@property (weak , nonatomic) IBOutlet UIImageView *checkBox;

- (IBAction)loginBtnClicked:(id)sender;

- (IBAction)checkBtnClicked:(id)sender;

- (IBAction)forgetBtnClicked:(id)sender;

- (IBAction)registerBtnClciked:(id)sender;

@end

@implementation NBLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [self setupViews];
}


- (void)setupViews
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    BOOL remember = [[NSUserDefaults standardUserDefaults] boolForKey:REMEMBER_PASS_WORD];
    if (remember)
    {
        self.checkBox.hidden = NO;
    }
    else
    {
        self.checkBox.hidden = YES;
    }
}

- (void)dismissKeyboard
{
    [self.userField resignFirstResponder];
     [self.passwordField resignFirstResponder];
}

#pragma mark - IBAction method

- (IBAction)loginBtnClicked:(id)sender
{
    
}

- (IBAction)checkBtnClicked:(id)sender
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([userDefaults boolForKey:REMEMBER_PASS_WORD])
    {
        [userDefaults setBool:NO forKey:REMEMBER_PASS_WORD];
        self.checkBox.hidden = YES;
    }
    else
    {
         [userDefaults setBool:YES forKey:REMEMBER_PASS_WORD];
        self.checkBox.hidden = NO;

    }
    [userDefaults synchronize];


}

- (IBAction)forgetBtnClicked:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"请选择一种重置密码的方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:Nil otherButtonTitles:@"使用手机号码重置密码",@"使用E-mail重置密码", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)registerBtnClciked:(id)sender
{
    
}


- (BOOL)checkInput
{
    if (self.userField.text.length == 0)
    {
        return NO;
    }
    if (self.passwordField.text.length ==0)
    {
        return NO;
    }
    return YES;
}

#pragma mark - UITextField delegate method
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userField)
    {
        [self.passwordField becomeFirstResponder];
    }
    else
    {
        if ([self checkInput])
        {
            
        }
    }
    return YES;
}

#pragma mark - Memory Manage

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
