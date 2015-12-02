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

#import "XFNFrameCommonItemDetailModel.h"
#import "XFNWorkDetailTableViewController.h"

@implementation XFNWorkTableViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight      = 120;  //限定行高,po,20151017；UITableViewAutomaticDimension 修改为自适应，20151027
    
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    self.tableView.separatorInset = UIEdgeInsetsMake(0, 3, 0, 11);
//    self.tableView.separatorColor = [UIColor grayColor];
    
    self.cellClass = [XFNWorkTableViewCell class];
    
    //self.sectionsNumber = self.dataArray.count;//这句话会导致程序异常，错误可重现,po，20151017 19:06,signal SIGABRT
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initData];
    [self.tableView reloadData]; //po 20151111：这种方式可以简单的刷新tableView里面的所有cell，但是从性能上讲是不合理的，应该使用NSNotificationCenter，传递修改的cell的Indexpath，然后只刷新那一个cell
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
    [query orderByAscending  : @"updatedAt"];
    [query addAscendingOrder : @"bIsOnTop"];
    
    //设置查询数量
    query.limit = 10;
    
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

#pragma mark - delegate
//-----------------------------------------------------------------------------------------
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    CGRect mainScreenRect       = [[UIScreen mainScreen] bounds];
    CGSize mainScreenSize       = mainScreenRect.size;
    
    XFNWorkTableViewHeader * head = [[XFNWorkTableViewHeader alloc] init];
    head                          = [head initWithFrame: CGRectMake(0,
                                                                    0,
                                                                    mainScreenSize.width,
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
    
    //po 20151201 这么写是有风险的，应该改成在字符串中寻找第二个｜，将第二个｜之前的部分作为子字符串赋值给title
    NSArray *tempNameArray = [model.nameString componentsSeparatedByString:@"|"];
    
    NSString* tempName = [NSString stringWithFormat: @"%@ | %@", tempNameArray[0], tempNameArray[1]];
    
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
