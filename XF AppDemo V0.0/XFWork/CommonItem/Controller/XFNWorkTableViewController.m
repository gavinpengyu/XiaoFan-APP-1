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
#import "XFNWorkTableViewController.h"
#import "XFNWorkTableViewCell.h"
#import "XFNWorkTableViewCellModel.h"
#import "XFNWorkTableViewHeader.h"
#import "UIView+XFNExtension.h"
#import "XFNFrameCommonItemDetailModel.h"
#import "XFNWorkDetailTableViewController.h"

@implementation XFNWorkTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 120;  //限定行高,po,20151017；UITableViewAutomaticDimension 修改为自适应，20151027
    
    self.cellClass = [XFNWorkTableViewCell class];
    
    //self.sectionsNumber = self.dataArray.count;//这句话会导致程序异常，错误可重现,po，20151017 19:06,signal SIGABRT

}

- (void) viewWillAppear:(BOOL)animated
{
    [self initData];
    [self.tableView reloadData]; //po 20151111：这种方式可以简单的刷新tableView里面的所有cell，但是从性能上讲是不合理的，应该使用NSNotificationCenter，传递修改的cell的Indexpath，然后只刷新那一个cell
}

- (void) initData
{

}

//Adapter of datacom, po, 20151027
//- (NSMutableArray *) getModelDataWithFlag : (XFNCellModelDataGetType) dataGetType
//{
//    
//    //*********BEGIN         pseudo data, Asset, po, 20151027 ************
//    XFNFrameCommonItemDetailModel *tempDataModel = [[XFNFrameCommonItemDetailModel alloc] init];
//    NSMutableArray *tempAsset = [tempDataModel getDataWithType : XFNFrameDataTypeIsCommonItem];
//    //[tempAsset addObject : model];
//    
//    NSMutableArray *tempAccount = [NSMutableArray array];
//    {
//        XFNWorkTableViewCellModel *model = [XFNWorkTableViewCellModel
//                                           //modelWithFollowed : [NSString stringWithFormat:@"%d人已关注", i]
//                                           initmodelWithname : @"林先生｜丁桥"
//                                           detail : @"2室1厅－3室2厅｜80-100平米｜毛胚"
//                                           price : @"180－250万"
//                                           status : @"有效"
//                                           ownername : @"飞鸟"
//                                           sendtime : @"2015-10-10 12:44"
//                                           ownerimage : [UIImage imageNamed:@"TestOwnerImage"] ];
//
//        [tempAccount addObject : model];
//    }
//    //*********END         pseudo data, Asset, po, 20151027 **************
//
//    switch (dataGetType) {
//        case XFNGetTypeDefault:
//        {
//            [tempAsset addObjectsFromArray: tempAccount];
//            return tempAsset;
//        }
//        case XFNGetTypeAsset : return tempAsset;
//            
//        case XFNGetTypeAccount : return tempAccount;
//            
//        default:
//        {
//            DLog(@"Error in dataGetType.");
//            return nil;
//        }
//    }
//}

#pragma mark - delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFNWorkTableViewCellModel *model = self.dataArray[indexPath.row];
    XFNWorkDetailTableViewController *vc = [[XFNWorkDetailTableViewController alloc] init];
    vc.title = model.nameString;
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
