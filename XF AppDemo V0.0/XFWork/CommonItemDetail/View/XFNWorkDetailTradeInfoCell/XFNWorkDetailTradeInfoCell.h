//
//  XFNWorkDetailTradeInfoCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTradeInfoCell_h
#define XFNWorkDetailTradeInfoCell_h

#import "XFNWorkDetailTableViewCell.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTradeInfoCell : XFNWorkDetailTableViewCell
{
    UILabel  *_totalPriceLabel;
    UILabel  *_unitPriceLabel;
    
    UILabel  *_statusLabel;
    UILabel  *_attributedLabel;
    
    UILabel  *_reserveLabel;
    UILabel  *_deliveryLabel;
    
    NSArray  *_labelsArray;
}

@property (nonatomic,strong) id <XFNPushEditViewDelegate> delegate;

- (void)setModel:(NSObject *)model;

@end

#endif /* XFNWorkDetailTradeInfoCell_h */
