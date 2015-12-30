//
//  XFNAssetCommentViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNAssetCommentViewController.h"
#import "XFNAssetCommentView.h"

////-------------------------------Action .h Begin-------------------------------
#import "XFNAssetEditBasicInfoViewController.h"
#import "XFNAssetEditTradeInfoViewController.h"
#import "XFNAssetEditAuxiliaryInfoViewController.h"
#import "XFNAssetEditContactInfoViewController.h"
#import "XFNAssetCommentViewController.h"
////-------------------------------Action .h End---------------------------------

@implementation XFNAssetCommentViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XFNAssetCommentView * view = [[XFNAssetCommentView alloc] initWithFrame: CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenHeight)];
    
    view.editDelegate = self; //点击“提交”返回前一个页面
    
    view.delegate = self; //点击修改入口，进入edit view
    
    [view setModel: self.detailModel];
    
    [view layoutViews];
    
    self.view = view;
}

#pragma mark Protocol Cell and Footer - > CommonItemDetail
//-----------------------------------------------------------------------------------------
- (void)toPushViewForEditBasicInfo
{
    XFNAssetEditBasicInfoViewController *vc = [[XFNAssetEditBasicInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151215 从跟进页面进入的编辑页面，不涉及页面数据回传，因此不需要设置delegate
    
    vc.detailModel = self.detailModel;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForEditTradeInfo
{
    XFNAssetEditTradeInfoViewController *vc = [[XFNAssetEditTradeInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151215 从跟进页面进入的编辑页面，不涉及页面数据回传，因此不需要设置delegate
    
    vc.detailModel = self.detailModel;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForEditAuxiliaryInfo
{
    XFNAssetEditAuxiliaryInfoViewController *vc = [[XFNAssetEditAuxiliaryInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151215 从跟进页面进入的编辑页面，不涉及页面数据回传，因此不需要设置delegate
    
    vc.detailModel = self.detailModel;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForEditContactInfo
{
    XFNAssetEditContactInfoViewController *vc = [[XFNAssetEditContactInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151215 从跟进页面进入的编辑页面，不涉及页面数据回传，因此不需要设置delegate
    
    vc.detailModel = self.detailModel;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForComment
{
    XFNAssetCommentViewController *vc = [[XFNAssetCommentViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151215 从跟进页面进入的编辑页面，不涉及页面数据回传，因此不需要设置delegate
    
    vc.detailModel = self.detailModel;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end