//
//  XFNStatusAttributePriceTableViewCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/11/9.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNStatusAttributePriceTableViewController.h"
#import "XFNStatusAttributePriceTableViewCell.h"
#import "XFNFrameCommonItemDetailModel.h"


//-----------------------------------------------------------------------------------------
@implementation XFNStatusAttributePriceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void) initSubView
{
    //-----------------------------------------------------------------------------------------
    _statusLabel               = [[UILabel alloc] init];
    _statusLabel.textColor     = XFNGrayColor;
    _statusLabel.text          = @"当前状态：";
    _statusLabel.font          = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
    [self addSubview : _statusLabel];
    
    _statusText                = [[UITextField alloc] init];
    _statusText.textColor      = XFNGrayColor;
    _statusText.font           = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
    
    [self addSubview : _statusText];
    
    //-----------------------------------------------------------------------------------------
    _attributeLabel               = [[UILabel alloc] init];
    _attributeLabel.textColor     = XFNGrayColor;
    _attributeLabel.text          = @"归属人：";
    _attributeLabel.font          = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
    [self addSubview : _attributeLabel];
    
    _attributeText                = [[UITextField alloc] init];
    _attributeText.textColor      = XFNGrayColor;
    _attributeText.font           = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
    
    [self addSubview : _attributeText];
    
    //-----------------------------------------------------------------------------------------
    _priceLabel               = [[UILabel alloc] init];
    _priceLabel.textColor     = XFNGrayColor;
    _priceLabel.text          = @"价格：";
    _priceLabel.font          = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
    [self addSubview : _priceLabel];
    
    _priceText                = [[UITextField alloc] init];
    _priceText.textColor      = XFNRedColor; //为什么没有显示红色？po 20151110
    _priceText.font           = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeL];
    
    [self addSubview : _priceText];
}

