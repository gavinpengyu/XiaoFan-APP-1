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
#import "XFWorkTableViewHeader.h"
#import "UIView+XFExtension.h"

@interface XFWorkTableViewController ()

@property (nonatomic, strong) NSArray *headerDataArray;


@end

@implementation XFWorkTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cellModelDataType = XFGetTypeDefault;
    //self.refreshMode = XFFrameTableViewControllerRefeshModeHeaderRefresh;
    self.tableView.rowHeight = 90;  //限定行高,po,20151017；UITableViewAutomaticDimension 修改为自适应，20151027
    
    self.cellClass = [XFWorkTableViewCell class];
    
    [self setupHeader];
    
    [self setupModel];
    
    //self.sectionsNumber = self.dataArray.count;//这句话会导致程序异常，错误可重现,po，20151017 19:06,signal SIGABRT
}

- (void)setupHeader
{
    XFWorkTableViewHeaderItemModel *model0 = [XFWorkTableViewHeaderItemModel modelWithTitle:@"全部" imageName:@"Work_Table_Header_All"];
    
    XFWorkTableViewHeaderItemModel *model1 = [XFWorkTableViewHeaderItemModel modelWithTitle:@"房源" imageName:@"Work_Table_Header_Assets"];
    
    XFWorkTableViewHeaderItemModel *model2 = [XFWorkTableViewHeaderItemModel modelWithTitle:@"客源" imageName:@"Work_Table_Header_Account"];
    
    XFWorkTableViewHeaderItemModel *model3 = [XFWorkTableViewHeaderItemModel modelWithTitle:@"无" imageName:@"Work_Table_Header_None"];
    
    self.headerDataArray = @[model0, model1, model2, model3];
    
    
    XFWorkTableViewHeader *header = [[XFWorkTableViewHeader alloc] init];
    header.sd_height = 90;
    header.headerItemModelsArray = self.headerDataArray;
    __weak typeof(self) weakSelf = self;
    header.buttonClickedOperationBlock = ^(NSInteger index)
    {
        _cellModelDataType = (XFCellModelDataGetType)index;
        [weakSelf reloadModelData];
    };
    self.tableView.tableHeaderView = header;
}

- (void)setupModel
{
    NSMutableArray *temp = [NSMutableArray array];
    temp = [self getModelDataWithFlag : _cellModelDataType];
    self.dataArray = [temp copy];
}

//Adapter of datacom, po, 20151027
- (NSMutableArray *) getModelDataWithFlag : (XFCellModelDataGetType) dataGetType
{
    //*********BEGIN         pseudo data, Asset, po, 20151027 ************
    NSMutableArray *tempAsset = [NSMutableArray array];
    for (int i = 0; i < 12; i++)
    {
        XFWorkTableViewCellModel *model = [XFWorkTableViewCellModel
                                           modelWithFollowed : [NSString stringWithFormat:@"%d人已关注", i]
                                           ownerString : [NSString stringWithFormat:@"番茄%d号", i]
                                           details0String : @"红街公寓"
                                           details1String : [NSString stringWithFormat:@"10-%d-1001",i]
                                           priceString : [NSString stringWithFormat:@"20%d万",i] ];
        [tempAsset addObject : model];
    }
    NSMutableArray *tempAccount = [NSMutableArray array];
    for (int i = 0; i < 12; i++)
    {
        XFWorkTableViewCellModel *model = [XFWorkTableViewCellModel
                                           modelWithFollowed : [NSString stringWithFormat:@"%d人已关注", i]
                                           ownerString : [NSString stringWithFormat:@"番茄%d号", i]
                                           details0String : @"林先生 丁桥"
                                           details1String : [NSString stringWithFormat:@"2-3房，90-100平"]
                                           priceString : [NSString stringWithFormat:@"20%d万",i] ];
        [tempAccount addObject : model];
    }
    //*********END         pseudo data, Asset, po, 20151027 **************

    switch (dataGetType) {
        case XFGetTypeDefault:
        {
            [tempAsset addObjectsFromArray: tempAccount];
            return tempAsset;
        }
        case XFGetTypeAsset : return tempAsset;
            
        case XFGetTypeAccount : return tempAccount;
            
        default:
        {
            NSLog(@"Error in dataGetType.");
            return nil;
        }
    }
}

- (void) reloadModelData
{
    NSMutableArray *temp = [NSMutableArray array];
    temp = [self getModelDataWithFlag : _cellModelDataType];
    self.dataArray = [temp copy];
    [self.tableView reloadData];
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
