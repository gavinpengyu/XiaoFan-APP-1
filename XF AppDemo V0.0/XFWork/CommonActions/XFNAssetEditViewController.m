//
//  XFNAssetEditViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNWorkTableViewController.h"

#import "XFNAssetEditViewController.h"

@implementation XFNAssetEditViewController
{
    NSMutableArray   *_pickViewArray;
}
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark Protocol Delegate, From detail view to edit view, here is receiver
//-----------------------------------------------------------------------------------------
- (void)toSendAssetModelwithObject : (XFNFrameAssetModel*) object
{
    _detailModel = object;
}

#pragma mark Protocol Delegate, From edit view cell to edit view controller, here is receiver
//-----------------------------------------------------------------------------------------
- (void)toBackAndSubmitObject : (XFNFrameAssetModel*) object withCellIndex: (XFNDetailViewCellIndexEnum) cellIndex
{
    _detailModel = object;
    
    //根据类型上传至服务器
    if (XFNWorkDetailBasicInfoCellIndexEnum == cellIndex)
    {
        XFNFrameAssetModel *tempModel = [XFNFrameAssetModel objectWithoutDataWithClassName: _Macro_XFN_ASSET_MODEL_
                                                                                  objectId: _detailModel.objectId];
        
        tempModel.assetTotalArea         = [_detailModel objectForKey: @"assetTotalArea"];
        tempModel.assetSharedArea        = [_detailModel objectForKey: @"assetSharedArea"];
        
        tempModel.quantityOfRoom         = [_detailModel objectForKey: @"quantityOfRoom"];
        tempModel.quantityOfToilet       = [_detailModel objectForKey: @"quantityOfToilet"];
        
        tempModel.assetStorey            = [_detailModel objectForKey: @"assetStorey"];
        tempModel.storeyOfAll            = [_detailModel objectForKey: @"storeyOfAll"];
        
        tempModel.basicInfoLabelsOfAsset = [_detailModel objectForKey: @"basicInfoLabelsOfAsset"];
        
        [tempModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded)
            {
                DLog(@"objectId=%@ 更新基本信息成功", _detailModel.objectId);
            }
        }];
    }
    else if(XFNWorkDetailTradeInfoCellIndexEnum == cellIndex)
    {
        XFNFrameAssetModel *tempModel = [XFNFrameAssetModel objectWithoutDataWithClassName: _Macro_XFN_ASSET_MODEL_
                                                                                  objectId: _detailModel.objectId];
        
        tempModel.assetTotalPrice  = [_detailModel objectForKey: @"assetTotalPrice"];
        tempModel.assetStatus      = [_detailModel objectForKey: @"assetStatus"];
        tempModel.attributeTo      = [_detailModel objectForKey: @"attributeTo"];
        
        tempModel.reserveMode      = [_detailModel objectForKey: @"reserveMode"];
        tempModel.reserveRemark    = [_detailModel objectForKey: @"reserveRemark"];
        
        tempModel.deliveryMode     = [_detailModel objectForKey: @"deliveryMode"];
        tempModel.deliveryRemark   = [_detailModel objectForKey: @"deliveryRemark"];
        
        tempModel.typeOfPaying     = [_detailModel objectForKey: @"typeOfPaying"];
        tempModel.taxInfo          = [_detailModel objectForKey: @"taxInfo"];
        
        [tempModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded)
            {
                DLog(@"objectId=%@ 更新交易信息成功", _detailModel.objectId);
            }
        }];
    }
    else
    {
        DLog(@"ERROR: 更新类型%ld未定义", cellIndex);
    }
    
    //po 20151208
    //返回detail view，事实上，在delegate中都是指针传递，在edit view中的修改，同时也修改了detail view中的值（指针指向同一个object）
    //但是为了保障逻辑的清晰，需要写delegate。同时，也方便今后使用别的值传递方式
    [self.delegate toSendAssetModelwithObject: _detailModel];
    [[self navigationController] popViewControllerAnimated:YES];
}

