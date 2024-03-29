//
//  XFNAssetEditTradeInfoViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNAssetEditTradeInfoViewController.h"
#import "XFNAssetEditTradeInfoView.h"

@implementation XFNAssetEditTradeInfoViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XFNAssetEditTradeInfoView * view = [[XFNAssetEditTradeInfoView alloc] initWithFrame: CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenHeight)];
    
    view.editDelegate = self;
    
    [view setModel: self.detailModel];
    
    [view layoutViews];
    
    self.view = view;
}


@end

