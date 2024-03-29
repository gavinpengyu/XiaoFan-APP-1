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

#import "XFNAssetCommentViewController.h"

#import "XFNFrameUserProfileModel.h"

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

//po 20151209: 在运行期如果有某部分代码调用了全局数组，并无意中修改全局数组的值，则会导致运行混乱。因此，将其修改为值copy
+ (NSArray *)getlabelsForAssetStatusGlobalArray
{
    NSArray* temp = [NSArray array];
    temp = [sXFNlabelsForAssetStatusGlobalArray mutableCopy];
    return temp;
}

+ (NSArray *)getlabelsForTypeOfPayGlobalArray
{
    NSArray* temp = [NSArray array];
    temp = [sXFNlabelsForTypeOfPayGlobalArray mutableCopy];
    return temp;
}

+ (NSArray *)getlabelsForTaxInfoGlobalArray
{
    NSArray* temp = [NSArray array];
    temp = [sXFNlabelsForTaxInfoGlobalArray mutableCopy];
    return temp;
}

+ (NSArray *)getlabelsForAssetLayoutInfoGlobalArray
{
    NSArray* temp = [NSArray array];
    temp = [sXFNlabelsForAssetLayoutInfoGlobalArray mutableCopy];
    return temp;
}

+ (NSArray *)getlabelsForDecorationInfoGlobalArray
{
    NSArray* temp = [NSArray array];
    temp = [sXFNlabelsForDecorationInfoGlobalArray mutableCopy];
    return temp;
}

