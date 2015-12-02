//
//  XFNWorkDetailTableViewCell.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCell.h"
#import "XFNWorkDetailTableViewCellModel.h"


//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailImageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void) initSubView
{
    CGRect mainScreenRect       = [[UIScreen mainScreen] bounds];
    CGSize mainScreenSize       = mainScreenRect.size;
    
    UIView * tempImageFrame = [[UIView alloc] initWithFrame: CGRectMake (0,
                                                                         0,
                                                                         mainScreenSize.width,
                                                                         (mainScreenSize.width*9/16))];
    tempImageFrame.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: tempImageFrame];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame = CGRectMake (0,
                             0,
                             mainScreenSize.width,
                             (mainScreenSize.width*9/16));
}

- (void) initViewLayout
{

}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
}

@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTradeInfoCell


@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailAuxiliaryInfoCell


@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailContactInfoCell


@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailCommentsInfoCell


@end


////-----------------------------------------------------------------------------------------
//@implementation XFNWorkDetailTableViewCell
//
//@end
//
////-----------------------------------------------------------------------------------------
//@implementation XFNWorkAddressInfoTableViewCell
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//        [self initSubView];
//    }
//    return self;
//}
//
//- (void) initSubView
//{
//    _addressInfoLabel               = [[UILabel alloc] init];
//    _addressInfoLabel.textColor     = [UIColor whiteColor];
//    _addressInfoLabel.font          = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
//    [self addSubview : _addressInfoLabel];
//}
//
//- (void)setaddressInfoString: (NSString *) addressInfoString
//{
//    CGFloat addressInfoX    = XFNDetailTableViewCellCoordinateDefaultX, addressInfoY = XFNDetailTableViewCellCoordinateDefaultY;
//    CGSize addressInfoSize  = [addressInfoString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
//    CGRect addressInfoRect  = CGRectMake(addressInfoX, addressInfoY, addressInfoSize.width, addressInfoSize.height);
//    _addressInfoLabel.text  = addressInfoString;
//    _addressInfoLabel.frame = addressInfoRect;
//    //DLog(@"X=%f,Y=%f,Width=%f,Height=%f",addressInfoX, addressInfoY, addressInfoSize.width, addressInfoSize.height);
//    
//    _height = CGRectGetMaxY(_addressInfoLabel.frame) + XFNTableViewCellControlSpacing;
//}
//
//@end
//
////-----------------------------------------------------------------------------------------
//@implementation XFNWorkStatusAttributePriceTableViewCell
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//        [self initSubView];
//    }
//    return self;
//}
//
//- (void) initSubView
//{
//    _statusLabel               = [[UILabel alloc] init];
//    _statusLabel.textColor     = [UIColor whiteColor];
//    _statusLabel.font          = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
//    [self addSubview : _statusLabel];
//    
//    _attributeLabel            = [[UILabel alloc] init];
//    _attributeLabel.textColor  = [UIColor whiteColor];
//    _attributeLabel.font       = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
//    [self addSubview : _attributeLabel];
//    
//    _priceLabel                = [[UILabel alloc] init];
//    _priceLabel.textColor      = [UIColor redColor];
//    _priceLabel.font           = [UIFont systemFontOfSize: XFNDetailTableViewCellFontSizeDefault];
//    [self addSubview : _priceLabel];
//}
//
//- (void)setstatusAttributePrice: (XFNFrameStatusAttributePriceModel *) statusAttributePrice
//{
//    //po 20151109，在此处先计算全部label的宽度及间隔符号的宽度，然后获取当前屏幕的总宽度，可以计算出两个label之间应该预留多少宽度。CGSize的值要x2应该可以对应屏幕上像素的点（不确定）。
//    //CGRect rect = [[UIScreen mainScreen] bounds];
//    //CGSize size = rect.size;
//    //CGFloat width = size.width;
//    //CGFloat height = size.height;
//    
//    NSString *tempstatusString = [[NSString alloc] init];
//    tempstatusString = [NSString stringWithFormat : @"当前状态: %@", [statusAttributePrice getStatusEnumString: statusAttributePrice.statusEnum]];
//    CGFloat statusX     = XFNDetailTableViewCellCoordinateDefaultY, statusY = XFNDetailTableViewCellCoordinateDefaultY;
//    CGSize  statusSize  = [tempstatusString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
//    CGRect  statusRect  = CGRectMake(statusX, statusY, statusSize.width, statusSize.height);
//    _statusLabel.text   = tempstatusString;
//    _statusLabel.frame  = statusRect;
//    //DLog(@"X=%f,Y=%f,Width=%f,Height=%f",statusX, statusY, statusSize.width, statusSize.height);
//    
//    NSString *tempattributeString = [NSString stringWithFormat : @"归属人: %@", statusAttributePrice.attributeString];
//    CGFloat attributeX     = CGRectGetMaxX(_statusLabel.frame) + XFNTableViewCellControlSpacing ;
//    CGFloat attributeY     = statusY;
//    CGSize  attributeSize  = [tempattributeString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
//    CGRect  attributeRect  = CGRectMake(attributeX, attributeY, attributeSize.width, attributeSize.height);
//    _attributeLabel.text   = tempattributeString;
//    _attributeLabel.frame  = attributeRect;
//    //DLog(@"X=%f,Y=%f,Width=%f,Height=%f",attributeX, attributeY, attributeSize.width, attributeSize.height);
//    
//    NSString *tempriceString = [NSString stringWithFormat : @"价格: %@万元", statusAttributePrice.priceString];
//    CGFloat priceX     = CGRectGetMaxX(_attributeLabel.frame) + XFNTableViewCellControlSpacing ;
//    CGFloat priceY     = attributeY;
//    CGSize  priceSize  = [tempriceString sizeWithAttributes : @{NSFontAttributeName : [UIFont systemFontOfSize : XFNDetailTableViewCellFontSizeDefault]}];
//    CGRect  priceRect  = CGRectMake(priceX, priceY, priceSize.width, priceSize.height);
//    _priceLabel.text   = tempriceString;
//    _priceLabel.frame  = priceRect;
//    //DLog(@"X=%f,Y=%f,Width=%f,Height=%f",priceX, priceY, priceSize.width, priceSize.height);
//    
//    _height = CGRectGetMaxY(_priceLabel.frame) + XFNTableViewCellControlSpacing;
//}
//@end



/*--------------------po, deleted 20151108-------------------
@implementation XFNWorkDetailTableViewCell
{
    XFNWorkDetailTableViewCellContentView *_cellContentView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        XFNWorkDetailTableViewCellContentView *contentView = [[XFNWorkDetailTableViewCellContentView alloc] init];
        [self.contentView addSubview:contentView];
        _cellContentView = contentView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}


// 重写父类方法
- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNWorkDetailTableViewCellModel *cellModel = (XFNWorkDetailTableViewCellModel *)model;
}

@end--------------------po, deleted 20151108-------------------*/