- (void)toActivatePickViewWithXFNButton: (XFNButton*) button
{
    CGFloat pickerWidth  = 80;
    CGFloat pickerHeight = 100;
    
    //根据property name初始化_pickViewArray
    [self initPickViewArrayByPropertyName: button.assetPropertyName];
    
    UIPickerView* picker = [[UIPickerView alloc] initWithFrame:CGRectMake(button.frame.origin.x + button.frame.size.width - pickerWidth - XFNTableViewCellControlSpacing,
                                                                          button.frame.origin.y - pickerHeight/2,
                                                                          pickerWidth,
                                                                          pickerHeight)];
    picker.delegate = self;
    picker.backgroundColor = [UIColor grayColor];
    picker.showsSelectionIndicator=YES;
    [self.view addSubview :picker];
    
    UIButton* pickerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    pickerButton.frame = CGRectMake(120, 150, 80, 40);
    [pickerButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview :pickerButton];
    
    [pickerButton addTarget:self action:@selector(pickerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pickerButtonPressed: (id)sender
{

}

- (void)initPickViewArrayByPropertyName: (NSString*) propertyName
{
    if([propertyName isEqualToString:@"assetStatus"])
    {
        _pickViewArray = (NSMutableArray*)[XFNWorkTableViewController getlabelsForAssetStatusGlobalArray];
    }

}

#pragma mark PickView delegate & datasource
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;  // 返回1表明该控件只包含1列
}
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法返回books.count，表明books包含多少个元素，该控件就包含多少行
    return _pickViewArray.count;
}
// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
// 中指定列和列表项的标题文本
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    // 由于该控件只包含一列，因此无须理会列序号参数component
    // 该方法根据row参数返回books中的元素，row参数代表列表项的编号，
    // 因此该方法表示第几个列表项，就使用books中的第几个元素
    return [_pickViewArray objectAtIndex:row];
}
// 当用户选中UIPickerViewDataSource中指定列和列表项时激发该方法
- (void)pickerView : (UIPickerView *)pickerView didSelectRow : (NSInteger)row inComponent : (NSInteger)component
{
    /* po 20151111：这一段代码，可以在不需要点击“确定”键的的情况下选中数据并更新，但是这种方式体验并不是很好
     
     NSString *selected = [_pickViewList objectAtIndex:row];
     DLog(@"%@ is selected, row is %ld", selected, row);
     
     //关闭Picker，remove subview，对象由ARC自动释放
     [_statusSelectButton removeFromSuperview];
     [_statusPicker removeFromSuperview];
     
     //将选择的数据写入
     XFNFrameStatusAttributePriceModel *tempStatusAttributePriceModel = [[XFNFrameStatusAttributePriceModel alloc] init];
     tempStatusAttributePriceModel = [_tableViewModel lastObject];
     tempStatusAttributePriceModel.statusEnum = row;
     [_tableViewModel removeAllObjects];
     [_tableViewModel addObject:tempStatusAttributePriceModel];
     
     //重要 po 20151111：调试阶段中，使用静态数组存放伪数据，此时实际已通过指针修改了静态数组中的值!! 下面的接口只是体现数据流程，没有实际内容
     XFNFrameCommonItemDetailModel *tempDataModel = [[XFNFrameCommonItemDetailModel alloc] init];
     [tempDataModel sendDataWithType : XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice
     withBuffer : _tableViewModel];
     
     //重要 po 20151111：暂时使用reload的方法重写cell，性能提升则需要用reloadRow方法，但如下代码不知为何会数组溢出而出错，待调试
     //NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];//刷新第一个section的第1行
     //[_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
     [_tableView reloadData];
     
     return;
     */
}


@end

//-----------------------------------------------------------------------------------------
@implementation XFNTextField

- (void)setAssetPropertyName:(NSString *)assetPropertyName
{
    _assetPropertyName = assetPropertyName;
}

@end

@implementation XFNButton

- (void)setAssetPropertyName:(NSString *)assetPropertyName
{
    _assetPropertyName = assetPropertyName;
}

- (void)setCustomizedLabel:(UILabel *)customizedLabel
{
    _customizedLabel = customizedLabel;
}

@end





