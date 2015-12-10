//
//  XFNAssetEditView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditView.h"
#import "XFNAssetEditViewController.h"
#import "XFNWorkTableViewController.h" //需使用getlabelsForAssetLayoutInfoGlobalArray方法
#import "XFNWorkTableViewCell.h" //需使用getTheColorOfLabel方法

#define _Macro_AssetLabel_Height 30
#define _Macro_AssetLabel_Width  60
#define _Macro_AssetLabel_Space  14

//-----------------------------------------------------------------------------------------
@implementation XFNAssetEditView
{
    XFNTextField* _assetTotalPriceForUnionOperation;
    XFNTextField* _assetUnitPriceForUnionOperation;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)setCellModel:(XFNFrameAssetModel *)cellModel
{
    _cellModel = cellModel;
}

#pragma mark init method
//-----------------------------------------------------------------------------------
- (CGRect)initTitleWithName: (NSString*) titleName
                 andOriginY: (CGFloat) originY
{
    UILabel *titleLabel   = [[UILabel alloc] init];
    titleLabel.text       = titleName;
    titleLabel.textColor  = [UIColor grayColor];
    titleLabel.font       = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview: titleLabel];
    
    CGFloat titleLabelX     = XFNTableViewCellControlSpacing;
    CGFloat titleLabelY     = originY; //po 20151207 不知为何，必须在这里手动去除导航View的顶端部分
    CGSize  titleLabelSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
    CGRect  titleLabelRect  = CGRectMake(titleLabelX,
                                         titleLabelY,
                                         titleLabelSize.width,
                                         titleLabelSize.height);
    titleLabel.frame       = titleLabelRect;
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               titleLabelY + titleLabelSize.height + XFNTableViewCellControlSpacing,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    return CGRectMake(titleLabelX,
                      titleLabelY,
                      _Macro_ScreenWidth,
                      (gridHorizontalLine.frame.origin.y - titleLabelY));
}

//-----------------------------------------------------------------------------------
- (CGRect)initContentTextFieldWithName: (NSString*) name
                              andValue: (NSString*) value
                            andOriginY: (CGFloat) originY
                       andKeyboardType: (UIKeyboardType) keyboardType
{
    //-----------------------------------------------------------------------------------
    UILabel *titleLabel   = [[UILabel alloc] init];
    titleLabel.text       = [self getContentNameFromAssetPropertyName: name];
    titleLabel.textColor  = [UIColor grayColor];
    titleLabel.font       = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    
    CGFloat titleLabelX     = XFNTableViewCellControlSpacing;
    CGFloat titleLabelY     = originY + XFNTableViewCellControlSpacing;
    CGSize  titleLabelSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
    CGRect  titleLabelRect  = CGRectMake(titleLabelX,
                                         titleLabelY,
                                         titleLabelSize.width,
                                         titleLabelSize.height);
    titleLabel.frame       = titleLabelRect;
    
    [self addSubview: titleLabel];
    
    //-----------------------------------------------------------------------------------
    XFNTextField* valueText= [[XFNTextField alloc] init];
    valueText.text         = value;  //attributedPlaceholder
    valueText.textColor    = [UIColor blackColor];
    valueText.textAlignment= NSTextAlignmentLeft;
    valueText.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeXL)];
    valueText.keyboardType = keyboardType;

    CGSize  valueTextSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
    valueTextSize.width    = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing)/2;
    CGFloat valueTextX     = _Macro_ScreenWidth - XFNTableViewCellControlSpacing - valueTextSize.width;
    CGFloat valueTextY     = titleLabel.frame.origin.y - (valueTextSize.height - titleLabel.frame.size.height)/2;
    CGRect  valueTextRect  = CGRectMake(valueTextX,
                                        valueTextY,
                                        valueTextSize.width,
                                        valueTextSize.height);
    valueText.frame        = valueTextRect;
    
    [self addSubview: valueText];
    
    valueText.assetPropertyName = name;//po 20151207 通过该property传递参数
    [valueText addTarget : self action : @selector (valueChanged:) forControlEvents : (UIControlEventEditingDidEnd | UIControlEventEditingDidEndOnExit)];
    
    //总价与单价联动----------------------------------------------------------------------------
    //在selector中，如果修改了总价或者单价中的某一个，另一个要同时改变其text值
    if ([name isEqualToString: @"assetUnitPrice"])
    {
        _assetUnitPriceForUnionOperation = valueText;
    }
    if ([name isEqualToString: @"assetTotalPrice"])
    {
        _assetTotalPriceForUnionOperation = valueText;
    }
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (valueText.frame.origin.x,
                                                                               (valueText.frame.origin.y + valueText.frame.size.height + _Macro_XFNWorTableViewCellHorizontalSeperatorHeight),
                                                                               valueText.frame.size.width,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    return CGRectMake(0,
                      originY,
                      _Macro_ScreenWidth,
                      gridHorizontalLine.frame.origin.y - originY + XFNTableViewCellControlSpacing);
}

