//
//  XFFrameTabBarController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/10/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFFrameTabBarController.h"
#import "XFFrameNavigationController.h"
#import "XFWorkTableViewController.h"

@implementation XFFrameTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self  setupChildControllers];
}

- (void)setupChildControllers
{
    [self setupChildNavigationControllerWithClass : [XFFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Message"
                          rootViewControllerClass : [UITableViewController class]
                          rootViewControllerTitle : @"消息"];
    
    [self setupChildNavigationControllerWithClass : [XFFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Work"
                          rootViewControllerClass : [XFWorkTableViewController class]
                          rootViewControllerTitle : @"工作"];
    
    [self setupChildNavigationControllerWithClass : [XFFrameNavigationController class]
                                  tabBarImageName : @"TabBar_Public"
                          rootViewControllerClass : [UITableViewController class]
                          rootViewControllerTitle : @"公盘"];
    
    [self setupChildNavigationControllerWithClass : [XFFrameNavigationController class]
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
    XFFrameNavigationController *navVc  = [[class alloc] initWithRootViewController : rootVC];
    navVc.tabBarItem.image         = [UIImage imageNamed : name];
    navVc.tabBarItem.selectedImage = [UIImage imageNamed : [NSString stringWithFormat : @"%@_Sel", name]];
    [self addChildViewController : navVc];
}

@end









