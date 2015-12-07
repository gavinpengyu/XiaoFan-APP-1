//
//  XFNWorkTableViewController.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNWorkTableViewController.h"

#import "XFNWorkTableViewCell.h"
#import "XFNWorkTableViewHeader.h"
#import "XFNWorkTableViewCellModel.h"

#import "XFNWorkDetailTableViewCell.h"
#import "XFNFrameCommonItemDetailModel.h"
#import "XFNWorkDetailTableViewController.h"

//-----------全局标签数组，在整个房源View使用--------------------------------------------------
static NSMutableArray * sXFNlabelsForAssetStatusGlobalArray;
static NSMutableArray * sXFNlabelsForTypeOfPayGlobalArray;
static NSMutableArray * sXFNlabelsForTaxInfoGlobalArray;
static NSMutableArray * sXFNlabelsForAssetLayoutInfoGlobalArray;
static NSMutableArray * sXFNlabelsForDecorationInfoGlobalArray;
static NSMutableArray * sXFNlabelsForAncillaryInfoGlobalArray;
//-----------------------------------------------------------------------------------------

@implementation XFNWorkTableViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.tableView.rowHeight      = 160;  //限定行高,po,20151202；UITableViewAutomaticDimension 可修改为自适应，20151027
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 3, 0, 11);
//    self.tableView.separatorColor = [UIColor grayColor];
    
    self.cellClass = [XFNWorkTableViewCell class];
    
    [self initLabelsGlobalArray];
    
    //self.sectionsNumber = self.dataArray.count;//这句话会导致程序异常，错误可重现,po，20151017 19:06,signal SIGABRT
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initData];
    [self.tableView reloadData]; //po 20151111：这种方式可以简单的刷新tableView里面的所有cell，但是从性能上讲是不合理的，应该使用NSNotificationCenter，传递修改的cell的Indexpath，然后只刷新那一个cell
}

