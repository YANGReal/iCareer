//
//  NBLeftMenuViewController.m
//  iCareer
//
//  Created by YANGRui on 14-3-12.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBLeftMenuViewController.h"
#import "NBMainViewController.h"
@interface NBLeftMenuViewController ()

@property (strong, nonatomic) NSDictionary *viewControllers;

@end

@implementation NBLeftMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self initialize];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}


- (void)initialize
{
    self.paneViewControllerType = NSIntegerMax;
    self.viewControllers = @{@(MSPaneViewControllerTypeStylers) : [NBMainViewController class]};

}


- (void)transitionToViewController:(MSPaneViewControllerType)paneViewControllerType
{
    if (paneViewControllerType == self.paneViewControllerType) {
        [self.dynamicsDrawerViewController setPaneState:MSDynamicsDrawerPaneStateClosed animated:YES allowUserInterruption:YES completion:nil];
        return;
    }
    BOOL animateTransition = self.dynamicsDrawerViewController.paneViewController != nil;
    Class paneViewControllerClass = self.viewControllers[@(paneViewControllerType)];
    UIViewController *paneViewController = [(UIViewController *)[paneViewControllerClass alloc] initWithNibName:[AppUtility getNibNameFromViewController:NSStringFromClass(paneViewControllerClass)] bundle:nil];
    NBNavigationController *paneNavigationViewController = [[NBNavigationController alloc] initWithRootViewController:paneViewController];
    [self.dynamicsDrawerViewController setPaneViewController:paneNavigationViewController animated:animateTransition completion:nil];
    self.paneViewControllerType = paneViewControllerType;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
