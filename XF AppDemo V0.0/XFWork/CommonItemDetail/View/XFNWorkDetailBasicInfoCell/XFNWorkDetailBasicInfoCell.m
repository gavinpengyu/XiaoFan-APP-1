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
#import "XFNFrameTableViewController.h"
#import "XFNFrameTableViewControllerCell.h"

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
    _areaLabel          = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _areaLabel];

    _unitLayoutLabel    = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _unitLayoutLabel];
    
    _sharedAreaLabel    = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _sharedAreaLabel];
    
    _storeyLabel        = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)]];
    [self addSubview : _storeyLabel];
    

    labelOfBasicInfo = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfBasicInfo];
    labelOfBasicInfo.text = @"基本信息";
    
    labelOfArea      = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfArea];
    labelOfArea.text      = @"面积：";
    
    labelOfSharedArea= [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfSharedArea];
    labelOfSharedArea.text= @"分摊：";
    
    labelOfLayout    = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfLayout];
    labelOfLayout.text    = @"房型：";
    
    labelOfStorey    = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                     andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfStorey];
    labelOfStorey.text    = @"楼层：";
}

- (void) initViewLayout
{
    /* View
     
      基本信息
     －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
      面积   105平米                       房型    3房2卫
     
      分摊   22平米                        楼层    8/12
     
     东边套 有明卫 双朝向 单阳台 楼距大
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
                                                                               labelOfBasicInfoY + labelOfBasicInfoSize.height + XFNTableViewCellControlSpacing/2,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
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
    CGFloat labelOfLayoutX          = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2)/2 - XFNTableViewCellControlSpacing * 2; //屏幕正中偏左侧两个space
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
    CGFloat labelOfStoreyX          = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2)/2 - XFNTableViewCellControlSpacing * 2; //屏幕正中偏左侧两个space
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
    CGPoint tempPoint = CGPointMake (0, (_storeyLabel.frame.origin.y + _storeyLabel.frame.size.height + XFNTableViewCellControlSpacing));
    
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
    
    [accessoryActionButton addTarget:self action:@selector(pushViewForEditBasicInfo:) forControlEvents: UIControlEventTouchDown];

    [self addSubview: accessoryActionButton];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
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

//selector-----------------------------------------------------------------------------------------
-(void) pushViewForEditBasicInfo:(id)sender
{
    [self.delegate toPushViewForEditBasicInfo];
}


@end