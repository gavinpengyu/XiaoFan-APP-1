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
#import "XFNWorkTableViewController.h"

#define _Macro_AssetLabel_Height 30
#define _Macro_AssetLabel_Width  60
#define _Macro_AssetLabel_Space  14

//-----------------------------------------------------------------------------------------
@implementation XFNTextField

@end

@implementation XFNButton

- (void)setCustomizedLabel:(UILabel *)customizedLabel
{
    _customizedLabel = customizedLabel;
}

@end

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
- (CGRect)initContentWithName: (NSString*) name
                     andValue: (NSString*) value
                   andOriginY: (CGFloat) originY
              andKeyboardType: (UIKeyboardType) keyboardType
{
    //-----------------------------------------------------------------------------------
    UILabel *titleLabel   = [[UILabel alloc] init];
    titleLabel.text       = [self getContectNameFromAssetPropertyName: name];
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
    [valueText addTarget : self action : @selector (valueChanged:) forControlEvents : UIControlEventEditingDidEndOnExit];
    
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
    NSArray *fullArray = [XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray];//读出所有的、可用的房源标签，这个标签列表在服务器侧维护
    
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               originY,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor redColor];
    [self addSubview: gridHorizontalLine];
    
    CGFloat originX = XFNTableViewCellControlSpacing;
    
    CGFloat labelX   = originX;
    CGFloat labelY   = originY;
    
    int iFullArrayIndex = 0;
    
    for (iFullArrayIndex = 0; iFullArrayIndex < fullArray.count; iFullArrayIndex++)
    {
        XFNButton* button       = [XFNButton buttonWithType: UIButtonTypeCustom];
        
        UILabel*   label        = [[UILabel alloc] init];
        
        button.frame             = CGRectMake(labelX, labelY, _Macro_AssetLabel_Width, _Macro_AssetLabel_Height);
        
        button.customizedLabel  = label;
        
        label.backgroundColor   = [UIColor blueColor];
        
        label.frame             = label.frame;
        
        label.text              = fullArray[iFullArrayIndex];
        
        label.textAlignment     = NSTextAlignmentCenter;
        
        label.layer.borderWidth = 1;
        
        label.layer.cornerRadius= 20;
        
        //如果该标签已被选中
        if ([array containsObject: fullArray[iFullArrayIndex]])
        {
            label.textColor         = [UIColor blueColor];
            label.layer.borderColor = [UIColor blueColor].CGColor;
        }
        else
        {
            label.textColor         = [UIColor grayColor];
            label.layer.borderColor = [UIColor grayColor].CGColor;
        }
        
        [self addSubview: button];
        [self addSubview: label];
        
        //每行放5个标签，超过该值则换行
        if (0 ==  iFullArrayIndex % 5)
        {
            labelY = labelY + _Macro_AssetLabel_Height + _Macro_AssetLabel_Space;
            labelX = originX;
        }
        else
        {
            labelY = labelY;
            labelX = labelX + _Macro_AssetLabel_Width + _Macro_AssetLabel_Space;
        }
        
        UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (labelX,
                                                                                   labelY,
                                                                                   XFNTableViewCellControlSpacing * 2,
                                                                                   _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
        gridHorizontalLine.backgroundColor = [UIColor redColor];
        [self addSubview: gridHorizontalLine];
        
    }
    
    //若for循环中刚好是5个标签，则labelY的值需要修正
    if (0 == (iFullArrayIndex - 1) % 5)
    {
        labelY = labelY - (_Macro_AssetLabel_Height + _Macro_AssetLabel_Space);
    }
    return CGRectMake(0, originY, _Macro_ScreenWidth, labelY + _Macro_AssetLabel_Height + _Macro_AssetLabel_Space);
}

//在子类中会重写该方法，不能删除 po 20151207
- (void)layoutView
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
        [self resignFirstResponder]; //输入完毕后，关闭键盘空间控件
    }
    
    XFNTextField* tempText = (XFNTextField*)sender;
    
    [_cellModel setObject: tempText.text forKey: tempText.assetPropertyName];
    
    DLog(@"%@修改为：%@", tempText.assetPropertyName, tempText.text);
}

-(void) submitAndBack:(id)sender
{
    XFNButton* submit = (XFNButton*) sender;
    
    [self.delegate toBackAndSubmitObject : _cellModel withCellIndex: submit.cellIndex];
}

#pragma mark other assistant method
//-----------------------------------------------------------------------------------
- (NSString*) getContectNameFromAssetPropertyName: (NSString*) propertyName
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
