//
//  XFNAssetCommentView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetCommentView.h"
#import "XFNWorkTableViewCell.h" //需使用getTheColorOfLabel方法

@implementation XFNAssetCommentView

- (void)layoutViews
{
    CGRect temp;
    CGPoint tempPoint;
    
    temp = [self initTitleWithName: @"跟进信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    temp = [self initCommentsTextFieldWithName: @"assetLog"
                                    andOriginY: (temp.origin.y + temp.size.height)
                               andKeyboardType: UIKeyboardTypeDefault];
    
    temp = [self initTitleWithName: @"摘要标签"
                        andOriginY: (temp.origin.y + temp.size.height  + XFNTableViewCellControlSpacing)];
    
    NSString* labelString = [self.cellModel objectForKey: @"summaryInfoLabelsOfAsset"];
    NSArray * labelArray  = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    temp = [self initCommentsLabelViewWithArray: labelArray
                                     andOriginY: (temp.origin.y + temp.size.height)
                                andPropertyName: @"summaryInfoLabelsOfAsset"];
    
    temp = [self initTitleWithName: @"修改入口"
                        andOriginY: (temp.origin.y + temp.size.height)];
    
    //-----------------------------------------------------------------------------------
    tempPoint.x = 0;
    tempPoint.y = temp.origin.y + temp.size.height;
    
    temp = [self initButtonForPushEditViewWithOrigin: tempPoint
                                        andCellIndex: XFNWorkDetailBasicInfoCellIndexEnum];
    
    //-----------------------------------------------------------------------------------
    tempPoint.x = temp.origin.x + temp.size.width + XFNTableViewCellControlSpacing;
    tempPoint.y = temp.origin.y;
    
    temp = [self initButtonForPushEditViewWithOrigin: tempPoint
                                        andCellIndex: XFNWorkDetailTradeInfoCellIndexEnum];
    
    //-----------------------------------------------------------------------------------
    tempPoint.x = temp.origin.x + temp.size.width + XFNTableViewCellControlSpacing;
    tempPoint.y = temp.origin.y;
    
    temp = [self initButtonForPushEditViewWithOrigin: tempPoint
                                        andCellIndex: XFNWorkDetailAuxiliaryInfoCellIndexEnum];
    
    //-----------------------------------------------------------------------------------
    tempPoint.x = temp.origin.x + temp.size.width + XFNTableViewCellControlSpacing;
    tempPoint.y = temp.origin.y;
    
    temp = [self initButtonForPushEditViewWithOrigin: tempPoint
                                        andCellIndex: XFNWorkDetailContactInfoCellIndexEnum];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailCommentsInfoCellIndexEnum];
}