- (void)setstatusAttributePrice: (XFNFrameStatusAttributePriceModel *) statusAttributePrice
{
    //-----------------------------------------------------------------------------------------
    CGFloat statusLabelX     = XFNDetailTableViewCellCoordinateDefaultX * 2, statusLabelY = XFNDetailTableViewCellCoordinateDefaultY * 2;
    CGSize  statusLabelSize  = [_statusLabel.text sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
    CGRect  statusLabelRect  = CGRectMake(statusLabelX, statusLabelY, statusLabelSize.width, statusLabelSize.height);
    _statusLabel.frame       = statusLabelRect;
    
    NSString *tempStatusString = [[NSString alloc] init];
    tempStatusString           = [statusAttributePrice getStatusEnumString : (statusAttributePrice.statusEnum)];
    
    CGFloat statusTextX        = statusLabelX + statusLabelSize.width + XFNTableViewCellControlSpacing;
    CGFloat statusTextY        = statusLabelY;
    CGSize  statusTextSize     = [tempStatusString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
    CGRect  statusTextRect     = CGRectMake ( statusTextX,
                                                statusTextY - XFNTableViewCellControlSpacing/2,
                                                (statusTextSize.width + XFNTableViewCellControlSpacing) * 2,
                                                statusTextSize.height + XFNTableViewCellControlSpacing);
    [self setTextField : _statusText
           withContant : tempStatusString
              andFrame : statusTextRect
       andKeyBoardType : UIKeyboardTypeDefault];
    
    //点击TextField，通过delegate由controller生成PickerView，覆盖键盘区域，picker选定的值，直接更新数据
    [_statusText addTarget : self action : @selector (statusChanged)   forControlEvents : UIControlEventEditingDidBegin];
    
    //-----------------------------------------------------------------------------------------
    CGFloat attributeLabelX     = statusLabelX;
    CGFloat attributeLabelY     = statusLabelY + XFNTableViewCellControlSpacing * 3;
    CGSize  attributeLabelSize  = [_attributeLabel.text sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
    CGRect  attributeLabelRect  = CGRectMake(attributeLabelX, attributeLabelY, attributeLabelSize.width, attributeLabelSize.height);
    _attributeLabel.frame       = attributeLabelRect;
    
    NSString *tempAttributeString = [[NSString alloc] init];
    tempAttributeString           = [NSString stringWithFormat : @"%@", statusAttributePrice.attributeString];
    
    CGFloat attributeTextX        = attributeLabelX + attributeLabelSize.width + XFNTableViewCellControlSpacing;
    CGFloat attributeTextY        = attributeLabelY;
    CGSize  attributeTextSize     = [tempAttributeString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
    CGRect  attributeTextRect     = CGRectMake ( attributeTextX,
                                                 attributeTextY - XFNTableViewCellControlSpacing/2,
                                                 (attributeTextSize.width + XFNTableViewCellControlSpacing) * 2,
                                                 attributeTextSize.height + XFNTableViewCellControlSpacing);
    
    [self setTextField : _attributeText
           withContant : tempAttributeString
              andFrame : attributeTextRect
       andKeyBoardType : UIKeyboardTypeDefault];
    
    //po 20151110: 待添加，输入的时候如果有别的屏幕触碰，则恢复原textField内容，关闭软键盘
    //[_attributeText addTarget : self action : @selector (inputCancelled) forControlEvents : UIControlEventAllTouchEvents];
    
    //修改完成后，将新的值通过delegate发送至Controller，并写入数据库
    [_attributeText addTarget : self action : @selector (attributeChanged)   forControlEvents : UIControlEventEditingDidEndOnExit];
    
    //-----------------------------------------------------------------------------------------
    CGFloat priceLabelX     = statusLabelX;
    CGFloat priceLabelY     = attributeLabelY + XFNTableViewCellControlSpacing * 3;
    CGSize  priceLabelSize  = [_priceLabel.text sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
    CGRect  priceLabelRect  = CGRectMake(priceLabelX, priceLabelY, priceLabelSize.width, priceLabelSize.height);
    _priceLabel.frame       = priceLabelRect;
    
    NSString *tempPriceString = [[NSString alloc] init];
    tempPriceString           = [NSString stringWithFormat : @"%@", statusAttributePrice.priceString];
    
    CGFloat priceTextX        = priceLabelX + priceLabelSize.width + XFNTableViewCellControlSpacing;
    CGFloat priceTextY        = priceLabelY;
    CGSize  priceTextSize     = [tempPriceString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
    CGRect  priceTextRect     = CGRectMake ( priceTextX,
                                             priceTextY - XFNTableViewCellControlSpacing/2,
                                             (priceTextSize.width + XFNTableViewCellControlSpacing) * 2,
                                             priceTextSize.height + XFNTableViewCellControlSpacing);
    
    [self setTextField : _priceText
           withContant : tempPriceString
              andFrame : priceTextRect
       andKeyBoardType : UIKeyboardTypeNumbersAndPunctuation];
    
    //po 20151110: 待添加，输入的时候如果有别的屏幕触碰，则恢复原textField内容，关闭软键盘
    //[_priceText addTarget : self action : @selector (inputCancelled) forControlEvents : UIControlEventAllTouchEvents];
    
    //修改完成后，将新的值通过delegate发送至Controller，并写入数据库
    [_priceText addTarget : self action : @selector (priceChanged)   forControlEvents : UIControlEventEditingDidEndOnExit];
    
 
    //_height = CGRectGetMaxY(_addressInfoLabel.frame) + XFNTableViewCellControlSpacing;
}

- (void)setTextField: (UITextField*) textFiled withContant: (NSString *)text andFrame: (CGRect) rect andKeyBoardType: (NSInteger) type
{
    textFiled.text                       = text;
    textFiled.frame                      = rect;
    textFiled.keyboardType               = type;
    textFiled.borderStyle                = UITextBorderStyleRoundedRect;
    textFiled.backgroundColor            = [UIColor clearColor];
    textFiled.returnKeyType              = UIReturnKeyDone;
    textFiled.contentVerticalAlignment   = UIControlContentVerticalAlignmentCenter;
    textFiled.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
}

#pragma mark delegate

- (void) attributeChanged
{
    if ([self isFirstResponder])
    {
        [self resignFirstResponder]; //输入完毕后，关闭键盘空间控件
    }
    
    //po 20151110: 待添加， 检查输入值，非法则弹出提示框，并复原textField初始值
    
    [self.delegate toModify: @"Attribute" with: _attributeText.text];
}

- (void) priceChanged
{
    if ([self isFirstResponder])
    {
        [self resignFirstResponder]; //输入完毕后，关闭键盘空间控件
    }

    //po 20151110: 待添加， 检查输入值，非法则弹出提示框，并复原textField初始值
    [self.delegate toModify: @"Price" with: _priceText.text];
    
}

- (void) statusChanged
{
    [self endEditing:YES];//关闭键盘控件
    
    [self.delegate toModify: @"Status" with:nil];
}

#pragma mark datasource

@end





































