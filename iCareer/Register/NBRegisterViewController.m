//
//  NBRegisterViewController.m
//  iCareer
//
//  Created by andy on 14-3-12.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBRegisterViewController.h"

@interface NBRegisterViewController ()
{
    UIView *aView;
}
@property (nonatomic, weak) IBOutlet UITextField *accountField;
@property (nonatomic, weak) IBOutlet UITextField *verificationField;
@property (nonatomic, weak) IBOutlet UITextField *passwordField;
@property (nonatomic, weak) IBOutlet UIButton *phoneButton;
@property (nonatomic, weak) IBOutlet UIButton *mailButton;
@property (nonatomic, weak) IBOutlet UIButton *verificationButton;
@property (nonatomic, weak) IBOutlet UIButton *registerButton;
@property (nonatomic, weak) IBOutlet UIView *mailView;

- (IBAction)mailButtonClicked:(id)sender;
- (IBAction)phoneButtonClicked:(id)sender;

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
    [self.view addSubview:_mailView];
    [self.mailView setHidden:YES];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    [self.mailView addGestureRecognizer:tapGR];
    [self.view addGestureRecognizer:tapGR];
}

#pragma mark *****ButtonClicked*****

- (void)viewClicked
{
    [self.view endEditing:YES];
    [self.mailView endEditing:YES];
}
- (IBAction)phoneButtonClicked:(id)sender
{
    [self.mailView setHidden:YES];
}

- (IBAction)mailButtonClicked:(id)sender
{
    [self.mailView setHidden:NO];
}

#pragma mark *****UITextFieldDelegate*****

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
