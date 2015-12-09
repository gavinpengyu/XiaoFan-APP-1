//
//  XFNAssetEditContactInfoViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNAssetEditContactInfoViewController.h"
#import "XFNAssetEditContactInfoView.h"

@implementation XFNAssetEditContactInfoViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XFNAssetEditContactInfoView * view = [[XFNAssetEditContactInfoView alloc] initWithFrame: CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenHeight)];
    
    /*重要： PO 20151209
     在ContactInfoView中，嵌入了一个XFNAssetContactTableViewController，而该TableView的每一个cell都是XFNAssetEditView(便于使用统一的布局及方法)
     
     因此，在此处创建的XFNAssetEditContactInfoView的delegate是XFNAssetEditContactInfoViewController(继承自XFNAssetEditViewController)
     
     该delegate在XFNAssetEditContactInfoView中被赋值给XFNAssetContactTableViewController
     
     在XFNAssetContactTableViewController的cellForRowAtIndexPath中，该delegate被赋值给XFNAssetContactTableViewCell
     
     在XFNAssetContactTableViewCell中，该delegate被赋值给cell中的XFNAssetEditView。这样，cell中的XFNAssetEditView就可以调用XFNAssetEditViewController中的delegate方法
     
     赋值路径为XFNAssetEditContactInfoView -> XFNAssetContactTableViewController -> XFNAssetContactTableViewCell -> XFNAssetEditView
     */
    view.delegate = self;
    
    [view setModel: _detailModel];
    
    [view layoutViews];
    
    self.view = view;
}


@end



//-----------------------------------------------------------------------------------------
@implementation XFNAssetContactTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.cellClass = [XFNAssetContactTableViewCell class];
}

#pragma mark DataSource
//-----------------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

//-----------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //po 20151209 每一个contact在server中以一串字符串的形式存在
    NSString *contactInfo = self.dataArray[indexPath.row];
    
    XFNAssetContactTableViewCell *cell = [[XFNAssetContactTableViewCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
    
    cell.delegate = self.delegate;
    
    [cell setModel : contactInfo];
    
    return cell;
}

#pragma mark TableView Delegate
//-----------------------------------------------------------------------------------------
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
