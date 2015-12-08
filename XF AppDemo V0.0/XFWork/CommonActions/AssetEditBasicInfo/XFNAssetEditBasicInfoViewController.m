//
//  XFNAssetEditBasicInfoViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNAssetEditBasicInfoViewController.h"
#import "XFNAssetEditBasicInfoView.h"

@implementation XFNAssetEditBasicInfoViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XFNAssetEditBasicInfoView * view = [[XFNAssetEditBasicInfoView alloc] initWithFrame: CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenHeight)];
    
    view.delegate = self;
    
    [view setModel: _detailModel];
    
    [view layoutViews];
    
    self.view = view;
}


@end
