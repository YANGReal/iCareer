//
//  NBAppDelegate.m
//  iCareer
//
//  Created by andy on 14-2-27.
//  Copyright (c) 2014年 LJLD Tech. All rights reserved.
//

#import "NBAppDelegate.h"
#import "NBLeftMenuViewController.h"
@implementation NBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
    self.dynamicsDrawerViewController = [[MSDynamicsDrawerViewController alloc] init];
    [self.dynamicsDrawerViewController addStylersFromArray:@[[MSDynamicsDrawerScaleStyler styler], [MSDynamicsDrawerFadeStyler styler]] forDirection:MSDynamicsDrawerDirectionLeft];
    
    NBLeftMenuViewController *leftVC = [[NBLeftMenuViewController alloc] initWithNibName:@"NBLeftMenuViewController" bundle:nil];
    leftVC.dynamicsDrawerViewController = self.dynamicsDrawerViewController;
    [self.dynamicsDrawerViewController setDrawerViewController:leftVC forDirection:MSDynamicsDrawerDirectionLeft];
      
    [leftVC transitionToViewController:MainViewController];
    
    if ([[UINavigationBar appearance] respondsToSelector:@selector(setBarTintColor:)])
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.dynamicsDrawerViewController;
    
    [self.window makeKeyAndVisible];
    [AppUtility isNetworkAvaliable];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [AppUtility isNetworkAvaliable];
   
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
