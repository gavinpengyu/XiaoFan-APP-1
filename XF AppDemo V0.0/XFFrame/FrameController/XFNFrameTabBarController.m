//
//  XFNFrameTabBarController.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrameTabBarController.h"
#import "XFNFrameNavigationController.h"
#import "XFNWorkTableViewController.h"

@implementation XFNFrameTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self  setupChildControllers];
}

- (void)setupChildControllers
{
    [self setupChildNavigationControllerWithClass : [XFNFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Message"
                          rootViewControllerClass : [UITableViewController class]
                          rootViewControllerTitle : @"消息"];
    
    [self setupChildNavigationControllerWithClass : [XFNFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Work"
                          rootViewControllerClass : [XFNWorkTableViewController class]
                          rootViewControllerTitle : @"工作"];
    
    [self setupChildNavigationControllerWithClass : [XFNFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Public"
                          rootViewControllerClass : [UITableViewController class]
                          rootViewControllerTitle : @"公盘"];
    
    [self setupChildNavigationControllerWithClass : [XFNFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Me"
                          rootViewControllerClass : [UITableViewController class]
                          rootViewControllerTitle : @"我"];
}

- (void)setupChildNavigationControllerWithClass : (Class) class
                                tabBarImageName : (NSString *) name
                        rootViewControllerClass : (Class) rootViewControllerClass
                        rootViewControllerTitle : (NSString *) title
{
    UIViewController *rootVC       = [[rootViewControllerClass alloc] init];
    rootVC.title                   = title;
    //UINavigationController *navVc  = [[class alloc] initWithRootViewController : rootVC];
    XFNFrameNavigationController *navVc  = [[class alloc] initWithRootViewController : rootVC];
    navVc.tabBarItem.image         = [UIImage imageNamed : name];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed : [NSString stringWithFormat : @"%@_Sel", name]];
    [self addChildViewController : navVc];
}

@end









