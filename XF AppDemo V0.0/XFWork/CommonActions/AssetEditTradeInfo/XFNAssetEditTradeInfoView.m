//
//  XFNAssetEditTradeInfoView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditTradeInfoView.h"

@implementation XFNAssetEditTradeInfoView

- (void)layoutViews
{
    CGRect temp;

    NSString* tempUnitPrice= [[NSString alloc] initWithFormat: @"%ld", ([[self.cellModel objectForKey: @"assetTotalPrice"] integerValue] * 10000/ [[self.cellModel objectForKey: @"assetTotalArea"] integerValue])];
    
    
    temp = [self initTitleWithName: @"交易信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    temp = [self initContentTextFieldWithName: @"assetTotalPrice"
                            andValue: [self.cellModel objectForKey: @"assetTotalPrice"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentTextFieldWithName: _Macro_ASSET_UNIT_PRICE_string
                            andValue: tempUnitPrice
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentPickerButtonWithName: @"assetStatus"
                                        andValue: [self.cellModel objectForKey: @"assetStatus"]
                                      andOriginY: (temp.origin.y + temp.size.height)];
    
    temp = [self initContentTextFieldWithName: @"attributeTo"
                            andValue: [self.cellModel objectForKey: @"attributeTo"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentPickerButtonWithName: @"reserveMode"
                                        andValue: [self.cellModel objectForKey: @"reserveMode"]
                                      andOriginY: (temp.origin.y + temp.size.height)];
    
    temp = [self initRemarkTextFieldWithName: @"reserveRemark"
                                     andValue: [self.cellModel objectForKey: @"reserveRemark"]
                                   andOriginY: (temp.origin.y + temp.size.height)
                              andKeyboardType: UIKeyboardTypeDefault];
    
    temp = [self initContentPickerButtonWithName: @"deliveryMode"
                                        andValue: [self.cellModel objectForKey: @"deliveryMode"]
                                      andOriginY: (temp.origin.y + temp.size.height)];
    
    temp = [self initRemarkTextFieldWithName: @"deliveryRemark"
                                    andValue: [self.cellModel objectForKey: @"deliveryRemark"]
                                  andOriginY: (temp.origin.y + temp.size.height)
                             andKeyboardType: UIKeyboardTypeDefault];
    
    temp = [self initTitleWithName: @"标签"
                        andOriginY: (temp.origin.y + temp.size.height + XFNTableViewCellControlSpacing)];
    
    NSString* labelStringtypeOfPaying = [self.cellModel objectForKey: @"typeOfPaying"];
    NSString* labelStringtaxInfo      = [self.cellModel objectForKey: @"taxInfo"];
    
    NSArray * labelArraytypeOfPaying  = [XFNFrameAssetModel initArrayByAssetString: labelStringtypeOfPaying];
    NSArray * labelArraytaxInfo       = [XFNFrameAssetModel initArrayByAssetString: labelStringtaxInfo];

    temp = [self initLabelViewWithArray: labelArraytypeOfPaying
                             andOriginY: (temp.origin.y + temp.size.height)
                        andPropertyName: @"typeOfPaying"];
    
    temp = [self initCustomizeTextFieldWithName: @"typeOfPaying"
                                     andOriginY: (temp.origin.y + temp.size.height)];
    
    temp = [self initLabelViewWithArray: labelArraytaxInfo
                             andOriginY: (temp.origin.y + temp.size.height - XFNTableViewCellControlSpacing)
                        andPropertyName: @"taxInfo"];

    temp = [self initCustomizeTextFieldWithName: @"taxInfo"
                                     andOriginY: (temp.origin.y + temp.size.height)];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailTradeInfoCellIndexEnum];
}

- (CGRect) initRemarkTextFieldWithName: (NSString*) name
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
    valueText.placeholder  = @"建议不超过20个汉字";
    valueText.textColor    = [UIColor blackColor];
    valueText.textAlignment= NSTextAlignmentLeft;
    valueText.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    valueText.keyboardType = keyboardType;
    
    CGSize  valueTextSize  = [titleLabel.text sizeWithAttributes : @{NSFontAttributeName : titleLabel.font}];
    
    CGFloat valueTextX     = titleLabel.frame.origin.x + titleLabel.frame.size.width + XFNTableViewCellControlSpacing;
    valueTextSize.width    = _Macro_ScreenWidth - valueTextX - XFNTableViewCellControlSpacing;
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

@end