//-----------------------------------------------------------------------------------
- (CGRect)initCustomizeTextFieldWithName: (NSString*) name
                              andOriginY: (CGFloat) originY
{
//    CGRect titleRect = [self initTitleWithName: [self getContentNameFromAssetPropertyName: name]
//                                    andOriginY: originY];
    
    //-----------------------------------------------------------------------------------
    XFNTextField* valueText= [[XFNTextField alloc] init];
    valueText.placeholder  = @"自定义标签，二到五个汉字";
    valueText.textColor    = [UIColor blackColor];
    valueText.textAlignment= NSTextAlignmentLeft;
    valueText.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    valueText.keyboardType = UIKeyboardTypeDefault;
    
    valueText.layer.borderWidth = 1;
    valueText.layer.cornerRadius= 5;
    
    CGSize  valueTextSize  = [valueText.text sizeWithAttributes : @{NSFontAttributeName : valueText.font}];
    valueTextSize.width    = _Macro_AssetLabel_Width * 3;//(_Macro_ScreenWidth - XFNTableViewCellControlSpacing)/2;
    valueTextSize.height   = _Macro_AssetLabel_Height;//valueTextSize.height + 2;
    CGFloat valueTextX     =  XFNTableViewCellControlSpacing; //titleRect.origin.x;
    CGFloat valueTextY     =  originY;//titleRect.origin.y + titleRect.size.height + XFNTableViewCellControlSpacing;
    CGRect  valueTextRect  = CGRectMake(valueTextX,
                                        valueTextY,
                                        valueTextSize.width,
                                        valueTextSize.height);
    valueText.frame        = valueTextRect;
    
    [self addSubview: valueText];
    
    //若该TextField有可能被弹出的软键盘覆盖，则设置delegate；键盘高度为216，为了视觉效果，多留两个space
    if (valueText.frame.origin.y > (self.frame.size.height - 216.0 - XFNTableViewCellControlSpacing * 2))
    {
        valueText.delegate     = self;
    }
    else //TextField不会被弹出的软键盘覆盖，则不能设置delegate，否则有可能被弹出到屏幕上方不可见部分
    {
    
    }
    
    valueText.assetPropertyName = name;//po 20151207 通过该property传递参数
    
    UILabel* tempLabel        = [[UILabel alloc] init];
    tempLabel.text            = @"添加";
    tempLabel.textColor       = [UIColor blackColor];
    tempLabel.textAlignment   = NSTextAlignmentCenter;
    tempLabel.font            = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    
    tempLabel.layer.borderWidth = 1;
    tempLabel.layer.cornerRadius= 5;
    
    CGSize  tempLabelSize  = [tempLabel.text sizeWithAttributes : @{NSFontAttributeName : tempLabel.font}];
    tempLabelSize.width    = _Macro_AssetLabel_Width;
    tempLabelSize.height   = valueTextSize.height;
    CGFloat tempLabelX     = _Macro_ScreenWidth - XFNTableViewCellControlSpacing - tempLabelSize.width;
    CGFloat tempLabelY     = valueText.frame.origin.y + valueText.frame.size.height - tempLabelSize.height;
    CGRect  tempLabelRect  = CGRectMake(tempLabelX,
                                        tempLabelY,
                                        tempLabelSize.width,
                                        tempLabelSize.height);
    tempLabel.frame        = tempLabelRect;
    
    [self addSubview: tempLabel];

    //po 20151208 label负责显示，button覆盖在label上负责响应，button完全透明
    XFNButton* button       = [XFNButton buttonWithType: UIButtonTypeCustom];
    button.frame            = tempLabel.frame;
    button.customizedLabel  = tempLabel;
    button.assetPropertyName= valueText.assetPropertyName; //po 20151207 通过该property传递参数
    button.parameter        = valueText;//po 20151210,在action里面要读取Text里面的文字，并清空输入框
    
    [self addSubview: button];
    
    [button addTarget : self action : @selector (toAddCustomizedLabel:) forControlEvents : UIControlEventTouchDown];
    
    return CGRectMake(0,
                      originY,
                      _Macro_ScreenWidth,
                      valueText.frame.origin.y + valueText.frame.size.height + XFNTableViewCellControlSpacing - originY);
}

