//
//  XFNWorkDetailTableViewCell.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTableViewCell_h
#define XFNWorkDetailTableViewCell_h

#import "XFNFrameTableViewControllerCell.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailImageViewCell : XFNFrameTableViewControllerCell

- (void)setModel:(NSObject *)model;
//- (CGFloat)getHeight;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTradeInfoCell : XFNFrameTableViewControllerCell

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailAuxiliaryInfoCell : XFNFrameTableViewControllerCell

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailContactInfoCell : XFNFrameTableViewControllerCell

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailCommentsInfoCell : XFNFrameTableViewControllerCell

@end


//-----------------------------------------------------------------------------------------
//@interface XFNWorkDetailTableViewCell : XFNFrameTableViewControllerCell
//
//@end
//
////-----------------------------------------------------------------------------------------
//@interface XFNWorkAddressInfoTableViewCell : XFNWorkDetailTableViewCell
//{
//    @private
//    UILabel *_addressInfoLabel;
//}
//
//@property (nonatomic,strong) NSString *addressInfoString;
//
//@property (assign,nonatomic) CGFloat height;
//
//- (void)setaddressInfoString: (NSString *) addressInfoString;
//
//@end
//
////-----------------------------------------------------------------------------------------
//@interface XFNWorkStatusAttributePriceTableViewCell : XFNWorkDetailTableViewCell
//{
//    @private
//    UILabel* _statusLabel;     //状态
//    UILabel* _attributeLabel;  //归属人
//    UILabel* _priceLabel;      //价格
//}
//
//@property (nonatomic,strong) XFNFrameStatusAttributePriceModel *statusAttributePrice;
//
//@property (assign,nonatomic) CGFloat height;
//
//- (void)setstatusAttributePrice: (XFNFrameStatusAttributePriceModel *) statusAttributePrice;
//
//@end

//-----------------------------------------------------------------------------------------


//-----------------------------------------------------------------------------------------

#endif /* XFNWorkDetailTableViewCell_h */
