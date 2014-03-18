//
//  NBRegisterViewController.m
//  iCareer
//
//  Created by andy on 14-3-12.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBRegisterViewController.h"

@interface NBRegisterViewController ()<UITextFieldDelegate, UIGestureRecognizerDelegate>

//手机注册
@property (nonatomic, weak) IBOutlet UIButton *phoneButton;
@property (nonatomic, weak) IBOutlet UIButton *mailButton;
@property (nonatomic, weak) IBOutlet UITextField *phoneCodeField;
@property (nonatomic, weak) IBOutlet UITextField *phoneVerificationField;
@property (nonatomic, weak) IBOutlet UITextField *phonePWDField;
@property (nonatomic, weak) IBOutlet UIButton *phoneVerificationButton;
@property (nonatomic, weak) IBOutlet UIButton *phoneRegisterButton;
//邮箱注册
@property (nonatomic, weak) IBOutlet UITextField *mailCodeField;
@property (nonatomic, weak) IBOutlet UITextField *mailVerificationField;
@property (nonatomic, weak) IBOutlet UITextField *mailPWDField;
@property (nonatomic, weak) IBOutlet UIButton *mailVerificationButton;
@property (nonatomic, weak) IBOutlet UIButton *mailRegisterButton;
@property (nonatomic, weak) IBOutlet UIView *mailView;

@property (nonatomic, strong) UISwipeGestureRecognizer *sGR;

- (IBAction)mailButtonClicked:(id)sender;
- (IBAction)phoneButtonClicked:(id)sender;
- (IBAction)phoneRegisterClicked:(id)sender;
- (IBAction)mailRegisterClicked:(id)sender;

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
    
    self.sGR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(viewClicked)];
    [self.sGR setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.mailView addGestureRecognizer:_sGR];
    [self.view addGestureRecognizer:_sGR];
    
    [self setupView];
    
    [self.phoneCodeField addTarget:self action:@selector(EventEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.phoneVerificationField addTarget:self action:@selector(EventEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [self.mailVerificationField addTarget:self action:@selector(EventEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

 - (void)setupView
{
    [self.phoneCodeField setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    [self.phoneVerificationField setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    [self.phonePWDField setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    [self.mailCodeField setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    [self.mailVerificationField setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    [self.mailPWDField setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    
    [self.phoneRegisterButton.layer setCornerRadius:3];
    [self.phoneVerificationButton setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
    [self.mailRegisterButton.layer setCornerRadius:3];
    [self.mailVerificationButton setupBorder:[UIColor colorWithHexString:@"#b1bad3"] cornerRadius:3];
}

#pragma mark *****ButtonClicked*****

- (void)viewClicked
{
    [self.view endEditing:YES];
    [self.mailView endEditing:YES];
    if (self.view.frame.origin.y < 0) {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.y = 0;
        }];
    }
}
- (IBAction)phoneButtonClicked:(id)sender
{
    [self.mailView setHidden:YES];
}

- (IBAction)mailButtonClicked:(id)sender
{
    [self.mailView setHidden:NO];
}

- (IBAction)phoneRegisterClicked:(id)sender
{
    DLog(@"phoneRegister");
    [self viewClicked];
}

- (IBAction)mailRegisterClicked:(id)sender
{
    DLog(@"mailRegister");
    [self viewClicked];
}

#pragma mark *****UITextFieldDelegate*****

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
//    DLog(@"y = %f", self.view.y);
    DLog(@"state = %ld", _sGR.state);
    if (_sGR.state == 0) {
        DLog(@"yes");
        return YES;
    }
    
    if (textField != _phoneCodeField && textField != _mailCodeField && self.view.y > -1) {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.y = -80;
//            self.view.height = self.view.height + 100;
        }];
    }
    if ((textField == _phoneCodeField || textField == _mailCodeField) && self.view.frame.origin.y < 0)
    {
        [UIView animateWithDuration:0.2 animations:^{
            self.view.y = 0;
        }];
    }
//    DLog(@"y1 = %f", self.view.y);
    return YES;
}

- (void)EventEditingChanged:(UITextField *)sender
{
    UITextRange *markRange = sender.markedTextRange;
    NSInteger pos = [sender offsetFromPosition:markRange.start
                              toPosition:markRange.end];
    NSInteger nLength = sender.text.length;
    
//    switch (nLength) {
//        case 3:
//            sender.text = [sender.text stringByAppendingString:@"-"];
//            break;
//        case 8:
//            sender.text = [sender.text stringByAppendingString:@"-"];
//            break;
//    }
    if (sender.tag == 1001) {
        if (nLength > 11 && pos == 0) {
        sender.text = [sender.text substringToIndex:11];
    }
    }
    else
    {
        if (nLength > 4 && pos == 0) {
            sender.text = [sender.text substringToIndex:4];
        }
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
//    DLog(@"begin!");
//    if (self.view.frame.origin.y < -1) {
//        self.view.y = 0;
//        [self.view endEditing:YES];
//        [self.mailView endEditing:YES];
//    }
//    [self viewClicked];
//    self.view. y = 0;
    
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