//-----------------------------------------------------------------------------------
- (CGRect)initContentPickerButtonWithName: (NSString*) name
                                 andValue: (NSString*) value
                               andOriginY: (CGFloat) originY
{
    //-----------------------------------------------------------------------------------
    UILabel *titleLabel   = [[UILabel alloc] init];
    titleLabel.text       = [self getContentNameFromAssetPropertyName: name];
    titleLabel.textColor  = [UIColor grayColor];
    titleLabel.font       = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    
    CGFloat titleLabelX     = XFNTableViewCellControlSpacing;
    CGFloat titleLabelY     = originY + XFNTableViewCellControlSpacing;
    CGSize  titleLabelSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
    CGRect  titleLabelRect  = CGRectMake(titleLabelX,
                                         titleLabelY,
                                         titleLabelSize.width,
                                         titleLabelSize.height);
    titleLabel.frame       = titleLabelRect;
    
    [self addSubview: titleLabel];
    
    //-----------------------------------------------------------------------------------
    UILabel* tempLabel     = [[UILabel alloc] init];
    tempLabel.text         = value;
    tempLabel.textColor    = [UIColor blackColor];
    tempLabel.textAlignment= NSTextAlignmentLeft;
    tempLabel.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeXL)];
    
    CGSize  tempLabelSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
    tempLabelSize.width    = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing)/2;
    CGFloat tempLabelX     = _Macro_ScreenWidth - XFNTableViewCellControlSpacing - tempLabelSize.width;
    CGFloat tempLabelY     = titleLabel.frame.origin.y - (tempLabelSize.height - titleLabel.frame.size.height)/2;
    CGRect  tempLabelRect  = CGRectMake(tempLabelX,
                                        tempLabelY,
                                        tempLabelSize.width,
                                        tempLabelSize.height);
    tempLabel.frame        = tempLabelRect;
    
    [self addSubview: tempLabel];

    //po 20151208 label负责显示，button覆盖在label上负责响应，button完全透明
    XFNButton* button       = [XFNButton buttonWithType: UIButtonTypeCustom];
    button.frame            = tempLabel.frame;
    button.customizedLabel  = tempLabel;
    button.assetPropertyName= name; //po 20151207 通过该property传递参数
    
    [self addSubview: button];
    
    [button addTarget : self action : @selector (activatePickerViewWithButton:) forControlEvents : UIControlEventTouchDown];
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (button.frame.origin.x,
                                                                               (button.frame.origin.y + button.frame.size.height + _Macro_XFNWorTableViewCellHorizontalSeperatorHeight),
                                                                               button.frame.size.width,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    return CGRectMake(0,
                      originY,
                      _Macro_ScreenWidth,
                      gridHorizontalLine.frame.origin.y - originY + XFNTableViewCellControlSpacing);
}