+ (NSArray *)getlabelsForAncillaryInfoGlobalArray
{
    NSArray* temp = [NSArray array];
    temp = [sXFNlabelsForAncillaryInfoGlobalArray mutableCopy];
    return temp;
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
    
    if (nil != self.dataArray)
    {
        [self.dataArray removeAllObjects];
    }
    
    NSMutableArray       *tempTableViewArray = [[NSMutableArray alloc] init];
    
    //获取当前用户信息
    AVUser *currentUser = [AVUser currentUser];
    if (nil == currentUser)
    {
        DLog(@"ERROR：内部错误，currentUser ＝ nil");
        return;
    }
    
    //同步服务器用户信息
    XFNFrameUserProfileModel * userModel = (XFNFrameUserProfileModel *) [AVQuery getObjectOfClass: @"_User" objectId: currentUser.objectId];
    if (nil == userModel)
    {
        DLog(@"ERROR: 内部错误，同步服务器用户信息失败");
    }
    
    NSArray* tempOnTopItemArray = [userModel objectForKey: @"onTopItemArray"];//[NSArray arrayWithArray: userModel.onTopItemArray];
    
    NSArray* tempFollowedItemArray = [userModel objectForKey: @"followedItemArray"];//[NSArray arrayWithArray: userModel.followedItemArray];
    
    for (int ii = 0; ii < tempOnTopItemArray.count; ii++)
    //po 20160104:服务器侧保存的时候，因为没有 插入到数组最前方 的方法，所以每次添加都是插入在数组的最后方。从使用习惯来讲，最后置顶的应该在最上方，所以此处为倒序存放
    {
        XFNFrameAssetModel       *tempAssetModel = (XFNFrameAssetModel *)[AVQuery getObjectOfClass: _Macro_XFN_ASSET_MODEL_
                                                                                          objectId: tempOnTopItemArray[tempOnTopItemArray.count - ii - 1]];
        XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
        
        tempCellModel.bThisItemIsOnTop = true;
        
        if ([tempFollowedItemArray containsObject: tempAssetModel.objectId])
        {
            tempCellModel.bThisItemIsFollowed = true;
        }
        else
        {
            tempCellModel.bThisItemIsFollowed = false;
        }
        
        [_detailedAssetArray addObject: tempAssetModel];
        [tempTableViewArray  addObject: tempCellModel];
    }
    
    //新建查询
    AVQuery *query = [AVQuery queryWithClassName : _Macro_XFN_ASSET_MODEL_];
    
    //设置查询排序
    [query orderByDescending  : @"updatedAt"];
    //[query addDescendingOrder : @"bIsOnTop"];
    
    //设置查询数量
    query.limit = (20 - tempOnTopItemArray.count);
    
    //后台查询，并将结果存入tableView数组
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // 检索成功
            NSLog(@"Successfully received %lu posts.", (unsigned long)objects.count);
            
            //PO 20160105，此处有一个小bug，当被置顶的item在20个元素中，则这一次读取的总item数没有20个
            for (int ii=0; ii<objects.count; ii++)
            {
                //tempAssetModel = objects[ii];
                XFNFrameAssetModel       *tempAssetModel = objects[ii];
                XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
                
                if ([_detailedAssetArray containsObject: tempAssetModel])
                {
                    continue;
                }
                
                tempCellModel.bThisItemIsOnTop = false;
                
                if ([tempFollowedItemArray containsObject: tempAssetModel.objectId])
                {
                    tempCellModel.bThisItemIsFollowed = true;
                }
                else
                {
                    tempCellModel.bThisItemIsFollowed = false;
                }
                
                if (![_detailedAssetArray containsObject: tempAssetModel])
                {
                    [_detailedAssetArray addObject: tempAssetModel];
                }
                
                if (![tempTableViewArray containsObject: tempCellModel])
                {
                    [tempTableViewArray addObject: tempCellModel];
                }
            }
            
            self.dataArray = [NSMutableArray arrayWithArray: tempTableViewArray];//[tempTableViewArray copy];
            [self.tableView reloadData];
        }
        else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)initFollowedData
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
    
    NSMutableArray       *tempTableViewArray = [[NSMutableArray alloc] init];
    
    //获取当前用户信息
    AVUser *currentUser = [AVUser currentUser];
    if (nil == currentUser)
    {
        DLog(@"ERROR：内部错误，currentUser ＝ nil");
        return;
    }
    
    //同步服务器用户信息
    XFNFrameUserProfileModel * userModel = (XFNFrameUserProfileModel *) [AVQuery getObjectOfClass: @"_User" objectId: currentUser.objectId];
    if (nil == userModel)
    {
        DLog(@"ERROR: 内部错误，同步服务器用户信息失败");
    }
    
    NSArray* tempFollowedItemArray = [userModel objectForKey: @"followedItemArray"];
    
    NSArray* tempOnTopItemArray    = [userModel objectForKey: @"onTopItemArray"];
    
    for (int ii = 0; ii < tempFollowedItemArray.count; ii++)
        //po 20160104:服务器侧保存的时候，因为没有 插入到数组最前方 的方法，所以每次添加都是插入在数组的最后方。从使用习惯来讲，最后置顶的应该在最上方，所以此处为倒序存放
    {
        XFNFrameAssetModel       *tempAssetModel = (XFNFrameAssetModel *)[AVQuery getObjectOfClass: _Macro_XFN_ASSET_MODEL_
                                                                                          objectId: tempFollowedItemArray[tempFollowedItemArray.count - ii - 1]];
        XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
        
        tempCellModel.bThisItemIsFollowed = true;
        
        if ([tempOnTopItemArray containsObject: tempAssetModel.objectId])
        {
            tempCellModel.bThisItemIsOnTop = true;
            
            if (![_detailedAssetArray containsObject: tempAssetModel])
            {
                [_detailedAssetArray insertObject: tempAssetModel atIndex: 0];
            }
            
            if (![tempTableViewArray containsObject: tempCellModel])
            {
                [tempTableViewArray insertObject: tempCellModel atIndex: 0];
            }
        }
        else
        {
            tempCellModel.bThisItemIsOnTop = false;
            
            if (![_detailedAssetArray containsObject: tempAssetModel])
            {
                [_detailedAssetArray addObject: tempAssetModel];
            }
            
            if (![tempTableViewArray containsObject: tempCellModel])
            {
                [tempTableViewArray addObject: tempCellModel];
            }
        }
        
        
    }
    
    self.dataArray = [NSMutableArray arrayWithArray: tempTableViewArray];
    [self.tableView reloadData];
}


#pragma mark DataSource
//-----------------------------------------------------------------------------------------
//PO 20160105 DataSource由XFNFrameTableViewController完成

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
    head.delegate = self;
    return head;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return _Macro_XFNWorkTableViewHearder_Height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFNWorkTableViewCell *cell = (XFNWorkTableViewCell *)[super tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath];
    
    cell.delegate = self;
    
    cell.tag = indexPath.row; //记录cell的行数，在点击cell中button回调的时候，在controller中识别是哪一行

    return cell;
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

