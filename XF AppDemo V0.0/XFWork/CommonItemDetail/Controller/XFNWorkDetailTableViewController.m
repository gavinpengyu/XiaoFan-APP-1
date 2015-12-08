//
//  XFNWorkDetailTableViewController.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkDetailTableViewController.h"
#import "XFNWorkDetailTableViewCell.h"
#import "XFNWorkDetailTableViewCellModel.h"

#import "XFNWorkDetailImageViewCell.h"
#import "XFNWorkDetailBasicInfoCell.h"
#import "XFNWorkDetailTradeInfoCell.h"
#import "XFNWorkDetailAuxiliaryInfoCell.h"
#import "XFNWorkDetailContactInfoCell.h"
#import "XFNWorkDetailCommentsInfoCell.h"
#import "XFNWorkDetailTableViewFooter.h"

#import "XFNWorkTableViewHeader.h"

////-------------------------------Action .h Begin-------------------------------
#import "XFNAssetEditBasicInfoViewController.h"
#import "XFNAssetEditTradeInfoViewController.h"
#import "XFNAssetEditAuxiliaryInfoViewController.h"
#import "XFNAssetEditContactInfoViewController.h"
////-------------------------------Action .h End---------------------------------

@implementation XFNWorkDetailTableViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //加载数据
    [self initData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void) initData
{
    return;
}

#pragma mark DataSource
//-----------------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (XFNWorkDetailCommentsInfoCellIndexEnum + 1);
}

//-----------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (XFNWorkDetailImageViewCellIndexEnum == indexPath.row)
    {
        //XFNWorkDetailBasicInfoCellModel *tempCellModel = [[XFNWorkDetailBasicInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailImageViewCell *cell = [[XFNWorkDetailImageViewCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //po 20151203 在此处请求服务器数据？
        //[cell setModel : tempCellModel];
        
        return cell;
    }
    
    else if (XFNWorkDetailBasicInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailBasicInfoCellModel *tempCellModel = [[XFNWorkDetailBasicInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailBasicInfoCell *cell = [[XFNWorkDetailBasicInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.delegate = self;
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    
    else if (XFNWorkDetailTradeInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailTradeInfoCellModel *tempCellModel = [[XFNWorkDetailTradeInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailTradeInfoCell *cell = [[XFNWorkDetailTradeInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.delegate = self;
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    else if (XFNWorkDetailAuxiliaryInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailAuxiliaryInfoCellModel *tempCellModel = [[XFNWorkDetailAuxiliaryInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailAuxiliaryInfoCell *cell = [[XFNWorkDetailAuxiliaryInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.delegate = self;
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    else if (XFNWorkDetailContactInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailContactInfoCellModel *tempCellModel = [[XFNWorkDetailContactInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailContactInfoCell *cell = [[XFNWorkDetailContactInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.delegate = self;
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    else if (XFNWorkDetailCommentsInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailCommentsInfoCellModel *tempCellModel = [[XFNWorkDetailCommentsInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailCommentsInfoCell *cell = [[XFNWorkDetailCommentsInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    else
    {
        return nil;
    }
}

#pragma mark TableView Delegate
//-----------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView: tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    XFNWorkDetailTableViewFooter * footer = [[XFNWorkDetailTableViewFooter alloc] init];
    
    NSNumber* temp      = [_detailModel objectForKey : @"bIsFollowed"];
    
    footer.bIsFollowed  = temp.boolValue;
    
    footer              = [footer initWithFrame: CGRectMake(0,
                                                            0,
                                                            _Macro_ScreenWidth,
                                                            _Macro_XFNWorkTableViewFooter_Height)];
    return footer;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return _Macro_XFNWorkTableViewFooter_Height;
}

//po 20151206 detail view中，选中cell不需要高亮，因此需要实现这个delegate，否则视觉效果不好
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    return NO;
}

#pragma mark Protocol Delegate
//-----------------------------------------------------------------------------------------
- (void)toSendAssetModelwithObject : (XFNFrameAssetModel*) object
{
    _detailModel = object;
}

#pragma mark Protocol Cell - > CommonItemDetail 
//-----------------------------------------------------------------------------------------
- (void)toPushViewForEditBasicInfo
{
    XFNAssetEditBasicInfoViewController *vc = [[XFNAssetEditBasicInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    self.delegate = vc;   //object: detail view -> edit view;
    
    vc.delegate   = self; //object: edit view -> detail view;
    
    [self.delegate toSendAssetModelwithObject: _detailModel];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForEditTradeInfo
{
    XFNAssetEditTradeInfoViewController *vc = [[XFNAssetEditTradeInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    self.delegate = vc;   //object: detail view -> edit view;
    
    vc.delegate   = self; //object: edit view -> detail view;
    
    [self.delegate toSendAssetModelwithObject: _detailModel];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForEditAuxiliaryInfo
{
    XFNAssetEditAuxiliaryInfoViewController *vc = [[XFNAssetEditAuxiliaryInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    self.delegate = vc;   //object: detail view -> edit view;
    
    vc.delegate   = self; //object: edit view -> detail view;
    
    [self.delegate toSendAssetModelwithObject: _detailModel];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toPushViewForEditContactInfo
{
    XFNAssetEditContactInfoViewController *vc = [[XFNAssetEditContactInfoViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    self.delegate = vc;   //object: detail view -> edit view;
    
    vc.delegate   = self; //object: edit view -> detail view;
    
    [self.delegate toSendAssetModelwithObject: _detailModel];
    
    [self.navigationController pushViewController:vc animated:YES];
}


@end





