//-----------------------------------------------------------------------------------
- (void)initFooterWithOriginY: (CGFloat) originY andCellIndex: (XFNDetailViewCellIndexEnum)cellIndex
{
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               originY,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    UILabel * submitLabel     = [[UILabel alloc] init];
    submitLabel.text          = @"提交";
    submitLabel.textAlignment = NSTextAlignmentCenter;
    submitLabel.textColor     = [UIColor blueColor];
    submitLabel.backgroundColor = [UIColor lightGrayColor];
    submitLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    
    CGFloat submitLabelY      = gridHorizontalLine.frame.origin.y + XFNTableViewCellControlSpacing;
    CGFloat submitLabelX      = gridHorizontalLine.frame.origin.x;
    CGSize  submitLabelSize   = [submitLabel.text sizeWithAttributes : @{NSFontAttributeName : submitLabel.font}];
    submitLabelSize.width     = _Macro_ScreenWidth - XFNTableViewCellControlSpacing*2;
    submitLabelSize.height    = submitLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  submitLabelRect   = CGRectMake(submitLabelX,
                                           submitLabelY,
                                           submitLabelSize.width,
                                           submitLabelSize.height);
    
    submitLabel.frame         = submitLabelRect;
    [self addSubview: submitLabel];
    
    XFNButton* submit          = [XFNButton buttonWithType: UIButtonTypeCustom];
    submit.frame               = submitLabel.frame;
    submit.cellIndex           = cellIndex;
    [self addSubview: submit];
    
    [submit addTarget : self action : @selector (submitAndBack:) forControlEvents : UIControlEventTouchDown];
}

- (CGRect)initLabelViewWithArray: (NSArray*) array andOriginY: (CGFloat) originY andPropertyName: (NSString*) name
{
    NSArray *fullArray;// = [XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray];//读出所有的、可用的房源标签，这个标签列表在服务器侧维护
    
    //po 2015110: 当一个标签都没有的时候，无法通过标签获取其类型，此时判断propertyName
    if ([[XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray] containsObject: [array firstObject]]
        || [name isEqualToString: @"basicInfoLabelsOfAsset"])
    {
        fullArray = [XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray];
    }
    else if ([[XFNWorkTableViewController getlabelsForTypeOfPayGlobalArray] containsObject: [array firstObject]]
             || [name isEqualToString: @"typeOfPaying"])
    {
        fullArray = [XFNWorkTableViewController getlabelsForTypeOfPayGlobalArray];
    }
    else if ([[XFNWorkTableViewController getlabelsForTaxInfoGlobalArray] containsObject: [array firstObject]]
             || [name isEqualToString: @"taxInfo"])
    {
        fullArray = [XFNWorkTableViewController getlabelsForTaxInfoGlobalArray];
    }
    else if ([[XFNWorkTableViewController getlabelsForDecorationInfoGlobalArray] containsObject: [array firstObject]]
             || [name isEqualToString: @"decorationInfo"])
    {
        fullArray = [XFNWorkTableViewController getlabelsForDecorationInfoGlobalArray];
    }
    else if ([[XFNWorkTableViewController getlabelsForAncillaryInfoGlobalArray] containsObject: [array firstObject]]
             || [name isEqualToString: @"ancillaryInfo"])
    {
        fullArray = [XFNWorkTableViewController getlabelsForAncillaryInfoGlobalArray];
    }
    else
    {
        DLog(@"Warning: initLabelViewWithArray,输入数组元素 %@ 不在已设定标签组范围内，这是因为遍历数组类型的时候不全面", [array firstObject]);
        fullArray = array;
    }
    
    CGFloat originX = XFNTableViewCellControlSpacing;
    
    CGFloat tempLabelX   = originX;
    CGFloat tempLabelY   = originY + XFNTableViewCellControlSpacing;
    
    int iFullArrayIndex = 0;
    
    for (iFullArrayIndex = 0; iFullArrayIndex < fullArray.count; iFullArrayIndex++)
    {
        UILabel * tempLabel           = [[UILabel alloc] init];
        tempLabel.text                = fullArray[iFullArrayIndex];
        tempLabel.layer.borderWidth   = 1;
        tempLabel.layer.cornerRadius  = 5;
        tempLabel.textAlignment       = NSTextAlignmentCenter;
        
        tempLabel.font                = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
        CGSize  tempSize              = [tempLabel.text sizeWithAttributes : @{NSFontAttributeName : tempLabel.font}];
        if (tempSize.width > _Macro_AssetLabel_Width)
        {
            tempLabel.font            = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
        }
        tempLabel.frame               = CGRectMake(tempLabelX, tempLabelY, _Macro_AssetLabel_Width, _Macro_AssetLabel_Height);
        [self addSubview: tempLabel];
        
        //po 20151208 label负责显示，button覆盖在label上负责响应，button完全透明
        XFNButton* button       = [XFNButton buttonWithType: UIButtonTypeCustom];
        button.frame            = tempLabel.frame;
        button.customizedLabel  = tempLabel;
        button.assetPropertyName= name;
        
        [self addSubview: button];
        [button addTarget : self action : @selector (labelChanged:) forControlEvents : UIControlEventTouchDown];
        
        //如果该标签已被选中
        if ([array containsObject: fullArray[iFullArrayIndex]])
        {
            tempLabel.textColor         = [XFNWorkTableViewCell getTheColorOfLabel: fullArray[iFullArrayIndex]];
            tempLabel.layer.borderColor = [XFNWorkTableViewCell getTheColorOfLabel: fullArray[iFullArrayIndex]].CGColor;
        }
        else
        {
            tempLabel.textColor         = [UIColor grayColor];
            tempLabel.layer.borderColor = [UIColor grayColor].CGColor;
        }

        //每行放5个标签，超过该值则换行
        if ((0 == (iFullArrayIndex + 1) % 5) && (0 != iFullArrayIndex))
        {
            tempLabelY = tempLabelY + _Macro_AssetLabel_Height + _Macro_AssetLabel_Space;
            tempLabelX = originX;
        }
        else
        {
            tempLabelY = tempLabelY;
            tempLabelX = tempLabelX + _Macro_AssetLabel_Width + _Macro_AssetLabel_Space;
        }
    }
    
    //若for循环中刚好是5个标签，则labelY的值需要修正
    //if (0 == (iFullArrayIndex - 1) % 5)
    if (0 == (iFullArrayIndex ) % 5)
    {
        tempLabelY = tempLabelY - (_Macro_AssetLabel_Height + _Macro_AssetLabel_Space);
    }
    return CGRectMake(0, originY, _Macro_ScreenWidth, (tempLabelY + _Macro_AssetLabel_Height + _Macro_AssetLabel_Space - originY));
}

