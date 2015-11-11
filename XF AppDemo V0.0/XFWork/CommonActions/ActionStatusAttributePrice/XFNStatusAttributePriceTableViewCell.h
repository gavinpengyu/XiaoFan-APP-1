//
//  XFNStatusAttributePriceTableViewCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/11/9.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNStatusAttributePriceTableViewCell_h
#define XFNStatusAttributePriceTableViewCell_h

#import "XFNFrameTableViewController.h"
#import "XFNFrameTableViewControllerCell.h"
#import "XFNFrameCommonItemDetailModel.h"

@protocol XFNStatusAttributePriceDelegate;

//-----------------------------------------------------------------------------------------
@interface XFNStatusAttributePriceTableViewCell : XFNFrameTableViewControllerCell
{
    @private
    UILabel  *_statusLabel;     //状态
    UILabel  *_attributeLabel;  //归属人
    UILabel  *_priceLabel;      //价格
    
    UITextField  *_statusText;     //状态
    UITextField   *_attributeText;  //归属人
    UITextField   *_priceText;      //价格
    
    //@public
    //UIPickerView  *_statusPicker;     //状态
}

@property (nonatomic,strong) XFNFrameStatusAttributePriceModel *statusAttributePrice;

@property (nonatomic,strong) id <XFNStatusAttributePriceDelegate> delegate;

- (void)setstatusAttributePrice: (XFNFrameStatusAttributePriceModel *) statusAttributePrice;

- (void)setTextField: (UITextField*) textFiled withContant: (NSString *)text andFrame: (CGRect) rect andKeyBoardType: (NSInteger) type;

@end

//-----------------------------------------------------------------------------------------


#endif /* XFNStatusAttributePriceTableViewCell_h */
