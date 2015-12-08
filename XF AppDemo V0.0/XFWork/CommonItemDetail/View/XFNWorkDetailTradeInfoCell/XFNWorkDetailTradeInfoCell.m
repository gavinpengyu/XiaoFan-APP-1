//
//  XFNWorkDetailTradeInfoCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"

#import "XFNWorkDetailTradeInfoCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTradeInfoCell
{
    UILabel * labelOfTradeInfo;
    
    UILabel * labelOfTotalPrice;
    UILabel * labelOfUnitPrice;
    
    UILabel * labelOfStatus;
    UILabel * labelOfAttributed;
    
    UILabel * labelOfReserve;
    UILabel * labelOfDelivery;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    _totalPriceLabel   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _totalPriceLabel];
    
    _unitPriceLabel    = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _unitPriceLabel];
    
    _statusLabel       = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _statusLabel];
    
    _attributedLabel   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _attributedLabel];
    
    _reserveLabel      = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _reserveLabel];
    
    _deliveryLabel     = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _deliveryLabel];
    
    labelOfTradeInfo   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                  andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfTradeInfo];
    labelOfTradeInfo.text  = @"交易信息";
    
    labelOfTotalPrice  = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfTotalPrice];
    labelOfTotalPrice.text = @"总价：";
    
    labelOfUnitPrice   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfUnitPrice];
    labelOfUnitPrice.text  = @"单价：";
    
    labelOfStatus      = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfStatus];
    labelOfStatus.text     = @"状态：";
    
    labelOfAttributed  = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfAttributed];
    labelOfAttributed.text = @"归属：";
    
    labelOfReserve     = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfReserve];
    labelOfReserve.text    = @"看房：";
    
    labelOfDelivery    = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfDelivery];
    labelOfDelivery.text   = @"交房：";
}