- (void)initLabelsGlobalArray//: (NSMutableArray*) mutableArray
{
    //-----------------------------------------------------------------------------------------
    if (nil == sXFNlabelsForAssetStatusGlobalArray)
    {
        sXFNlabelsForAssetStatusGlobalArray = [NSMutableArray array];
    }
    else
    {
        [sXFNlabelsForAssetStatusGlobalArray removeAllObjects];
    }
    //-----------------------------------------------------------------------------------------
    if (nil == sXFNlabelsForTypeOfPayGlobalArray)
    {
        sXFNlabelsForTypeOfPayGlobalArray = [NSMutableArray array];
    }
    else
    {
        [sXFNlabelsForTypeOfPayGlobalArray removeAllObjects];
    }
    //-----------------------------------------------------------------------------------------
    if (nil == sXFNlabelsForTaxInfoGlobalArray)
    {
        sXFNlabelsForTaxInfoGlobalArray = [NSMutableArray array];
    }
    else
    {
        [sXFNlabelsForTaxInfoGlobalArray removeAllObjects];
    }
    //-----------------------------------------------------------------------------------------
    if (nil == sXFNlabelsForAssetLayoutInfoGlobalArray)
    {
        sXFNlabelsForAssetLayoutInfoGlobalArray = [NSMutableArray array];
    }
    else
    {
        [sXFNlabelsForAssetLayoutInfoGlobalArray removeAllObjects];
    }
    //-----------------------------------------------------------------------------------------
    if (nil == sXFNlabelsForDecorationInfoGlobalArray)
    {
        sXFNlabelsForDecorationInfoGlobalArray = [NSMutableArray array];
    }
    else
    {
        [sXFNlabelsForDecorationInfoGlobalArray removeAllObjects];
    }
    //-----------------------------------------------------------------------------------------
    if (nil == sXFNlabelsForAncillaryInfoGlobalArray)
    {
        sXFNlabelsForAncillaryInfoGlobalArray = [NSMutableArray array];
    }
    else
    {
        [sXFNlabelsForAncillaryInfoGlobalArray removeAllObjects];
    }
    
    //新建查询
    AVQuery *query = [AVQuery queryWithClassName : _Macro_XFN_ASSET_LABEL_MODEL_];
    
    //设置查询排序
    [query orderByAscending  : @"updatedAt"];
    
    //设置查询数量
    query.limit = 1;
    
    //后台查询，并将结果存入tableView数组
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            XFNLabelsForAsset       *tempAssetLabel  = objects[0];
            //-----------------------------------------------------------------------------------------
            NSArray* tempArraylabelsForAssetStatus = [tempAssetLabel objectForKey : @"labelsForAssetStatus"];
            //NSArray * tempArraylabelsForAssetStatus  = [tempStringlabelsForAssetStatus componentsSeparatedByString : @","];
            for ( NSString* tempString in tempArraylabelsForAssetStatus)
            {
                [sXFNlabelsForAssetStatusGlobalArray addObject: tempString];
            }
            //-----------------------------------------------------------------------------------------
            NSArray* tempArraylabelsForTypeOfPay = [tempAssetLabel objectForKey : @"labelsForTypeOfPay"];
            //NSArray * tempArraylabelsForTypeOfPay  = [tempStringlabelsForTypeOfPay componentsSeparatedByString : @","];
            for ( NSString* tempString in tempArraylabelsForTypeOfPay)
            {
                [sXFNlabelsForTypeOfPayGlobalArray addObject: tempString];
            }
            //-----------------------------------------------------------------------------------------
            NSArray* tempArraylabelsForTaxInfo = [tempAssetLabel objectForKey : @"labelsForTaxInfo"];
            //NSArray * tempArraylabelsForTaxInfo  = [tempStringlabelsForTaxInfo componentsSeparatedByString : @","];
            for ( NSString* tempString in tempArraylabelsForTaxInfo)
            {
                [sXFNlabelsForTaxInfoGlobalArray addObject: tempString];
            }
            //-----------------------------------------------------------------------------------------
            NSArray* tempArrayabelsForAssetLayoutInfo = [tempAssetLabel objectForKey : @"labelsForAssetLayoutInfo"];
            //NSArray * tempArrayabelsForAssetLayoutInfo  = [tempStringabelsForAssetLayoutInfo componentsSeparatedByString : @","];
            for ( NSString* tempString in tempArrayabelsForAssetLayoutInfo)
            {
                [sXFNlabelsForAssetLayoutInfoGlobalArray addObject: tempString];
            }
            //-----------------------------------------------------------------------------------------
            NSArray* tempArraylabelsForDecorationInfo = [tempAssetLabel objectForKey : @"labelsForDecorationInfo"];
            //NSArray * tempArraylabelsForDecorationInfo  = [tempStringlabelsForDecorationInfo componentsSeparatedByString : @","];
            for ( NSString* tempString in tempArraylabelsForDecorationInfo)
            {
                [sXFNlabelsForDecorationInfoGlobalArray addObject: tempString];
            }
            //-----------------------------------------------------------------------------------------
            NSArray* tempArraylabelsForAncillaryInfo = [tempAssetLabel objectForKey : @"labelsForAncillaryInfo"];
            //NSArray * tempArraylabelsForAncillaryInfo  = [tempStringlabelsForAncillaryInfo componentsSeparatedByString : @","];
            for ( NSString* tempString in tempArraylabelsForAncillaryInfo)
            {
                [sXFNlabelsForAncillaryInfoGlobalArray addObject: tempString];
            }
            DLog("初始化标签数组成功");
        }
        else
        {
            // 输出错误信息
            DLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

+ (NSArray *)getlabelsForAssetStatusGlobalArray
{
    return sXFNlabelsForAssetStatusGlobalArray;
}

+ (NSArray *)getlabelsForTypeOfPayGlobalArray
{
    return sXFNlabelsForTypeOfPayGlobalArray;
}

+ (NSArray *)getlabelsForTaxInfoGlobalArray
{
    return sXFNlabelsForTaxInfoGlobalArray;
}

+ (NSArray *)getlabelsForAssetLayoutInfoGlobalArray
{
    return sXFNlabelsForAssetLayoutInfoGlobalArray;
}

+ (NSArray *)getlabelsForDecorationInfoGlobalArray
{
    return sXFNlabelsForDecorationInfoGlobalArray;
}

+ (NSArray *)getlabelsForAncillaryInfoGlobalArray
{
    return sXFNlabelsForAncillaryInfoGlobalArray;
}

- (void)initData
{
    //_detailedAssetArray用于向detailed View传递对应Object的详细数据
    if (nil == _detailedAssetArray)
    {
        _detailedAssetArray = [NSMutableArray array];
    }
    else
    {
        [_detailedAssetArray removeAllObjects];
    }
    
    //新建查询
    AVQuery *query = [AVQuery queryWithClassName : _Macro_XFN_ASSET_MODEL_];
    
    //设置查询排序
    [query orderByDescending  : @"updatedAt"];
    [query addDescendingOrder : @"bIsOnTop"];
    
    //设置查询数量
    query.limit = 20;
    
    //后台查询，并将结果存入tableView数组
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // 检索成功
            NSLog(@"Successfully received %lu posts.", (unsigned long)objects.count);
            
            NSMutableArray       *tempTableViewArray = [[NSMutableArray alloc] init];
            //XFNFrameAssetModel       *tempAssetModel = [[XFNFrameAssetModel alloc] init];
            
            for (int ii=0; ii<objects.count; ii++)
            {
                //tempAssetModel = objects[ii];
                XFNFrameAssetModel       *tempAssetModel = objects[ii];
                XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
                
                [tempTableViewArray addObject : tempCellModel];
                //用于向Detailed View传递object数据
                [_detailedAssetArray addObject : tempAssetModel];
            }
            
            self.dataArray = [tempTableViewArray copy];
            
        } else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}


