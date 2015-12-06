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
//#import "XFNStatusAttributePriceTableViewController.h"
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
- (void) initData
{

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
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    else if (XFNWorkDetailAuxiliaryInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailAuxiliaryInfoCellModel *tempCellModel = [[XFNWorkDetailAuxiliaryInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailAuxiliaryInfoCell *cell = [[XFNWorkDetailAuxiliaryInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        [cell setModel : tempCellModel];
        
        return cell;
    }
    else if (XFNWorkDetailContactInfoCellIndexEnum == indexPath.row)
    {
        XFNWorkDetailContactInfoCellModel *tempCellModel = [[XFNWorkDetailContactInfoCellModel alloc] initWithObject : _detailModel];
        
        XFNWorkDetailContactInfoCell *cell = [[XFNWorkDetailContactInfoCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
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
    //XFNWorkTableViewCellModel *model = self.dataArray[indexPath.row];
    UIViewController *vc = [[UIViewController alloc] init];
    
    vc.hidesBottomBarWhenPushed=YES;
    
    //po 20151201 这么写是有风险的，应该改成在字符串中寻找第二个｜，将第二个｜之前的部分作为子字符串赋值给title
//    NSArray *tempNameArray = [model.nameString componentsSeparatedByString:@"|"];
//    
//    NSString* tempName = [NSString stringWithFormat: @"%@ | %@", tempNameArray[0], tempNameArray[1]];
//    
//    self.delegate = vc;
//    
//    [self.delegate toSendAssetModelwithObject: _detailedAssetArray[indexPath.row]];
//    
//    vc.title = tempName;
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end

//@implementation XFNWorkDetailTableViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//    
//    //加载数据
//    [self initData];
//    
//    //创建一个分组样式的TableView，此举服务于部分section可能有多个Cell，如业主及联系人信息、价格及状态信息、跟进信息、备注信息等
//    _detailTableView=[[UITableView alloc] initWithFrame : self.view.bounds
//                                                  style : UITableViewStyleGrouped];
//    
//    //设置DataSource，注意必须实现对应的UITableViewDataSource协议
//    _detailTableView.dataSource = self;
//    
//    //设置Delegate
//    _detailTableView.delegate = self;
//    
//    [self.view addSubview: _detailTableView];
//}
//
//- (void) viewWillAppear:(BOOL)animated
//{
//    [_detailTableView reloadData]; //po 20151111：这种方式可以简单的刷新tableView里面的所有cell，但是从性能上讲是不合理的，应该使用NSNotificationCenter，传递修改的cell的Indexpath，然后只刷新那一个cell
//}
//
//#pragma mark 加载数据
//- (void) initData
//{
//    _detailTableViewModel = [[NSMutableArray alloc] init];
//    XFNFrameCommonItemDetailModel *tempDataModel = [[XFNFrameCommonItemDetailModel alloc] init];
//
//    //地址信息
//    NSMutableArray *tempAddressInfo = [tempDataModel getDataWithType : XFNFrameDataTypeIsCommonItemDetailAddressInfo];
//    XFNFrameAddressInfoModel *tempAddressInfo0 = tempAddressInfo[0];
//    //DLog(@"%@", tempAddressInfo0);
//    XFNWorkDetailTableViewCellModelGroup *tempAddressInfoGroup = [XFNWorkDetailTableViewCellModelGroup initWithModelGroup:[NSMutableArray arrayWithObjects:tempAddressInfo0, nil]];
//    [_detailTableViewModel addObject:tempAddressInfoGroup];
//
//    //价格、状态及归属人信息
//    NSMutableArray *tempStatusAttributePrice = [tempDataModel getDataWithType : XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice];
//    XFNFrameStatusAttributePriceModel *tempStatusAttributePrice0 = tempStatusAttributePrice[0];
//    //DLog(@"%@", tempStatusAttributePrice0);
//    XFNWorkDetailTableViewCellModelGroup *tempStatusAttributePriceGroup = [XFNWorkDetailTableViewCellModelGroup initWithModelGroup:[NSMutableArray arrayWithObjects:tempStatusAttributePrice0, nil]];
//    [_detailTableViewModel addObject:tempStatusAttributePriceGroup];
//    
//    return;
//}
//
//#pragma mark 数据源 DataSource
////返回分组数
//- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
//{
//    //DLog(@"计算分组数为%ld", _detailTableViewModel.count);
//    return _detailTableViewModel.count;
//}
//
////返回每组行数
//- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    XFNWorkDetailTableViewCellModelGroup *group = _detailTableViewModel[section];
//    
//    //DLog(@"计算Section %ld 的行数为 %ld", section, group.detailTableViewModelArray.count)
//    return group.detailTableViewModelArray.count;
//};
//
////返回每行的单元格
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //NSIndexPath是一个对象，记录了组和行信息
//    //NSLog(@"生成单元格(组：%i,行%i)",indexPath.section,indexPath.row);
//    XFNWorkDetailTableViewCellModelGroup *group=_detailTableViewModel[indexPath.section];
//
//    //每一组cell的格式不一样，根据IndexPath判断
//    
//    //地址信息块
//    if( XFNFrameDataTypeIsCommonItemDetailAddressInfo == indexPath.section)
//    {
//        
//        XFNFrameAddressInfoModel *contant=group.detailTableViewModelArray[indexPath.row];
//        //生成cell
//        XFNWorkAddressInfoTableViewCell *cell = [[XFNWorkAddressInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//        //给cell内容赋值
//        [cell setaddressInfoString:[NSString stringWithFormat:@"%@ | %@栋 | %@", contant.communityNameString, contant.buildingNoString, contant.roomNoString]];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        //DLog(@"Section: %ld, Row: %ld, Contant: %@", indexPath.section, indexPath.row, contant);
//        return cell;
//    }
//    //状态、价格、归属人信息块
//    if( XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice == indexPath.section)
//    {
//        
//        XFNFrameStatusAttributePriceModel *contant=group.detailTableViewModelArray[indexPath.row];
//        //生成cell
//        XFNWorkStatusAttributePriceTableViewCell *cell = [[XFNWorkStatusAttributePriceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
//        //给cell内容赋值
//        [cell setstatusAttributePrice: contant];
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        
//        //DLog(@"Section: %ld, Row: %ld, Contant: %@", indexPath.section, indexPath.row, contant);
//        return cell;
//    }
//    
//    return nil;
//}
//
////返回Section header内容高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    NSInteger height = XFNTableViewCellControlSpacing;
//    //DLog(@"Section : %ld, Header Height : %ld", section, height);
//    return height;
//}
//
////返回Section footer内容高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    NSInteger height = 0;
//    //DLog(@"Section : %ld, Footer Height : %ld", section, height);
//    return height;
//}
//
////自定义分隔符
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//
//{
//    
//    UIEdgeInsets insets = UIEdgeInsetsMake(0, 0, 0, 0);
//    
//    // 三个方法并用，实现自定义分割线效果
//    
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        cell.separatorInset = insets;
//    }
//    
//    
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:insets];
//    }
//    
//    
//    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
//        [cell setPreservesSuperviewLayoutMargins:NO];
//    }
//}
//
//
//#pragma mark 代理方法 Delegate
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //恢复为未选中状态，否则该cell会默认为灰色
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    
//    if (XFNFrameDataTypeIsCommonItemDetailAddressInfo == indexPath.section)
//    {
//        return;
//    }
//
//    if (XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice == indexPath.section)
//    {
//        XFNStatusAttributePriceTableViewController *vc = [[XFNStatusAttributePriceTableViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
//        return;
//    }
//  
//}
//
//
////重新设置单元格高度
////po 20151109: tableview在初始化时，是先调用heightForRowAtIndexPath计算cell高度，再调用cellForRowAtIndexPath填充cell内容。
////在当前代码结构下，cell.height需要在cellForRowAtIndexPath初始化cell，填入数据，然后才能计算高度。因此，先将高度值用宏固定（关联字体），今后有必要时，再添加自动计算高度的代码
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    if( XFNFrameDataTypeIsCommonItemDetailAddressInfo == indexPath.section)
//    {
//        return XFNDetailTableViewCellFontSizeDefault * 3;
//    }
//    
//    if( XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice == indexPath.section)
//    {
//        return XFNDetailTableViewCellFontSizeDefault * 3;
//    }
//    
//    DLog(@"出错：错误的indexPath.section%ld", (long)indexPath.section);
//    return 0;
//}
//
//
//@end