#pragma mark Protocol Cell - > Controller, 这里是receiver
//-----------------------------------------------------------------------------------------
- (void)toPushViewForCommentWithCellIndex: (NSInteger) index
{
    DLog(@"row = %ld", index);
    
    XFNAssetCommentViewController *vc = [[XFNAssetCommentViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    vc.detailModel = _detailedAssetArray[index];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)toChangeFollowStatusWithCellIndex: (NSInteger) index
{
    XFNFrameUserProfileModel *currentUser = (XFNFrameUserProfileModel *)[AVUser currentUser];
    
    XFNWorkTableViewCellModel* tempModel = (XFNWorkTableViewCellModel*) _detailedAssetArray[index];
    
    NSArray* tempFollowedItemArray = [currentUser objectForKey: @"followedItemArray"];
    
    //若关注清单中已包含，则认为是 取消关注 操作；否则，认为是添加 关注 操作
    if ([tempFollowedItemArray containsObject: tempModel.objectId])
    {
        [currentUser removeObject: tempModel.objectId forKey: @"followedItemArray"];
    }
    else
    {
        [currentUser addUniqueObject: tempModel.objectId forKey: @"followedItemArray"];
    }
    
    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            DLog(@"！！！！！！！！！！用户信息保存成功！！！！！！！！");
        }
        else
        {
            NSString *errMsg = [error userInfo][@"error"];
            
            DLog(@"%@", errMsg);
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"关注失败"
                                                                                     message: @"同步服务器数据错误"
                                                                              preferredStyle: UIAlertControllerStyleAlert];
            NSString *cancelButtonTitle = NSLocalizedString(@"返回", nil);
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                //NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
            }];
            
            [alertController addAction:cancelAction];
        }
    }];
}

- (void)toChangeOnTopStatusWithCellIndex: (NSInteger) index
{
    XFNFrameUserProfileModel *currentUser = (XFNFrameUserProfileModel *)[AVUser currentUser];
    
    XFNWorkTableViewCellModel* tempModel = (XFNWorkTableViewCellModel*) _detailedAssetArray[index];
    
    NSArray* tempOnTopItemArray = [currentUser objectForKey: @"onTopItemArray"];
    
    //若置顶清单中已包含，则认为是 取消置顶 操作；否则，认为是添加 置顶 操作
    if ([tempOnTopItemArray containsObject: tempModel.objectId])
    {
        [currentUser removeObject: tempModel.objectId forKey: @"onTopItemArray"];
    }
    else
    {
        [currentUser addUniqueObject: tempModel.objectId forKey: @"onTopItemArray"];
    }

    [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded)
        {
            DLog(@"！！！！！！！！！！用户信息保存成功！！！！！！！！");
        }
        else
        {
            NSString *errMsg = [error userInfo][@"error"];
            
            DLog(@"%@", errMsg);
            
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"关注失败"
                                                                                     message: @"同步服务器数据错误"
                                                                              preferredStyle: UIAlertControllerStyleAlert];
            NSString *cancelButtonTitle = NSLocalizedString(@"返回", nil);
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                //NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
            }];
            
            [alertController addAction:cancelAction];
        }
    }];
}

#pragma mark Protocol Header - > Controller, 这里是receiver
//-----------------------------------------------------------------------------------------
- (void) toShowAllItems
{
    DLog(@"toShowAllItems");
    [self initData];
    //[self.tableView reloadData];
}

- (void) toShowFollowedItems
{
    DLog(@"toShowFollowedItems");
    [self initFollowedData];
    //[self.tableView reloadData];
}