#pragma mark DataSource
//-----------------------------------------------------------------------------------------
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.dataArray.count;
//}

//-----------------------------------------------------------------------------------------
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : _detailedAssetArray[indexPath.row]];
//    
//    XFNWorkTableViewCell *cell = [[XFNWorkTableViewCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
//    
//    [cell setModel : tempCellModel];
//    
//    return cell;
//}

#pragma mark - delegate
//-----------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView: tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    XFNWorkTableViewHeader * head = [[XFNWorkTableViewHeader alloc] init];
    head                          = [head initWithFrame: CGRectMake(0,
                                                                    0,
                                                                    _Macro_ScreenWidth,
                                                                    _Macro_XFNWorkTableViewHearder_Height)];
    return head;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _Macro_XFNWorkTableViewHearder_Height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFNWorkTableViewCellModel *model = self.dataArray[indexPath.row];
    XFNWorkDetailTableViewController *vc = [[XFNWorkDetailTableViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151201 这么写是有风险的，应该改成在字符串中寻找第二个｜，将第二个｜之前的部分作为子字符串赋值给title
    NSArray *tempNameArray = [model.nameString componentsSeparatedByString:@"|"];
    
    NSString* tempName = [NSString stringWithFormat: @"%@ | %@", tempNameArray[0], tempNameArray[1]];
    
    self.delegate = vc;
    
    [self.delegate toSendAssetModelwithObject: _detailedAssetArray[indexPath.row]];
    
    vc.title = tempName;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.tableView endEditing:YES];
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    // 三个方法并用，实现自定义分割线效果
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        cell.separatorInset = insets;
    }
    
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:insets];
    }
    
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
}

#pragma mark - pull down refresh
//-----------------------------------------------------------------------------------------
- (void)pullDownRefreshOperation
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
    });
}


@end