//- (void) reloadButton: (XFNButton*) button TextByNSString: (NSString*) textString
//{
//    button
//}

//在子类中会重写该方法，不能删除 po 20151207
- (void)layoutViews
{
    
}

#pragma mark datasouce
//-----------------------------------------------------------------------------------
- (void)setModel: (XFNFrameAssetModel*) model
{
    _cellModel = model;
}

#pragma mark UITextFieldDelegate 对于可能被软键盘遮挡的TextField，自动上移整个view
//-----------------------------------------------------------------------------------
//开始编辑输入框的时候，软键盘出现，执行此事件
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.frame.size.height - 216.0 - XFNTableViewCellControlSpacing * 2);//键盘高度216，多留两个space保证美观
    
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
    if(offset > 0)
        self.frame = CGRectMake(0.0f, -offset, self.frame.size.width, self.frame.size.height);
    
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
    self.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark selector
//-----------------------------------------------------------------------------------
-(void) valueChanged:(id)sender
{
    if ([self isFirstResponder])
    {
        [self resignFirstResponder]; //输入完毕后，关闭键盘空间控件  [self.view endEditing:YES];
    }
    
    //[self endEditing:YES];
    
    XFNTextField* tempText = (XFNTextField*)sender;
    
    //po 20151208 单价与总价联动
    if ([tempText.assetPropertyName isEqualToString: @"assetUnitPrice"]
        || [tempText.assetPropertyName isEqualToString: @"assetTotalPrice"])
    {
        [self unionBetweenUnitPriceAndTotalPriceByTextField: tempText];
    }
    
    [_cellModel setObject: tempText.text forKey: tempText.assetPropertyName];
    
    DLog(@"%@修改为：%@", tempText.assetPropertyName, tempText.text);
}

