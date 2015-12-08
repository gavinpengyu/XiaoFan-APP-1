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
    
//    XFNTextField* valueText= [[XFNTextField alloc] init];
//    valueText.text         = value;  //attributedPlaceholder
//    valueText.textColor    = [UIColor blackColor];
//    valueText.textAlignment= NSTextAlignmentLeft;
//    valueText.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeXL)];
//    
//    CGSize  valueTextSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
//    valueTextSize.width    = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing)/2;
//    CGFloat valueTextX     = _Macro_ScreenWidth - XFNTableViewCellControlSpacing - valueTextSize.width;
//    CGFloat valueTextY     = titleLabel.frame.origin.y - (valueTextSize.height - titleLabel.frame.size.height)/2;
//    CGRect  valueTextRect  = CGRectMake(valueTextX,
//                                        valueTextY,
//                                        valueTextSize.width,
//                                        valueTextSize.height);
//    valueText.frame        = valueTextRect;
//    
//    [self addSubview: valueText];
//    
//    valueText.assetPropertyName = name;//po 20151207 通过该property传递参数
//    [valueText addTarget : self action : @selector (valueChanged:) forControlEvents : (UIControlEventEditingDidEnd | UIControlEventEditingDidEndOnExit)];
    
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

- (CGRect)initLabelViewWithArray: (NSArray*) array andOriginY: (CGFloat) originY
{
    NSArray *fullArray;// = [XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray];//读出所有的、可用的房源标签，这个标签列表在服务器侧维护
    
    if ([[XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray] containsObject: [array firstObject]])
    {
        fullArray = [XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray];
    }
    else if ([[XFNWorkTableViewController getlabelsForTypeOfPayGlobalArray] containsObject: [array firstObject]]
             || [[XFNWorkTableViewController getlabelsForTaxInfoGlobalArray] containsObject: [array firstObject]])
    {
        //付款信息和税费信息在交易cell中一并处理
        NSArray* temp = [[XFNWorkTableViewController getlabelsForTypeOfPayGlobalArray]
                          arrayByAddingObjectsFromArray:
                         [XFNWorkTableViewController getlabelsForTaxInfoGlobalArray]];
        fullArray = temp;
    }
    else if ([[XFNWorkTableViewController getlabelsForDecorationInfoGlobalArray] containsObject: [array firstObject]]
             || [[XFNWorkTableViewController getlabelsForAncillaryInfoGlobalArray] containsObject: [array firstObject]])
    {
        //装修信息和配套信息在装修配套cell中一并处理
        NSArray* temp = [[XFNWorkTableViewController getlabelsForDecorationInfoGlobalArray]
                         arrayByAddingObjectsFromArray:
                         [XFNWorkTableViewController getlabelsForAncillaryInfoGlobalArray]];
        fullArray = temp;
    }
    else
    {
        DLog(@"ERROR: initLabelViewWithArray,输入数组元素%@非法，这是因为遍历数组类型的时候不全面", [array firstObject]);
        return CGRectMake(0,0,0,0);
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
        if ((0 ==  iFullArrayIndex % 5) && (0 != iFullArrayIndex))
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
    if (0 == (iFullArrayIndex - 1) % 5)
    {
        tempLabelY = tempLabelY - (_Macro_AssetLabel_Height + _Macro_AssetLabel_Space);
    }
    return CGRectMake(0, originY, _Macro_ScreenWidth, tempLabelY + _Macro_AssetLabel_Height + _Macro_AssetLabel_Space);
}

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
    if ([tempText.assetPropertyName isEqualToString: @"assetUnitPrice"])
    {
        [self unionBetweenUnitPriceAndTotalPriceByTextField: tempText];
    }
    
    [_cellModel setObject: tempText.text forKey: tempText.assetPropertyName];
    
    DLog(@"%@修改为：%@", tempText.assetPropertyName, tempText.text);
}

- (void)unionBetweenUnitPriceAndTotalPriceByTextField: (XFNTextField*) text
{
    NSInteger totalPrice = [text.text integerValue] * [[_cellModel objectForKey: @"assetTotalArea"] integerValue] / 10000;
    
    NSString* string     = [NSString stringWithFormat:@"%ld", totalPrice];
    
    [_cellModel setObject: string forKey: @"assetTotalPrice"];
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
        [self insertLabel: button.customizedLabel.text];
        
    }
    //已选中状态
    else if ([XFNWorkTableViewCell getTheColorOfLabel: button.customizedLabel.text] == button.customizedLabel.textColor)
    {
        //取消选中
        button.customizedLabel.textColor         = [UIColor grayColor];
        button.customizedLabel.layer.borderColor = [UIColor grayColor].CGColor;
        [self removeLabel: button.customizedLabel.text];
    }
    else
    {
        DLog(@"ERROR:出现这个错误，意味着标签在修改颜色的时候，有部分代码没有同步，导致无法判断选中状态，%@", button.customizedLabel.text);
    }
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
//-----------------------------------------------------------------------------------
-(void)insertLabel: (NSString*) label
{
    NSString* assetModelPropertyName = [XFNWorkTableViewCell getThePropertyNameOfLabel: label];
    
    NSString* labelString            = [self.cellModel objectForKey: assetModelPropertyName];
    
    NSMutableArray*  labelArray      = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    if (![labelArray containsObject: label])
    {
        [labelArray addObject: label];
    }
    
    NSString* tempString = [XFNFrameAssetModel initStringByAssetArray: labelArray];
    
    [self.cellModel setObject: tempString forKey: assetModelPropertyName];
    
    return;
}

-(void)removeLabel: (NSString*) label
{
    NSString* assetModelPropertyName = [XFNWorkTableViewCell getThePropertyNameOfLabel: label];
    
    NSString* labelString            = [self.cellModel objectForKey: assetModelPropertyName];
    
    NSMutableArray*  labelArray      = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    if ([labelArray containsObject: label])
    {
        [labelArray removeObject: label];
    }
    
    NSString* tempString = [XFNFrameAssetModel initStringByAssetArray: labelArray];
    
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
    
    if ([propertyName isEqualToString: @"assetUnitPrice"])
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
    
    DLog(@"ERROR: 找不到Asset属性对应字符串，property name＝%@", propertyName);
    return nil;
}



@end
