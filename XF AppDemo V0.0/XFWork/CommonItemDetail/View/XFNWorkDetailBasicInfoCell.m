//
//  XFNWorkDetailBasicInfoCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"

#import "XFNWorkDetailBasicInfoCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailBasicInfoCell
{
    UILabel * labelOfBasicInfo;
    UILabel * labelOfArea;
    UILabel * labelOfSharedArea;
    UILabel * labelOfLayout;
    UILabel * labelOfStorey;
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

- (void) initSubView
{
    _areaLabel                     = [[UILabel alloc] init];
    _areaLabel.textColor           = [UIColor blackColor];
    _areaLabel.font                = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _areaLabel];
    
    _unitLayoutLabel               = [[UILabel alloc] init];
    _unitLayoutLabel.textColor     = [UIColor blackColor];
    _unitLayoutLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _unitLayoutLabel];
    
    _sharedAreaLabel               = [[UILabel alloc] init];
    _sharedAreaLabel.textColor     = [UIColor blackColor];
    _sharedAreaLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _sharedAreaLabel];
    
    _storeyLabel                   = [[UILabel alloc] init];
    _storeyLabel.textColor         = [UIColor blackColor];
    _storeyLabel.font              = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _storeyLabel];
    
    labelOfBasicInfo               = [[UILabel alloc] init];
    labelOfBasicInfo.text          = @"基本信息";
    labelOfBasicInfo.textColor     = [UIColor lightGrayColor];
    labelOfBasicInfo.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : labelOfBasicInfo];
    
    labelOfArea                    = [[UILabel alloc] init];
    labelOfArea.text               = @"面积：";
    labelOfArea.textColor          = [UIColor lightGrayColor];
    labelOfArea.font               = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : labelOfArea];
    
    labelOfSharedArea              = [[UILabel alloc] init];
    labelOfSharedArea.text         = @"分摊：";
    labelOfSharedArea.textColor    = [UIColor lightGrayColor];
    labelOfSharedArea.font         = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : labelOfSharedArea];
    
    labelOfLayout                  = [[UILabel alloc] init];
    labelOfLayout.text             = @"房型：";
    labelOfLayout.textColor        = [UIColor lightGrayColor];
    labelOfLayout.font             = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : labelOfLayout];
    
    labelOfStorey                  = [[UILabel alloc] init];
    labelOfStorey.text             = @"楼层：";
    labelOfStorey.textColor        = [UIColor lightGrayColor];
    labelOfStorey.font             = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : labelOfStorey];
}