- (void) initViewLayout
{
    /* View
     
     交易信息
     －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
     总价：   240万                       状态：    出售中
     
     单价：   22800元/平米                 归属：    童虎
     
     看房：   有钥匙 ｜ 卡卡西 编号XF20151109
     
     交房：   业主住 ｜ 过户后一个月内交房 2015-11-20
     
     无营业税 有增值税
     */
    
    //-----------------------------------------------------------------------------------------
    CGFloat labelOfTradeInfoX     = XFNTableViewCellControlSpacing;
    CGFloat labelOfTradeInfoY     = XFNTableViewCellControlSpacing;
    CGSize  labelOfTradeInfoSize  = [labelOfTradeInfo.text sizeWithAttributes : @{NSFontAttributeName : labelOfTradeInfo.font}];
    CGRect  labelOfTradeInfoRect  = CGRectMake(labelOfTradeInfoX,
                                               labelOfTradeInfoY,
                                               labelOfTradeInfoSize.width,
                                               labelOfTradeInfoSize.height);
    labelOfTradeInfo.frame        = labelOfTradeInfoRect;
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               labelOfTradeInfoY + labelOfTradeInfoSize.height + XFNTableViewCellControlSpacing,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    //总价-----------------------------------------------------------------------------------------
    CGFloat labelOfTotalPriceX          = XFNTableViewCellControlSpacing;
    CGFloat labelOfTotalPriceY          = labelOfTradeInfoY + labelOfTradeInfoSize.height + XFNTableViewCellControlSpacing * 2;
    CGSize  labelOfTotalPriceSize       = [labelOfTotalPrice.text sizeWithAttributes : @{NSFontAttributeName : labelOfTotalPrice.font}];
    CGRect  labelOfTotalPriceRect       = CGRectMake(labelOfTotalPriceX,
                                                     labelOfTotalPriceY,
                                                     labelOfTotalPriceSize.width,
                                                     labelOfTotalPriceSize.height);
    labelOfTotalPrice.frame             = labelOfTotalPriceRect;
    
    CGFloat totalPriceLabelX     = labelOfTotalPriceX + labelOfTotalPriceSize.width + XFNTableViewCellControlSpacing;
    CGSize  totalPriceLabelSize  = [_totalPriceLabel.text sizeWithAttributes : @{NSFontAttributeName : _totalPriceLabel.font}];
    CGFloat totalPriceLabelY     = labelOfTotalPriceY + labelOfTotalPriceSize.height - totalPriceLabelSize.height;
    CGRect  totalPriceLabelRect  = CGRectMake(totalPriceLabelX,
                                              totalPriceLabelY,
                                              totalPriceLabelSize.width,
                                              totalPriceLabelSize.height);
    _totalPriceLabel.frame       = totalPriceLabelRect;
    
    //状态-----------------------------------------------------------------------------------------
    CGFloat labelOfStatusX          = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2)/2 - XFNTableViewCellControlSpacing * 2; //屏幕正中偏左侧两个space
    CGFloat labelOfStatusY          = labelOfTotalPriceY;
    CGSize  labelOfStatusSize       = [labelOfStatus.text sizeWithAttributes : @{NSFontAttributeName : labelOfStatus.font}];
    CGRect  labelOfStatusRect       = CGRectMake(labelOfStatusX,
                                                 labelOfStatusY,
                                                 labelOfStatusSize.width,
                                                 labelOfStatusSize.height);
    labelOfStatus.frame             = labelOfStatusRect;
    
    CGFloat statusLabelX     = labelOfStatusX + labelOfStatusSize.width + XFNTableViewCellControlSpacing;
    CGSize  statusLabelSize  = [_statusLabel.text sizeWithAttributes : @{NSFontAttributeName : _statusLabel.font}];
    CGFloat statusLabelY     = labelOfStatusY + labelOfStatusSize.height - statusLabelSize.height;
    CGRect  statusLabelRect  = CGRectMake(statusLabelX,
                                              statusLabelY,
                                              statusLabelSize.width,
                                              statusLabelSize.height);
    _statusLabel.frame       = statusLabelRect;
    
    //单价-----------------------------------------------------------------------------------------
    CGFloat labelOfUnitPriceX          = XFNTableViewCellControlSpacing;
    CGFloat labelOfUnitPriceY          = labelOfTotalPriceY + labelOfTotalPriceSize.height + XFNTableViewCellControlSpacing;
    CGSize  labelOfUnitPriceSize       = [labelOfUnitPrice.text sizeWithAttributes : @{NSFontAttributeName : labelOfUnitPrice.font}];
    CGRect  labelOfUnitPriceRect       = CGRectMake(labelOfUnitPriceX,
                                                     labelOfUnitPriceY,
                                                     labelOfUnitPriceSize.width,
                                                     labelOfUnitPriceSize.height);
    labelOfUnitPrice.frame             = labelOfUnitPriceRect;
    
    CGFloat unitPriceLabelX     = labelOfUnitPriceX + labelOfUnitPriceSize.width + XFNTableViewCellControlSpacing;
    CGSize  unitPriceLabelSize  = [_unitPriceLabel.text sizeWithAttributes : @{NSFontAttributeName : _unitPriceLabel.font}];
    CGFloat unitPriceLabelY     = labelOfUnitPriceY + labelOfUnitPriceSize.height - unitPriceLabelSize.height;
    CGRect  unitPriceLabelRect  = CGRectMake(unitPriceLabelX,
                                              unitPriceLabelY,
                                              unitPriceLabelSize.width,
                                              unitPriceLabelSize.height);
    _unitPriceLabel.frame       = unitPriceLabelRect;
    
    //楼层-----------------------------------------------------------------------------------------
    CGFloat labelOfAttributedX          = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2)/2 - XFNTableViewCellControlSpacing * 2; //屏幕正中偏左侧两个space
    CGFloat labelOfAttributedY          = labelOfUnitPriceY;
    CGSize  labelOfAttributedSize       = [labelOfAttributed.text sizeWithAttributes : @{NSFontAttributeName : labelOfAttributed.font}];
    CGRect  labelOfAttributedRect       = CGRectMake(labelOfAttributedX,
                                                 labelOfAttributedY,
                                                 labelOfAttributedSize.width,
                                                 labelOfAttributedSize.height);
    labelOfAttributed.frame             = labelOfAttributedRect;
    
    CGFloat attributedLabelX     = labelOfAttributedX + labelOfAttributedSize.width + XFNTableViewCellControlSpacing;
    CGSize  attributedLabelSize  = [_attributedLabel.text sizeWithAttributes : @{NSFontAttributeName : _attributedLabel.font}];
    CGFloat attributedLabelY     = labelOfAttributedY + labelOfAttributedSize.height - attributedLabelSize.height;
    CGRect  attributedLabelRect  = CGRectMake(attributedLabelX,
                                          attributedLabelY,
                                          attributedLabelSize.width,
                                          attributedLabelSize.height);
    _attributedLabel.frame       = attributedLabelRect;
    
    //看房条件-----------------------------------------------------------------------------------------
    CGFloat labelOfReserveX          = XFNTableViewCellControlSpacing;
    CGFloat labelOfReserveY          = labelOfUnitPriceY + labelOfUnitPriceSize.height + XFNTableViewCellControlSpacing;
    CGSize  labelOfReserveSize       = [labelOfReserve.text sizeWithAttributes : @{NSFontAttributeName : labelOfReserve.font}];
    CGRect  labelOfReserveRect       = CGRectMake(labelOfReserveX,
                                                    labelOfReserveY,
                                                    labelOfReserveSize.width,
                                                    labelOfReserveSize.height);
    labelOfReserve.frame             = labelOfReserveRect;
    
    CGFloat reserveLabelX     = labelOfReserveX + labelOfReserveSize.width + XFNTableViewCellControlSpacing;
    CGSize  reserveLabelSize  = [_reserveLabel.text sizeWithAttributes : @{NSFontAttributeName : _reserveLabel.font}];
    CGFloat reserveLabelY     = labelOfReserveY + labelOfReserveSize.height - reserveLabelSize.height;
    CGRect  reserveLabelRect  = CGRectMake(reserveLabelX,
                                             reserveLabelY,
                                             reserveLabelSize.width,
                                             reserveLabelSize.height);
    _reserveLabel.frame       = reserveLabelRect;
    
    //交房条件-----------------------------------------------------------------------------------------
    CGFloat labelOfDeliveryX          = XFNTableViewCellControlSpacing;
    CGFloat labelOfDeliveryY          = labelOfReserveY + labelOfReserveSize.height + XFNTableViewCellControlSpacing;
    CGSize  labelOfDeliverySize       = [labelOfDelivery.text sizeWithAttributes : @{NSFontAttributeName : labelOfDelivery.font}];
    CGRect  labelOfDeliveryRect       = CGRectMake(labelOfDeliveryX,
                                                  labelOfDeliveryY,
                                                  labelOfDeliverySize.width,
                                                  labelOfDeliverySize.height);
    labelOfDelivery.frame             = labelOfDeliveryRect;
    
    CGFloat deliveryLabelX     = labelOfDeliveryX + labelOfDeliverySize.width + XFNTableViewCellControlSpacing;
    CGSize  deliveryLabelSize  = [_deliveryLabel.text sizeWithAttributes : @{NSFontAttributeName : _deliveryLabel.font}];
    CGFloat deliveryLabelY     = labelOfDeliveryY + labelOfDeliverySize.height - deliveryLabelSize.height;
    CGRect  deliveryLabelRect  = CGRectMake(deliveryLabelX,
                                           deliveryLabelY,
                                           deliveryLabelSize.width,
                                           deliveryLabelSize.height);
    _deliveryLabel.frame       = deliveryLabelRect;
    
    //标签-----------------------------------------------------------------------------------------
    CGPoint tempPoint = CGPointMake (0, (_deliveryLabel.frame.origin.y + _deliveryLabel.frame.size.height + XFNTableViewCellControlSpacing));
    
    UIView * labelView= [XFNWorkDetailTableViewCell initLabelUIViewWithArray: _labelsArray andOriginPoint: tempPoint];
    
    [self addSubview : labelView];
    
    CGFloat cellHeight = (tempPoint.y +labelView.frame.size.height);
    
    CGFloat buttonY    =  gridHorizontalLine.frame.origin.y - XFNTableViewCellControlSpacing/2 - _Macro_XFNWorkDetailTableView_Accessory_Height;
    //手写cell最右侧的操作按钮
    UIButton* accessoryActionButton = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
    //离屏幕最右侧一个space距离，离cell的手动分割线高度为_Macro_XFNWorkDetailTableView_Accessory_Height
    accessoryActionButton.frame     = CGRectMake((_Macro_ScreenWidth - XFNTableViewCellControlSpacing - _Macro_XFNWorkDetailTableView_Accessory_Width),
                                                 buttonY,
                                                 _Macro_XFNWorkDetailTableView_Accessory_Width,
                                                 _Macro_XFNWorkDetailTableView_Accessory_Height);
    
    [accessoryActionButton addTarget:self action:@selector(pushViewForEditTradeInfo:) forControlEvents: UIControlEventTouchDown];
    
    [self addSubview: accessoryActionButton];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNWorkDetailTradeInfoCellModel *cellModel = (XFNWorkDetailTradeInfoCellModel *)model;
    
    _totalPriceLabel.text = cellModel.totalPriceString;
    _unitPriceLabel.text  = cellModel.unitPriceString;
    _statusLabel.text     = cellModel.statusString;
    _attributedLabel.text = cellModel.attributedString;
    _reserveLabel.text    = cellModel.reserveString;
    _deliveryLabel.text   = cellModel.deliveryString;
    
    _labelsArray          = cellModel.labelsArray;
    
    [self initViewLayout];
}

//selector-----------------------------------------------------------------------------------------
-(void) pushViewForEditTradeInfo:(id)sender
{
    [self.delegate toPushViewForEditTradeInfo];
}

@end