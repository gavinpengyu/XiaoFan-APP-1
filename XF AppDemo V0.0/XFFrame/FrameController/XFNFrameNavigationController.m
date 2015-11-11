//
//  XFNFrameNavigationController.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrameNavigationController.h"

@implementation XFNFrameNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes : @{NSForegroundColorAttributeName : [UIColor blueColor]}];
}

/*- (void)pushViewController : (UIViewController *) viewController
                  animated : (BOOL) animated
{
    [viewController.navigationItem.backBarButtonItem
                              setTitleTextAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : 10]}
                                            forState : UIControlStateNormal];
    
    if (self.childViewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController : viewController animated : YES];
}*/

@end