- (CGRect) initCommentsTextFieldWithName: (NSString*) name
                              andOriginY: (CGFloat) originY
                         andKeyboardType: (UIKeyboardType) keyboardType
{
    //-----------------------------------------------------------------------------------
    XFNTextField* commentsText= [[XFNTextField alloc] init];
    commentsText.placeholder  = @"输入跟进，建议不超过20个汉字";
    commentsText.textColor    = [UIColor blackColor];
    commentsText.textAlignment= NSTextAlignmentLeft;
    commentsText.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    commentsText.keyboardType = keyboardType;
    
    CGSize  commentsTextSize;
    
    CGFloat commentsTextX     = XFNTableViewCellControlSpacing;
    CGFloat commentsTextY     = originY + XFNTableViewCellControlSpacing;
    
    commentsTextSize.width    = _Macro_ScreenWidth - 2 * XFNTableViewCellControlSpacing;
    commentsTextSize.height   = _Macro_AssetLabel_Height;
    
    CGRect  commentsTextRect  = CGRectMake(commentsTextX,
                                        commentsTextY,
                                        commentsTextSize.width,
                                        commentsTextSize.height);
    
    commentsText.frame        = commentsTextRect;
    
    [self addSubview: commentsText];
    
    commentsText.assetPropertyName = name;//po 20151207 通过该property传递参数
    [commentsText addTarget : self action : @selector (commentsChanged:) forControlEvents : (UIControlEventEditingDidEnd | UIControlEventEditingDidEndOnExit)];
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (commentsText.frame.origin.x,
                                                                               (commentsText.frame.origin.y + commentsText.frame.size.height + _Macro_XFNWorTableViewCellHorizontalSeperatorHeight),
                                                                               commentsText.frame.size.width,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    return CGRectMake(0,
                      originY,
                      _Macro_ScreenWidth,
                      gridHorizontalLine.frame.origin.y - originY + XFNTableViewCellControlSpacing);
}

- (CGRect)initButtonForPushEditViewWithOrigin: (CGPoint) origin andCellIndex: (XFNDetailViewCellIndexEnum)cellIndex
{
    CGFloat tempLabelX   = origin.x + XFNTableViewCellControlSpacing;
    CGFloat tempLabelY   = origin.y + XFNTableViewCellControlSpacing;
    
    UILabel * tempLabel           = [[UILabel alloc] init];
    tempLabel.layer.borderWidth   = 1;
    tempLabel.layer.cornerRadius  = 30;
    tempLabel.textAlignment       = NSTextAlignmentCenter;
    
    tempLabel.font                = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    tempLabel.frame               = CGRectMake(tempLabelX, tempLabelY, 60, 60);
    [self addSubview: tempLabel];
    
    if (XFNWorkDetailBasicInfoCellIndexEnum == cellIndex)
    {
        tempLabel.text                = @"基本信息";
    }
    else if (XFNWorkDetailTradeInfoCellIndexEnum == cellIndex)
    {
        tempLabel.text                = @"交易信息";
    }
    else if (XFNWorkDetailAuxiliaryInfoCellIndexEnum == cellIndex)
    {
        tempLabel.text                = @"装修配套";
    }
    else if (XFNWorkDetailContactInfoCellIndexEnum == cellIndex)
    {
        tempLabel.text                = @"联系人";
    }
    else
    {
        DLog(@"ERROR: 初始化操作按钮出错，页面类型无法识别");
    }
    
    XFNButton* button       = [XFNButton buttonWithType: UIButtonTypeCustom];
    button.frame            = tempLabel.frame;
    button.cellIndex        = cellIndex;
    
    [self addSubview: button];
    [button addTarget : self action : @selector (toPushEditView:) forControlEvents : UIControlEventTouchDown];
    
    return CGRectMake(origin.x, origin.y, button.frame.size.width, button.frame.size.height);
}

- (CGRect)initCommentsLabelViewWithArray: (NSArray*) array andOriginY: (CGFloat) originY andPropertyName: (NSString*) name
{
    NSMutableArray *fullArray = [NSMutableArray array];
    
    NSString* labelString          = [self.cellModel objectForKey: @"basicInfoLabelsOfAsset"];
    NSArray * labelbasicInfoArray  = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    [self addUniqueObjectToArray: fullArray byArray: labelbasicInfoArray];
    
    labelString          = [self.cellModel objectForKey: @"typeOfPaying"];
    NSArray * labeltypeOfPayingArray  = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    [self addUniqueObjectToArray: fullArray byArray: labeltypeOfPayingArray];
    
    labelString          = [self.cellModel objectForKey: @"taxInfo"];
    NSArray * labeltaxInfoArray  = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    [self addUniqueObjectToArray: fullArray byArray: labeltaxInfoArray];
    
    labelString          = [self.cellModel objectForKey: @"decorationInfo"];
    NSArray * labeldecorationInfoArray  = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    [self addUniqueObjectToArray: fullArray byArray: labeldecorationInfoArray];
    
    labelString          = [self.cellModel objectForKey: @"ancillaryInfo"];
    NSArray * labelancillaryInfoArray  = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    [self addUniqueObjectToArray: fullArray byArray: labelancillaryInfoArray];
    
    labelString          = [self.cellModel objectForKey: @"summaryInfoLabelsOfAsset"];
    NSArray * labelsummaryInfoArray    = [XFNFrameAssetModel initArrayByAssetString: labelString];
    
    [self addUniqueObjectToArray: fullArray byArray: labelsummaryInfoArray];
    
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
    if (0 == (iFullArrayIndex ) % 5)
    {
        tempLabelY = tempLabelY - (_Macro_AssetLabel_Height + _Macro_AssetLabel_Space);
    }
    return CGRectMake(0, originY, _Macro_ScreenWidth, (tempLabelY + _Macro_AssetLabel_Height + _Macro_AssetLabel_Space - originY));
}

-(void) commentsChanged:(id)sender
{
    if ([self isFirstResponder])
    {
        [self resignFirstResponder]; //输入完毕后，关闭键盘空间控件  [self.view endEditing:YES];
    }
    
    XFNTextField* tempText = (XFNTextField*)sender;
    
    if (nil == _assetCustomizedComments)
    {
        _assetCustomizedComments = [NSString string];
    }
    
    _assetCustomizedComments = tempText.text;
    
    DLog(@"跟进内容被修改为：%@", _assetCustomizedComments);
}

-(void)toPushEditView:(id)sender
{
    XFNButton* button   = (XFNButton*)sender;
    
    if (XFNWorkDetailBasicInfoCellIndexEnum == button.cellIndex)
    {
        [self.delegate toPushViewForEditBasicInfo];
    }
    else if (XFNWorkDetailTradeInfoCellIndexEnum == button.cellIndex)
    {
        [self.delegate toPushViewForEditTradeInfo];
    }
    else if (XFNWorkDetailAuxiliaryInfoCellIndexEnum == button.cellIndex)
    {
        [self.delegate toPushViewForEditAuxiliaryInfo];
    }
    else if (XFNWorkDetailContactInfoCellIndexEnum == button.cellIndex)
    {
        [self.delegate toPushViewForEditContactInfo];
    }
    else
    {
        return;
    }
    
    return;
}

@end