- (void)unionBetweenUnitPriceAndTotalPriceByTextField: (XFNTextField*) text
{
    if (nil == text)
    {
        return;
    }
    
    if([text.assetPropertyName isEqualToString: @"assetUnitPrice"])
    {
        NSInteger totalPrice = [text.text integerValue] * [[_cellModel objectForKey: @"assetTotalArea"] integerValue] / 10000;
        
        NSString* string     = [NSString stringWithFormat:@"%ld", totalPrice];
        
        _assetTotalPriceForUnionOperation.text = string;
        
        [_cellModel setObject: string forKey: @"assetTotalPrice"];
        
        return;
    }
    
    if([text.assetPropertyName isEqualToString: @"assetTotalPrice"])
    {
        NSInteger unitPrice = [text.text integerValue] * 10000 / [[_cellModel objectForKey: @"assetTotalArea"] integerValue];
        
        NSString* string    = [NSString stringWithFormat:@"%ld", unitPrice];
        
        _assetUnitPriceForUnionOperation.text = string;
        
        return;
    }
}

-(void)labelChanged:(id)sender
{
    XFNButton* button = (XFNButton*) sender;
    
    //处于未选中状态
    if ([UIColor grayColor] == button.customizedLabel.textColor)
    {
        //选中
        button.customizedLabel.textColor         = [XFNWorkTableViewCell getTheColorOfLabel: button.customizedLabel.text];
        button.customizedLabel.layer.borderColor = [XFNWorkTableViewCell getTheColorOfLabel: button.customizedLabel.text].CGColor;
        [self insertLabel: button.customizedLabel.text andPropertyName: button.assetPropertyName];
        
    }
    //已选中状态
    else if ([XFNWorkTableViewCell getTheColorOfLabel: button.customizedLabel.text] == button.customizedLabel.textColor)
    {
        //取消选中
        button.customizedLabel.textColor         = [UIColor grayColor];
        button.customizedLabel.layer.borderColor = [UIColor grayColor].CGColor;
        [self removeLabel: button.customizedLabel.text andPropertyName: button.assetPropertyName];
    }
    else
    {
        DLog(@"ERROR:出现这个错误，意味着标签在修改颜色的时候，有部分代码没有同步，导致无法判断选中状态，%@", button.customizedLabel.text);
    }
}

-(void) toAddCustomizedLabel:(id)sender
{
    XFNButton* button = (XFNButton*) sender;
    XFNTextField* text= (XFNTextField*)button.parameter;
    
    //这是一条房源标签
    if ([button.assetPropertyName isEqualToString: @"basicInfoLabelsOfAsset"])
    {
    
    }//这是一条配套标签
    else if (([button.assetPropertyName isEqualToString: @"decorationInfo"])
             || [button.assetPropertyName isEqualToString: @"ancillaryInfo"])
    {
    
    }//这是一条联系人标签
    else if ([button.assetPropertyName isEqualToString: _Macro_CUSTOMIZED_LABEL_string])
    {
    
    }
    else
    {
        DLog(@"WARNING: 添加自定义标签，无法解析这个标签的类型，sender.txt=%@", text.text);
    }
    
    //将自定义标签写入数组
    
    //在view中，自定义标签行的位置的下方插入“自定义标签”
    
    //将自定义标签行向下移动
    DLog(@"toAddCustomizedLabel");
    DLog(@"sender.txt=%@", text.text);
    
    //添加标签后，恢复text为空白状态
    text.text=nil;
    //若没有在键盘上点击“回车”，则在此时手动关闭键盘
    [text resignFirstResponder];
}

-(void) submitAndBack:(id)sender
{
    XFNButton* submit = (XFNButton*) sender;
    
    [self.delegate toBackAndSubmitObject : _cellModel withCellIndex: submit.cellIndex];
}

-(void) activatePickerViewWithButton:(id)sender
{
    XFNButton* button = (XFNButton*) sender;
    
    [self.delegate toActivatePickViewWithXFNButton : button];
}

