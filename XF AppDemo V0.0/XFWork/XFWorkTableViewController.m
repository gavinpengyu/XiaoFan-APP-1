//
//  XFWorkTableViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFWorkTableViewController.h"
#import "XFWorkTableViewCell.h"
#import "XFWorkTableViewCellModel.h"
#import "XFWorkTableViewTopCell.h"
#import "UIView+XFExtension.h"

@interface XFWorkTableViewController ()

@end

@implementation XFWorkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshMode = XFFrameTableViewControllerRefeshModeHeaderRefresh;
    
    self.tableView.rowHeight = 70;
    
    XFWorkTableViewTopCell *header = [[XFWorkTableViewTopCell alloc] init];
    header.sd_height = 44;
    header.placeholderText = @"搜索服务窗";
    
    self.tableView.tableHeaderView = header;
    
    self.cellClass = [XFWorkTableViewCell class];
    
    [self setupModel];
}

- (void)setupModel
{
    NSMutableArray *temp = [NSMutableArray array];
    for (int i = 0; i < 12; i++) {
        XFWorkTableViewCellModel *model = [XFWorkTableViewCellModel
                                                  modelWithFollowed : [NSString stringWithFormat:@"%d人已关注", i]
                                                        ownerString : [NSString stringWithFormat:@"番茄%d号", i]
                                                     details0String : @"红街公寓"
                                                     details1String : [NSString stringWithFormat:@"10-%d-1001",i]
                                                        priceString : [NSString stringWithFormat:@"20%d万",i] ];
        [temp addObject : model];
    }
    
    self.dataArray = [temp copy];
}


#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFWorkTableViewCellModel *model = self.dataArray[indexPath.row];
    UIViewController *vc = [[XFFrameTableViewController alloc] init];
    vc.title = model.followedString;
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

- (void)pullDownRefreshOperation
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshControl endRefreshing];
    });
}


@end
