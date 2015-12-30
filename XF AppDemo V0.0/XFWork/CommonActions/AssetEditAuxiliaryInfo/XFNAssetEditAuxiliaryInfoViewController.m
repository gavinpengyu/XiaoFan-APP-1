//
//  XFNAssetEditAuxiliaryInfoViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNAssetEditAuxiliaryInfoViewController.h"
#import "XFNAssetEditAuxiliaryInfoView.h"

@implementation XFNAssetEditAuxiliaryInfoViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XFNAssetEditAuxiliaryInfoView * view = [[XFNAssetEditAuxiliaryInfoView alloc] initWithFrame: CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenHeight)];
    
    view.editDelegate = self;
    
    [view setModel: self.detailModel];
    
    [view layoutViews];
    
    self.view = view;
}


@end