#pragma mark other assistant method
//po 20151210:如果需要插入的是自定义标签，则必须对name赋值；对于系统已定义的标签，函数自动获取属性名
//-----------------------------------------------------------------------------------
-(void)insertLabel: (NSString*) label andPropertyName: (NSString*) name
{
    NSString* assetModelPropertyName;
    
    if (nil == name)
    {
        assetModelPropertyName = [XFNWorkTableViewCell getThePropertyNameOfLabel: label];
    }
    else
    {
        assetModelPropertyName = name;
    }
    
    NSString* labelString            = [self.cellModel objectForKey: assetModelPropertyName];
    
    //如果当前房源一个标签都没有，那么获取到的值为空，所以把待添加的label直接赋值
    if (nil == labelString)
    {
        labelString = label;
    }
    
    NSMutableArray*  labelArray      = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    if (![labelArray containsObject: label])
    {
        [labelArray addObject: label];
    }
    
    NSString* tempString = [XFNFrameAssetModel initStringByAssetArray: labelArray];
    
    [self.cellModel setObject: tempString forKey: assetModelPropertyName];
    
    return;
}
//po 20151210:如果需要插入的是自定义标签，则必须对name赋值；对于系统已定义的标签，函数自动获取属性名
-(void)removeLabel: (NSString*) label andPropertyName: (NSString*) name
{
    NSString* assetModelPropertyName;
    
    if (nil == name)
    {
        assetModelPropertyName = [XFNWorkTableViewCell getThePropertyNameOfLabel: label];
    }
    else
    {
        assetModelPropertyName = name;
    }
    
    NSString* labelString            = [self.cellModel objectForKey: assetModelPropertyName];
    
    NSMutableArray*  labelArray      = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    if ([labelArray containsObject: label])
    {
        [labelArray removeObject: label];
    }
    
    NSString* tempString;
    //如果要删除的是最后一个标签，则删除后array为空
    if (0 == labelArray.count)
    {
        tempString = nil;
    }
    else
    {
        tempString = [XFNFrameAssetModel initStringByAssetArray: labelArray];
    }

    [self.cellModel setObject: tempString forKey: assetModelPropertyName];
    
    return;
}

- (NSString*) getContentNameFromAssetPropertyName: (NSString*) propertyName
{
    NSString* temp = [[NSString alloc] init];
    
    //-----------------------------------------------------------------------------------
    if ([propertyName isEqualToString: @"assetTotalArea"])
    {
        temp = @"面积（平米）:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"assetSharedArea"])
    {
        temp = @"分摊（平米）:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"quantityOfRoom"])
    {
        temp = @"房间数:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"quantityOfToilet"])
    {
        temp = @"卫生间数:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"assetStorey"])
    {
        temp = @"楼层:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"storeyOfAll"])
    {
        temp = @"总楼层:";
        return temp;
    }
    
    //-----------------------------------------------------------------------------------
    if ([propertyName isEqualToString: @"assetTotalPrice"])
    {
        temp = @"总价（万元）:";
        return temp;
    }
    
    if ([propertyName isEqualToString: _Macro_ASSET_UNIT_PRICE_string])
    {
        temp = @"单价（元/平米）:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"assetStatus"])
    {
        temp = @"状态:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"attributeTo"])
    {
        temp = @"归属:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"reserveMode"])
    {
        temp = @"看房方式:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"deliveryMode"])
    {
        temp = @"交房方式:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"reserveRemark"])
    {
        temp = @"看房备注:";
        return temp;
    }
    
    if ([propertyName isEqualToString: @"deliveryRemark"])
    {
        temp = @"交房备注:";
        return temp;
    }
    
    if ([propertyName isEqualToString: _Macro_CONTACT_NAME_string])
    {
        temp = @"称呼:";
        return temp;
    }
    
    if ([propertyName isEqualToString: _Macro_CONTACT_IDENTITY_string])
    {
        temp = @"身份:";
        return temp;
    }
    
    if ([propertyName isEqualToString: _Macro_CONTACT_PHONE_string])
    {
        temp = @"电话:";
        return temp;
    }
    
    if ([propertyName isEqualToString: _Macro_CUSTOMIZED_LABEL_string])
    {
        temp = @"自定义标签";
        return temp;
    }
    
    DLog(@"ERROR: 找不到Asset属性对应字符串，property name＝%@", propertyName);
    return nil;
}

@end