- (void) toShowOnRentingItems
{
    DLog(@"toShowOnRentingItems");

    //_detailedAssetArray用于向detailed View传递对应Object的详细数据
    if (nil == _detailedAssetArray)
    {
        _detailedAssetArray = [NSMutableArray array];
    }
    else
    {
        [_detailedAssetArray removeAllObjects];
    }
    
    if (nil != self.dataArray)
    {
        [self.dataArray removeAllObjects];
    }
    
    NSMutableArray       *tempTableViewArray = [[NSMutableArray alloc] init];
    
    //获取当前用户信息
    AVUser *currentUser = [AVUser currentUser];
    if (nil == currentUser)
    {
        DLog(@"ERROR：内部错误，currentUser ＝ nil");
        return;
    }
    
    //同步服务器用户信息
    XFNFrameUserProfileModel * userModel = (XFNFrameUserProfileModel *) [AVQuery getObjectOfClass: @"_User" objectId: currentUser.objectId];
    if (nil == userModel)
    {
        DLog(@"ERROR: 内部错误，同步服务器用户信息失败");
    }
    
    NSArray* tempOnTopItemArray = [userModel objectForKey: @"onTopItemArray"];//[NSArray arrayWithArray: userModel.onTopItemArray];
    
    NSArray* tempFollowedItemArray = [userModel objectForKey: @"followedItemArray"];//[NSArray arrayWithArray: userModel.followedItemArray];
    
    for (int ii = 0; ii < tempOnTopItemArray.count; ii++)
        //po 20160104:服务器侧保存的时候，因为没有 插入到数组最前方 的方法，所以每次添加都是插入在数组的最后方。从使用习惯来讲，最后置顶的应该在最上方，所以此处为倒序存放
    {
        XFNFrameAssetModel       *tempAssetModel = (XFNFrameAssetModel *)[AVQuery getObjectOfClass: _Macro_XFN_ASSET_MODEL_
                                                                                          objectId: tempOnTopItemArray[tempOnTopItemArray.count - ii - 1]];
        XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
        
        if (![tempCellModel.statusString isEqualToString: @"出租中"])
        {
            continue;
        }
        
        tempCellModel.bThisItemIsOnTop = true;
        
        if ([tempFollowedItemArray containsObject: tempAssetModel.objectId])
        {
            tempCellModel.bThisItemIsFollowed = true;
        }
        else
        {
            tempCellModel.bThisItemIsFollowed = false;
        }
        
        [_detailedAssetArray addObject: tempAssetModel];
        [tempTableViewArray  addObject: tempCellModel];
    }
    
    //新建查询
    AVQuery *query = [AVQuery queryWithClassName : _Macro_XFN_ASSET_MODEL_];
    
    //设置查询排序
    [query orderByDescending  : @"updatedAt"];
    
    [query whereKey:@"assetStatus" equalTo: @"出租中"];
    
    //设置查询数量
    query.limit = (20 - tempOnTopItemArray.count);
    
    //后台查询，并将结果存入tableView数组
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // 检索成功
            NSLog(@"Successfully received %lu posts.", (unsigned long)objects.count);
            
            //PO 20160105，此处有一个小bug，当被置顶的item在20个元素中，则这一次读取的总item数没有20个
            for (int ii=0; ii<objects.count; ii++)
            {
                //tempAssetModel = objects[ii];
                XFNFrameAssetModel       *tempAssetModel = objects[ii];
                XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
                
                if ([_detailedAssetArray containsObject: tempAssetModel])
                {
                    continue;
                }
                
                tempCellModel.bThisItemIsOnTop = false;
                
                if ([tempFollowedItemArray containsObject: tempAssetModel.objectId])
                {
                    tempCellModel.bThisItemIsFollowed = true;
                }
                else
                {
                    tempCellModel.bThisItemIsFollowed = false;
                }
                
                if (![_detailedAssetArray containsObject: tempAssetModel])
                {
                    [_detailedAssetArray addObject: tempAssetModel];
                }
                
                if (![tempTableViewArray containsObject: tempCellModel])
                {
                    [tempTableViewArray addObject: tempCellModel];
                }
            }
            
            self.dataArray = [NSMutableArray arrayWithArray: tempTableViewArray];//[tempTableViewArray copy];
            [self.tableView reloadData];
        }
        else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void) toShowOnSaleItems
{
    DLog(@"toShowOnSaleItems");
    //_detailedAssetArray用于向detailed View传递对应Object的详细数据
    if (nil == _detailedAssetArray)
    {
        _detailedAssetArray = [NSMutableArray array];
    }
    else
    {
        [_detailedAssetArray removeAllObjects];
    }
    
    if (nil != self.dataArray)
    {
        [self.dataArray removeAllObjects];
    }
    
    NSMutableArray       *tempTableViewArray = [[NSMutableArray alloc] init];
    
    //获取当前用户信息
    AVUser *currentUser = [AVUser currentUser];
    if (nil == currentUser)
    {
        DLog(@"ERROR：内部错误，currentUser ＝ nil");
        return;
    }
    
    //同步服务器用户信息
    XFNFrameUserProfileModel * userModel = (XFNFrameUserProfileModel *) [AVQuery getObjectOfClass: @"_User" objectId: currentUser.objectId];
    if (nil == userModel)
    {
        DLog(@"ERROR: 内部错误，同步服务器用户信息失败");
    }
    
    NSArray* tempOnTopItemArray = [userModel objectForKey: @"onTopItemArray"];//[NSArray arrayWithArray: userModel.onTopItemArray];
    
    NSArray* tempFollowedItemArray = [userModel objectForKey: @"followedItemArray"];//[NSArray arrayWithArray: userModel.followedItemArray];
    
    for (int ii = 0; ii < tempOnTopItemArray.count; ii++)
        //po 20160104:服务器侧保存的时候，因为没有 插入到数组最前方 的方法，所以每次添加都是插入在数组的最后方。从使用习惯来讲，最后置顶的应该在最上方，所以此处为倒序存放
    {
        XFNFrameAssetModel       *tempAssetModel = (XFNFrameAssetModel *)[AVQuery getObjectOfClass: _Macro_XFN_ASSET_MODEL_
                                                                                          objectId: tempOnTopItemArray[tempOnTopItemArray.count - ii - 1]];
        XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
        
        if (![tempCellModel.statusString isEqualToString: @"出售中"])
        {
            continue;
        }
        
        tempCellModel.bThisItemIsOnTop = true;
        
        if ([tempFollowedItemArray containsObject: tempAssetModel.objectId])
        {
            tempCellModel.bThisItemIsFollowed = true;
        }
        else
        {
            tempCellModel.bThisItemIsFollowed = false;
        }
        
        [_detailedAssetArray addObject: tempAssetModel];
        [tempTableViewArray  addObject: tempCellModel];
    }
    
    //新建查询
    AVQuery *query = [AVQuery queryWithClassName : _Macro_XFN_ASSET_MODEL_];
    
    //设置查询排序
    [query orderByDescending  : @"updatedAt"];
    
    [query whereKey:@"assetStatus" equalTo: @"出售中"];
    
    //设置查询数量
    query.limit = (20 - tempOnTopItemArray.count);
    
    //后台查询，并将结果存入tableView数组
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // 检索成功
            NSLog(@"Successfully received %lu posts.", (unsigned long)objects.count);
            
            //PO 20160105，此处有一个小bug，当被置顶的item在20个元素中，则这一次读取的总item数没有20个
            for (int ii=0; ii<objects.count; ii++)
            {
                //tempAssetModel = objects[ii];
                XFNFrameAssetModel       *tempAssetModel = objects[ii];
                XFNWorkTableViewCellModel *tempCellModel = [[XFNWorkTableViewCellModel alloc] initWithObject : tempAssetModel];
                
                if ([_detailedAssetArray containsObject: tempAssetModel])
                {
                    continue;
                }
                
                tempCellModel.bThisItemIsOnTop = false;
                
                if ([tempFollowedItemArray containsObject: tempAssetModel.objectId])
                {
                    tempCellModel.bThisItemIsFollowed = true;
                }
                else
                {
                    tempCellModel.bThisItemIsFollowed = false;
                }
                
                if (![_detailedAssetArray containsObject: tempAssetModel])
                {
                    [_detailedAssetArray addObject: tempAssetModel];
                }
                
                if (![tempTableViewArray containsObject: tempCellModel])
                {
                    [tempTableViewArray addObject: tempCellModel];
                }
            }
            
            self.dataArray = [NSMutableArray arrayWithArray: tempTableViewArray];//[tempTableViewArray copy];
            [self.tableView reloadData];
        }
        else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void) toConfigHead
{
    DLog(@"test toConfigHead");
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