- (void) initViewLayout
{
    CGRect mainScreenRect       = [[UIScreen mainScreen] bounds];
    CGSize mainScreenSize       = mainScreenRect.size;
    
    /* View
     
      基本信息
     －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
      面积   105平米                       房型    3房2卫
     
      分摊   22平米                        楼层    8/12
     
     */
    
    
    //-----------------------------------------------------------------------------------------
    CGFloat labelOfBasicInfoX     = XFNTableViewCellControlSpacing;
    CGFloat labelOfBasicInfoY     = XFNTableViewCellControlSpacing;
    CGSize  labelOfBasicInfoSize  = [labelOfBasicInfo.text sizeWithAttributes : @{NSFontAttributeName : labelOfBasicInfo.font}];
    CGRect  labelOfBasicInfoRect  = CGRectMake(labelOfBasicInfoX,
                                               labelOfBasicInfoY,
                                               labelOfBasicInfoSize.width,
                                               labelOfBasicInfoSize.height);
    labelOfBasicInfo.frame        = labelOfBasicInfoRect;
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               labelOfBasicInfoY + labelOfBasicInfoSize.height + XFNTableViewCellControlSpacing,
                                                                               mainScreenSize.width - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    //面积-----------------------------------------------------------------------------------------
    CGFloat labelOfAreaX          = XFNTableViewCellControlSpacing;
    CGFloat labelOfAreaY          = labelOfBasicInfoY + labelOfBasicInfoSize.height + XFNTableViewCellControlSpacing * 2;
    CGSize  labelOfAreaSize       = [labelOfArea.text sizeWithAttributes : @{NSFontAttributeName : labelOfArea.font}];
    CGRect  labelOfAreaRect       = CGRectMake(labelOfAreaX,
                                               labelOfAreaY,
                                               labelOfAreaSize.width,
                                               labelOfAreaSize.height);
    labelOfArea.frame             = labelOfAreaRect;
    
    CGFloat areaLabelX     = labelOfAreaX + labelOfAreaSize.width + XFNTableViewCellControlSpacing;
    CGSize  areaLabelSize  = [_areaLabel.text sizeWithAttributes : @{NSFontAttributeName : _areaLabel.font}];
    CGFloat areaLabelY     = labelOfAreaY + labelOfAreaSize.height - areaLabelSize.height;
    CGRect  areaLabelRect  = CGRectMake(areaLabelX,
                                        areaLabelY,
                                        areaLabelSize.width,
                                        areaLabelSize.height);
    _areaLabel.frame       = areaLabelRect;
    
    //房型-----------------------------------------------------------------------------------------
    CGFloat labelOfLayoutX          = XFNTableViewCellControlSpacing * 20;
    CGFloat labelOfLayoutY          = labelOfAreaY;
    CGSize  labelOfLayoutSize       = [labelOfLayout.text sizeWithAttributes : @{NSFontAttributeName : labelOfLayout.font}];
    CGRect  labelOfLayoutRect       = CGRectMake(labelOfLayoutX,
                                                 labelOfLayoutY,
                                                 labelOfLayoutSize.width,
                                                 labelOfLayoutSize.height);
    labelOfLayout.frame             = labelOfLayoutRect;
    
    CGFloat unitLayoutLabelX     = labelOfLayoutX + labelOfLayoutSize.width + XFNTableViewCellControlSpacing;
    CGSize  unitLayoutLabelSize  = [_unitLayoutLabel.text sizeWithAttributes : @{NSFontAttributeName : _unitLayoutLabel.font}];
    CGFloat unitLayoutLabelY     = labelOfLayoutY + labelOfLayoutSize.height - unitLayoutLabelSize.height;
    CGRect  unitLayoutLabelRect  = CGRectMake(unitLayoutLabelX,
                                              unitLayoutLabelY,
                                              unitLayoutLabelSize.width,
                                              unitLayoutLabelSize.height);
    _unitLayoutLabel.frame       = unitLayoutLabelRect;
    
    //分摊-----------------------------------------------------------------------------------------
    CGFloat labelOfSharedAreaX          = XFNTableViewCellControlSpacing;
    CGFloat labelOfSharedAreaY          = labelOfAreaY + labelOfAreaSize.height + XFNTableViewCellControlSpacing;
    CGSize  labelOfSharedAreaSize       = [labelOfSharedArea.text sizeWithAttributes : @{NSFontAttributeName : labelOfSharedArea.font}];
    CGRect  labelOfSharedAreaRect       = CGRectMake(labelOfSharedAreaX,
                                                     labelOfSharedAreaY,
                                                     labelOfSharedAreaSize.width,
                                                     labelOfSharedAreaSize.height);
    labelOfSharedArea.frame             = labelOfSharedAreaRect;
    
    CGFloat sharedAreaLabelX     = labelOfSharedAreaX + labelOfSharedAreaSize.width + XFNTableViewCellControlSpacing;
    CGSize  sharedAreaLabelSize  = [_sharedAreaLabel.text sizeWithAttributes : @{NSFontAttributeName : _sharedAreaLabel.font}];
    CGFloat sharedAreaLabelY     = labelOfSharedAreaY + labelOfSharedAreaSize.height - sharedAreaLabelSize.height;
    CGRect  sharedAreaLabelRect  = CGRectMake(sharedAreaLabelX,
                                              sharedAreaLabelY,
                                              sharedAreaLabelSize.width,
                                              sharedAreaLabelSize.height);
    _sharedAreaLabel.frame       = sharedAreaLabelRect;
    
    //楼层-----------------------------------------------------------------------------------------
    CGFloat labelOfStoreyX          = XFNTableViewCellControlSpacing * 20;
    CGFloat labelOfStoreyY          = labelOfSharedAreaY;
    CGSize  labelOfStoreySize       = [labelOfStorey.text sizeWithAttributes : @{NSFontAttributeName : labelOfStorey.font}];
    CGRect  labelOfStoreyRect       = CGRectMake(labelOfStoreyX,
                                                 labelOfStoreyY,
                                                 labelOfStoreySize.width,
                                                 labelOfStoreySize.height);
    labelOfStorey.frame             = labelOfStoreyRect;
    
    CGFloat storeyLabelX     = labelOfStoreyX + labelOfStoreySize.width + XFNTableViewCellControlSpacing;
    CGSize  storeyLabelSize  = [_storeyLabel.text sizeWithAttributes : @{NSFontAttributeName : _storeyLabel.font}];
    CGFloat storeyLabelY     = labelOfStoreyY + labelOfStoreySize.height - storeyLabelSize.height;
    CGRect  storeyLabelRect  = CGRectMake(storeyLabelX,
                                          storeyLabelY,
                                          storeyLabelSize.width,
                                          storeyLabelSize.height);
    _storeyLabel.frame       = storeyLabelRect;

    //标签-----------------------------------------------------------------------------------------
    
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = areaLabelRect;
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNWorkDetailBasicInfoCellModel *cellModel = (XFNWorkDetailBasicInfoCellModel *)model;
    
    _areaLabel.text       = cellModel.areaString;
    _unitLayoutLabel.text = cellModel.unitLayoutString;
    _sharedAreaLabel.text = cellModel.sharedAreaString;
    _storeyLabel.text     = cellModel.storeyString;
    
    _labelsArray = cellModel.labelsArray;
    
    [self initViewLayout];
}

@end