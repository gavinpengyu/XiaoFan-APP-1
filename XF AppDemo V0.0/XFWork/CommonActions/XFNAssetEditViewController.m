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

#define _Macro_PickerViewWidth 80
#define _Macro_PickerViewHeight 100

@implementation XFNAssetEditViewController
{
    UIPickerView     *_picker;
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
    else if(XFNWorkDetailAuxiliaryInfoCellIndexEnum == cellIndex)
    {
        XFNFrameAssetModel *tempModel = [XFNFrameAssetModel objectWithoutDataWithClassName: _Macro_XFN_ASSET_MODEL_
                                                                                  objectId: _detailModel.objectId];
        
        tempModel.decorationInfo  = [_detailModel objectForKey: @"decorationInfo"];
        tempModel.ancillaryInfo   = [_detailModel objectForKey: @"ancillaryInfo"];

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
    CGFloat pickerWidth  = _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2;
    CGFloat pickerHeight = _Macro_PickerViewHeight;
    
    //当前有选择器未通过“确认”按钮关闭，则不响应别的选择器
    if (nil != _picker)
    {
        return;
    }
    
    //根据property name初始化_pickViewArray
    [self initPickViewArrayByPropertyName: button.assetPropertyName];
    
//    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(button.frame.origin.x + button.frame.size.width + XFNTableViewCellControlSpacing,
//                                                                          button.frame.origin.y + button.frame.size.height- pickerHeight/2 - XFNTableViewCellControlSpacing,
//                                                                          pickerWidth,
//                                                                          pickerHeight)];
    _picker = [[UIPickerView alloc] initWithFrame:CGRectMake(XFNTableViewCellControlSpacing,
                                                             _Macro_ScreenHeight/2,
                                                             pickerWidth,
                                                             pickerHeight)];
    _picker.backgroundColor         = [UIColor lightGrayColor];
    _picker.delegate                = self;
    _picker.showsSelectionIndicator = YES;
    _picker.autoresizingMask        = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview :_picker];
    
    UILabel* tempLabel     = [[UILabel alloc] init];
    tempLabel.text         = @"确定";
    tempLabel.textColor    = [UIColor blackColor];
    tempLabel.textAlignment= NSTextAlignmentCenter;
    tempLabel.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeXL)];
    tempLabel.frame        = CGRectMake(_picker.frame.origin.x,
                                        _picker.frame.origin.y + _picker.frame.size.height,
                                        pickerWidth,
                                        40);
    [self.view addSubview: tempLabel];
    
    XFNButton* pickerButton = [XFNButton buttonWithType: UIButtonTypeCustom];
    pickerButton.frame            = tempLabel.frame;
    pickerButton.customizedLabel  = tempLabel;
    
    pickerButton.assetPropertyName= button.assetPropertyName; //po 20151207 通过该property传递参数
    pickerButton.parameter        = button;
    
    [self.view addSubview: pickerButton];
    
    [pickerButton addTarget:self action:@selector(pickerButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pickerButtonPressed: (id)sender
{
    XFNButton* pickerButton     = (XFNButton*)sender;
    
    UILabel*   label            = pickerButton.customizedLabel;
    NSString*  propertyName     = pickerButton.assetPropertyName;
    XFNButton* originButton     = (XFNButton*) pickerButton.parameter;
    
    NSInteger row      = [_picker selectedRowInComponent: 0];
    NSString *selected = [_pickViewArray   objectAtIndex: row];
    
    [_detailModel setObject: selected forKey: propertyName];
    
    //更新原显示内容
    originButton.customizedLabel.text = selected;
    
    //关闭Picker，remove subview
    [pickerButton  removeFromSuperview];
    [label         removeFromSuperview];
    [_picker       removeFromSuperview];
    //picker对象由ARC自动释放，必须设为nil，否则多个选择器重复（在第一个没有按“确定”关闭的情况下开了第二个，会导致系统异常）
    _picker = nil;
}

- (void)initPickViewArrayByPropertyName: (NSString*) propertyName
{
    if(nil != _pickViewArray)
    {
        //po 20151209，当_pickViewArray被一个NSArray赋值的时候，其属性会被改成NSArrayI，而不是可修改的NSArrayM
        //因此，简单的使用removeAllObjects方法会导致方法无法识别而抛出系统异常
        //解决的办法是直接将其赋值为nil，而原来的对象由ARC释放（若无别处引用）
        //[_pickViewArray removeAllObjects];
        _pickViewArray = nil;
    }
    
    if([propertyName isEqualToString:@"assetStatus"])
    {
        _pickViewArray = (NSMutableArray*)[XFNWorkTableViewController getlabelsForAssetStatusGlobalArray];
    }
    else if([propertyName isEqualToString: @"reserveMode"])
    {
        _pickViewArray = [NSMutableArray arrayWithObjects: @"有钥匙", @"借钥匙", @"预约", nil];
    }
    else if([propertyName isEqualToString: @"deliveryMode"])
    {
        _pickViewArray = [NSMutableArray arrayWithObjects: @"空置", @"业主住", @"租客住", @"装修中", nil];
    }
    else if([propertyName isEqualToString: @"_contactIdentity_"])
    {
        _pickViewArray = [NSMutableArray arrayWithObjects: @"业主", @"家人", @"亲友", @"租客", @"其他", nil];
    }
    else
    {
        DLog(@"ERROR：出现这个问题是因为选择器的输入参数有误，以至于无法生成选择器列表数组");
    }
}

#pragma mark PickView delegate & datasource
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件包含多少列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 1;
}
// UIPickerViewDataSource中定义的方法，该方法的返回值决定该控件指定列包含多少个列表项
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickViewArray.count;
}
// UIPickerViewDelegate中定义的方法，该方法返回的UIView将作为UIPickerView
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view
{
    //return [_pickViewArray objectAtIndex:row];
    
    UILabel *pickerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, _Macro_PickerViewWidth, _Macro_PickerViewHeight/2)];
    
    pickerLabel.text = [_pickViewArray objectAtIndex:row];
    
    pickerLabel.textAlignment = NSTextAlignmentCenter;
    
    pickerLabel.textColor = [UIColor blackColor];
    
    pickerLabel.font = [UIFont systemFontOfSize:XFNDetailTableViewCellFontSizeDefault];
    
    pickerLabel.backgroundColor = [UIColor clearColor];
    
    return pickerLabel;
}

#pragma mark UITextFieldDelegate
//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 216.0);//键盘高度216
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.view.frame = CGRectMake(0.0f, -offset, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView commitAnimations];
}

//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

//输入框编辑完成以后，将视图恢复到原始状态
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.view.frame =CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

@end

//-----------------------------------------------------------------------------------------
@implementation XFNTextField

- (void)setAssetPropertyName:(NSString *)assetPropertyName
{
    _assetPropertyName = assetPropertyName;
}

- (void)setParameter:(id)parameter
{
    _parameter = parameter;
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

- (void)setParameter:(id)parameter
{
    _parameter = parameter;
}

@end





