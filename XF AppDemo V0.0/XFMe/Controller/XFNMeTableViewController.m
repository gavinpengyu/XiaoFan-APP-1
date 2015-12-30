//
//  XFNMeTableViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/27.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNMeTableViewController.h"
#import "XFNMeTableViewModel.h"
#import "XFNMeTableViewCell.h"


@implementation XFNMeTableViewController
{
    XFNMeTableViewModel *_userModel;
}
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    [self initData]; 
}

- (void) initData
{
    //获取当前用户信息
    AVUser *currentUser = [AVUser currentUser];
    if (nil == currentUser)
    {
        DLog(@"ERROR：内部错误，currentUser ＝ nil");
        return;
    }
    
    //同步服务器用户信息
    _userModel = (XFNMeTableViewModel *) [AVQuery getObjectOfClass: @"_User" objectId: currentUser.objectId];
    if (nil == _userModel)
    {
        DLog(@"ERROR: 内部错误，同步服务器用户信息失败");
    }
    
    return;
}



#pragma mark DataSource
//-----------------------------------------------------------------------------------------
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (0 == section)
    {
        return 2;
    }
    if (1 == section)
    {
        return 1;
    }
    
    return 0;
}

//-----------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (0 == indexPath.section)
    {
        if (0 == indexPath.row)
        {
            XFNMeTableViewCellSection0Row0 *cell = [[XFNMeTableViewCellSection0Row0 alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
            
            [cell setModel: _userModel];
            
            [cell initViewLayout];
            
            return cell;
        }
        
        if (1 == indexPath.row)
        {
            XFNMeTableViewCellSection0Row1 *cell = [[XFNMeTableViewCellSection0Row1 alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
            
            [cell setModel: _userModel];
            
            [cell initViewLayout];
            
            return cell;
        }
    }

    if (1 == indexPath.section)
    {
        XFNMeTableViewCellSection1Row0 *cell = [[XFNMeTableViewCellSection1Row0 alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        [cell setModel: _userModel];
        
        [cell initViewLayout];
        
        return cell;
    }

    return nil;
}

#pragma mark TableView Delegate
//-----------------------------------------------------------------------------------------
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return XFNTableViewCellControlSpacing;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView: tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(6_0)
{
    return NO;
}


















@end
