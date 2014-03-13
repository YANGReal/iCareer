//
//  NBCityViewController.m
//  iCareer
//
//  Created by YANGRui on 14-3-13.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBCityViewController.h"

@interface NBCityViewController ()<UITableViewDataSource,UITableViewDelegate>
{
   
}

@property (weak , nonatomic) IBOutlet UITableView *cityTableView;
@property (nonatomic, strong) NSMutableDictionary *cities;
@property (nonatomic, strong) NSMutableArray *keys; //城市首字母
@property (nonatomic, strong) NSMutableArray *arrayCitys;   //城市数据
@property (nonatomic, strong) NSMutableArray *arrayHotCity;//热门城市
@property (nonatomic ,strong) NSArray *currentCityArr;//当前城市


@end

@implementation NBCityViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"选择城市";
        self.arrayHotCity = [NSMutableArray arrayWithObjects:@"北京市",@"广州市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"成都市", nil];
        self.keys = [NSMutableArray array];
        self.arrayCitys = [NSMutableArray array];
       DLog(@"%f" ,[UIScreen mainScreen].scale);

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityTableView.sectionIndexColor = RED_COLOR;
    self.cityTableView.sectionIndexTrackingBackgroundColor = CLEAR_COLOR;
    if ([self.cityTableView respondsToSelector:@selector(setSectionIndexBackgroundColor:)])
    {
        self.cityTableView.sectionIndexBackgroundColor = CLEAR_COLOR;
    }
    [self getCityData];
    // Do any additional setup after loading the view from its nib.
}


#pragma mark - 获取城市数据
-(void)getCityData
{
    NSString *path=[[NSBundle mainBundle] pathForResource:@"citydict"
                                                   ofType:@"plist"];
    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    
    [self.keys addObjectsFromArray:[[self.cities allKeys] sortedArrayUsingSelector:@selector(compare:)]];
    
    //添加热门城市,当前城市
    self.currentCityArr = @[self.currentCity];
    
    [self.keys insertObject:@"当" atIndex:0];
    [self.keys insertObject:@"热" atIndex:1];
    [self.cities setObject:_arrayHotCity forKey:@"热"];
    [self.cities setObject:_currentCityArr forKey:@"当"];
  
}

#pragma mark - UITableView delegate method
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    bgView.backgroundColor = RED_COLOR;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(13, 0, 250, 30)];
    titleLabel.backgroundColor = CLEAR_COLOR;
    titleLabel.textColor = WHITE_COLOR;
    titleLabel.font = [UIFont systemFontOfSize:14];
    
    NSString *key = [_keys objectAtIndex:section];
    if ([key rangeOfString:@"热"].location != NSNotFound) {
        titleLabel.text = @"热门城市";
    }
    else if ([key rangeOfString:@"当"].location != NSNotFound)
    {
        titleLabel.text = @"当前城市";
    }
    else
    {
         titleLabel.text = key;
    }
    
    
    [bgView addSubview:titleLabel];
    
    return bgView;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSString *key = [_keys objectAtIndex:section];
    NSArray *citySection = [_cities objectForKey:key];
    return [citySection count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    NSString *key = _keys[indexPath.section];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
        cell.backgroundColor = [UIColor clearColor];
        cell.contentView.backgroundColor = [UIColor clearColor];
        [cell.textLabel setTextColor:RED_COLOR];
        cell.textLabel.font = [UIFont systemFontOfSize:18];
    }
    cell.textLabel.text = [[_cities objectForKey:key] objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"123");
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
