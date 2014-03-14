//
//  NBLeftMenuViewController.h
//  iCareer
//
//  Created by YANGRui on 14-3-12.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBBaseViewController.h"



typedef NS_ENUM(NSUInteger, MSPaneViewControllerType) {
    MainViewController,
    MSPaneViewControllerTypeDynamics,
    MSPaneViewControllerTypeBounce,
    MSPaneViewControllerTypeGestures,
    MSPaneViewControllerTypeControls,
    MSPaneViewControllerTypeMap,
    MSPaneViewControllerTypeLongTable,
    MSPaneViewControllerTypeMonospace,
    MSPaneViewControllerTypeCount
};


@interface NBLeftMenuViewController : NBBaseViewController
@property (nonatomic, weak) MSDynamicsDrawerViewController *dynamicsDrawerViewController;
@property (nonatomic, assign) MSPaneViewControllerType paneViewControllerType;


- (void)transitionToViewController:(MSPaneViewControllerType)paneViewControllerType;


@end
