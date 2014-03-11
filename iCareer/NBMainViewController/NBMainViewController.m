//
//  NBMainViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBMainViewController.h"

@interface NBMainViewController ()<UIGestureRecognizerDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet DBTileButton *chanceButton;//机会
@property (weak, nonatomic) IBOutlet DBTileButton *messageButton;//消息
@property (weak, nonatomic) IBOutlet DBTileButton *resumeButton;//简历
@property (weak, nonatomic) IBOutlet DBTileButton *recommendButton;//推荐
@property (weak, nonatomic) IBOutlet DBTileButton *evaluatingButton;//评测
@property (weak, nonatomic) IBOutlet DBTileButton *circleButton;//圈子
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

- (IBAction)closeKeboard:(id)sender;
- (IBAction)searchButtonClicked:(UIButton *)sender;

@end

@implementation NBMainViewController

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
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    [self setupUIBarButtonItem];
    [self setupUISearchBar];
    
    
}

- (void)setupUIBarButtonItem
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(0, 0, 100, 20)];
    [titleLabel setText:@"手机双选会"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
    [self.navigationItem setTitleView:titleLabel];

    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitle:@"重庆" forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"#f5544b"] forState:UIControlStateNormal];
    [leftButton setFrame:RECT(0, 0, 40, 20)];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 0, 0, 0)];
    [leftButton addTarget:self action:@selector(leftBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftItem];
//    [self.navigationItem.leftBarButtonItem setTitlePositionAdjustment:UIOffsetMake(0, 10) forBarMetrics:UIBarMetricsDefault];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setTitle:@"登录" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor colorWithHexString:@"#f5544b"] forState:UIControlStateNormal];
    [rightButton setFrame:RECT(0, 0, 40, 20)];
    [rightButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 0, 0, 0)];
    [rightButton addTarget:self action:@selector(rightBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)setupUISearchBar
{
    [self.searchBar setSearchFieldBackgroundImage:[UIImage  createImageWithColor:[UIColor clearColor] andImageHeight:20.0f] forState:UIControlStateNormal];
    [self.searchBar setBackgroundColor:[UIColor colorWithHexString:@"#c74842" alpha:1]];
    [self.searchBar setImage:[UIImage  createImageWithColor:[UIColor clearColor] andImageHeight:1.0f] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [self.searchBar setSearchFieldBackgroundPositionAdjustment:UIOffsetMake(-10, 2)];
    [self.searchBar setPlaceholder:@"请输入职位名称,如：IT"];

    //改变文本颜色
    UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor whiteColor];
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
}

#pragma mark -----各个button相应方法-----

- (IBAction)closeKeboard:(id)sender
{
    [self.searchBar resignFirstResponder];
}

- (IBAction)searchButtonClicked:(UIButton *)sender
{
    if (_searchBar.text.length == 0) {
        return;
    }
    else
    {
        DLog(@"searchText = %@", _searchBar.text);
        self.searchBar.text = nil;
    }
}

#pragma mark -----UIBarButtonItemAction-----
- (void)leftBarButtonItemClicked
{
    DLog(@"this is leftItem!");
}

- (void)rightBarButtonItemClicked
{
    DLog(@"this is rightItem!");
    NBLoginViewController *loginVC = [[NBLoginViewController alloc] initWithNibName:[AppUtility getNibNameFromViewController:@"NBLoginViewController"] bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}

#pragma mark -----UISearchBarDelegate-----

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    DLog(@"searchText = %@", searchBar.text);
    searchBar.text = nil;
    [self closeKeboard:nil];
}


#pragma mark -----UIGestureRecognizerDelegate-----
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (self.navigationController.viewControllers.count == 1)
    {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
