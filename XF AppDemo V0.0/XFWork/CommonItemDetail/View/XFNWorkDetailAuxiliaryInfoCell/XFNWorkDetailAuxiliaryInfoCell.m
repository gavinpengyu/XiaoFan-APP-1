//
//  XFNWorkDetailAuxiliaryInfoCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"

#import "XFNWorkDetailAuxiliaryInfoCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailAuxiliaryInfoCell
{
    UILabel * labelOfAuxiliaryInfo;
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
    labelOfAuxiliaryInfo   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                        andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfAuxiliaryInfo];
    labelOfAuxiliaryInfo.text  = @"装修配套";
}

- (void) initViewLayout
{
    /* View
     
     装修配套
     －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
     豪装 大理石 实木地板 地暖 全配 洗衣机 
     空调x2 冰箱
     */
    
    //-----------------------------------------------------------------------------------------
    CGFloat labelOfAuxiliaryInfoX     = XFNTableViewCellControlSpacing;
    CGFloat labelOfAuxiliaryInfoY     = XFNTableViewCellControlSpacing;
    CGSize  labelOfAuxiliaryInfoSize  = [labelOfAuxiliaryInfo.text sizeWithAttributes : @{NSFontAttributeName : labelOfAuxiliaryInfo.font}];
    CGRect  labelOfAuxiliaryInfoRect  = CGRectMake(labelOfAuxiliaryInfoX,
                                               labelOfAuxiliaryInfoY,
                                               labelOfAuxiliaryInfoSize.width,
                                               labelOfAuxiliaryInfoSize.height);
    labelOfAuxiliaryInfo.frame        = labelOfAuxiliaryInfoRect;
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               labelOfAuxiliaryInfoY + labelOfAuxiliaryInfoSize.height + XFNTableViewCellControlSpacing,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    //标签-----------------------------------------------------------------------------------------
    CGPoint tempPoint = CGPointMake (0, (gridHorizontalLine.frame.origin.y + gridHorizontalLine.frame.size.height + XFNTableViewCellControlSpacing));
    
    UIView * labelView= [XFNWorkDetailTableViewCell initLabelUIViewWithArray: _labelsArray andOriginPoint: tempPoint];
    
    [self addSubview : labelView];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, (tempPoint.y +labelView.frame.size.height));
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNWorkDetailAuxiliaryInfoCellModel *cellModel = (XFNWorkDetailAuxiliaryInfoCellModel *)model;
    
    _labelsArray          = cellModel.labelsArray;
    
    [self initViewLayout];
}

@end