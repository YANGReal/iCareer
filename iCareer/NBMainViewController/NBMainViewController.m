//
//  NBMainViewController.m
//  iCareer
//
//  Created by YANGRui on 14-2-27.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBMainViewController.h"
#import "NBCityViewController.h"
@interface NBMainViewController ()<UIGestureRecognizerDelegate, UISearchBarDelegate>
{
    IBOutlet UIImageView *changeImage;
    IBOutlet UIImageView *jobImage;
    IBOutlet UIImageView *searchImage;
    IBOutlet UIImageView *recommendImage;
    IBOutlet UIImageView *evaluatingImage;
    IBOutlet UIImageView *resumeImage;
    IBOutlet UIImageView *messageImage;
    IBOutlet UIImageView *circleImage;
}

@property (weak, nonatomic) IBOutlet DBTileButton *chanceButton;//机会
@property (weak, nonatomic) IBOutlet DBTileButton *messageButton;//消息
@property (weak, nonatomic) IBOutlet DBTileButton *resumeButton;//简历
@property (weak, nonatomic) IBOutlet DBTileButton *recommendButton;//推荐
@property (weak, nonatomic) IBOutlet DBTileButton *evaluatingButton;//评测
@property (weak, nonatomic) IBOutlet DBTileButton *circleButton;//圈子
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
//@property (strong , nonatomic) UIActivityIndicatorView *indicatorView;
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
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
    
    [self setupUIBarButtonItem];
    [self setupButton];
    [self setupUISearchBar];
    
    [self.chanceButton addTarget:self action:@selector(closeKeboard:) forControlEvents:UIControlEventTouchUpOutside];
    
    /*
    ETActivityIndicatorView *indicator = [[ETActivityIndicatorView alloc] initWithFrame:RECT(0, 0, 60, 60) andColor:WHITE_COLOR];
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator startAnimating];
     */
//    [self.navigationController.view startFlip];
}

- (void)setupUIBarButtonItem
{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:RECT(0, 0, 100, 20)];
    [titleLabel setText:@"手机双选会"];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:22]];
    [self.navigationItem setTitleView:titleLabel];

    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.color = [UIColor colorWithHexString:@"#f5544b"];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setTitleColor:[UIColor colorWithHexString:@"#f5544b"] forState:UIControlStateNormal];
    [leftButton setFrame:RECT(0, 0, 60, 20)];
    [leftButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 0, 0, 0)];
    [leftButton addTarget:self action:@selector(leftBarButtonItemClicked) forControlEvents:UIControlEventTouchUpInside];
    [leftButton addSubview:indicatorView];
    [indicatorView startAnimating];
    
    [[MMLocationManager shareLocation] getCity:^(NSString *addressString) {
        
        [leftButton setTitle:addressString forState:UIControlStateNormal];
       // DLog(@"address = %@",addressString);
        [indicatorView stopAnimating];
        indicatorView.hidden = YES;
        [indicatorView removeFromSuperview];
        
    } error:^(NSError *error) {
        
        [leftButton setTitle:@"未知" forState:UIControlStateNormal];
        [indicatorView stopAnimating];
        indicatorView.hidden = YES;
        [indicatorView removeFromSuperview];

    }];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [self.navigationItem setLeftBarButtonItem:leftItem];
    
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
    [self.searchBar setBackgroundColor:[UIColor whiteColor]];
    [self.searchBar.layer setCornerRadius:5];
    [self.searchBar setImage:[UIImage  createImageWithColor:[UIColor clearColor] andImageHeight:1.0f] forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    [self.searchBar setSearchFieldBackgroundPositionAdjustment:UIOffsetMake(-10, 2)];
    [self.searchBar setPlaceholder:@"请输入职位名称,如：IT"];

    //改变文本颜色
    UITextField *searchField = [_searchBar valueForKey:@"_searchField"];
    searchField.textColor = [UIColor whiteColor];
    [searchField setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    
    [self.searchBar addSubview:_searchButton];
//    [self.chanceButton addSubview:_searchBar];
    
}

- (void)setupButton
{
    changeImage.x = 40;
    changeImage.y = 80;
    [self.chanceButton addSubview:changeImage];
    
    jobImage.x = 120;
    jobImage.y = 175;
    [self.chanceButton addSubview:jobImage];
    
    messageImage.x = 15;
    messageImage.y = 15;
    [self.messageButton addSubview:messageImage];
    
    resumeImage.x = 15;
    resumeImage.y = 15;
    [self.resumeButton addSubview:resumeImage];
    
    evaluatingImage.x = 15;
    evaluatingImage.y = 15;
    [self.evaluatingButton addSubview:evaluatingImage];
    
    recommendImage.x = 15;
    recommendImage.y = 15;
    [self.recommendButton addSubview:recommendImage];
    
    circleImage.x = 50;
    circleImage.y = 25;
    [self.circleButton addSubview:circleImage];
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
    NBCityViewController *cityVC = [[NBCityViewController alloc] initWithNibName:[AppUtility getNibNameFromViewController:@"NBCityViewController"] bundle:nil];
    cityVC.currentCity = @"重庆市";
    [self.navigationController pushViewController:cityVC animated:YES];
}

- (void)rightBarButtonItemClicked
{
   
//    NSString *url = @"http://192.168.0.144:8080/MobileChance/login";
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"helindong",@"username",@0"helindong",@"password", nil];
//    DLog(@"params = %@",params);
//    [NBNetworkEngine loadDataWithURL:url params:params completeHander:^(id jsonObject, BOOL success) {
//        
//        NSDictionary *data  = (NSDictionary *)jsonObject;
//        NSDictionary *user = [data objectForKey:@"user"];
//        DLog(@"name = %@",[user stringAttribute:@"fullName"]);
//    }];
//    
//    return;
    NBLoginViewController *loginVC = [[NBLoginViewController alloc] initWithNibName:[AppUtility getNibNameFromViewController:@"NBLoginViewController"] bundle:nil];
    [self.navigationController pushViewController:loginVC animated:YES];
}

#pragma mark -----UISearchBarDelegate-----

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    DLog(@"searchText = %@", searchBar.text);
    searchBar.text = @"";
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
