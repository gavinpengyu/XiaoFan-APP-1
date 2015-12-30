//
//  XFNWorkDetailContactInfoCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"
#import "XFNWorkTableViewCell.h" //需要使用类方法获取标签颜色
#import "XFNWorkDetailTableViewController.h"
#import "XFNWorkDetailContactInfoCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailContactInfoCell
{
    UILabel * labelOfContactInfo;
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
    labelOfContactInfo   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                    andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfContactInfo];
    labelOfContactInfo.text  = @"联系人";
}

- (void)initViewLayout
{
    /* View
     
     联系人
     －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
     王先生 ｜ 业主 ｜ 13900001111/18611110000
     
     王太太 ｜ 家人 ｜ 13900001111/
     
      --------------------------------------------------------------------
        王先生：| 公务员  |  难说话
        
        王先生：| 身材好  |  好说话
     */
    
    //-----------------------------------------------------------------------------------------
    CGFloat labelOfContactInfoX     = XFNTableViewCellControlSpacing;
    CGFloat labelOfContactInfoY     = XFNTableViewCellControlSpacing;
    CGSize  labelOfContactInfoSize  = [labelOfContactInfo.text sizeWithAttributes : @{NSFontAttributeName : labelOfContactInfo.font}];
    CGRect  labelOfContactInfoRect  = CGRectMake(labelOfContactInfoX,
                                                 labelOfContactInfoY,
                                                 labelOfContactInfoSize.width,
                                                 labelOfContactInfoSize.height);
    labelOfContactInfo.frame        = labelOfContactInfoRect;
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               labelOfContactInfoY + labelOfContactInfoSize.height + XFNTableViewCellControlSpacing/2,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    //联系人信息-----------------------------------------------------------------------------------------
    CGPoint tempPoint = CGPointMake (0, (gridHorizontalLine.frame.origin.y + gridHorizontalLine.frame.size.height + XFNTableViewCellControlSpacing));
    
    UIView * contactView= [XFNWorkDetailContactInfoCell initContactUIViewWithArray: _contactsArray
                                                                    andOriginPoint: tempPoint
                                                                           andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]
                                                                          andColor: [UIColor blackColor]];
    
    [self addSubview : contactView];
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLineTwo = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing * 2,
                                                                               contactView.frame.origin.y + contactView.frame.size.height + XFNTableViewCellControlSpacing/2,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 4,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLineTwo.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLineTwo];
    
    //联系人信息-----------------------------------------------------------------------------------------
    CGPoint tempPointTwo = CGPointMake (XFNTableViewCellControlSpacing, (gridHorizontalLineTwo.frame.origin.y + gridHorizontalLineTwo.frame.size.height + XFNTableViewCellControlSpacing));
    
    UIView * labelsView  = [XFNWorkDetailContactInfoCell initContactUIViewWithArray: _labelsArray
                                                                     andOriginPoint: tempPointTwo
                                                                            andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]
                                                                           andColor: [UIColor lightGrayColor]];
    
    [self addSubview : labelsView];
    
    CGFloat cellHeight = (tempPointTwo.y +labelsView.frame.size.height);
    
    CGFloat buttonY    =  gridHorizontalLine.frame.origin.y - XFNTableViewCellControlSpacing/2 - _Macro_XFNWorkDetailTableView_Accessory_Height;
    //手写cell最右侧的操作按钮
    UIButton* accessoryActionButton = [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
    //离屏幕最右侧一个space距离，离cell的手动分割线高度为_Macro_XFNWorkDetailTableView_Accessory_Height
    accessoryActionButton.frame     = CGRectMake((_Macro_ScreenWidth - XFNTableViewCellControlSpacing - _Macro_XFNWorkDetailTableView_Accessory_Width),
                                                 buttonY,
                                                 _Macro_XFNWorkDetailTableView_Accessory_Width,
                                                 _Macro_XFNWorkDetailTableView_Accessory_Height);
    
    [accessoryActionButton addTarget:self action:@selector(pushViewForEditContactInfo:) forControlEvents: UIControlEventTouchDown];
    
    [self addSubview: accessoryActionButton];

    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
}

+ (UIView*) initContactUIViewWithArray: (NSArray*) array andOriginPoint: (CGPoint) origin andFont: (UIFont*) font andColor: (UIColor*) color
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    
    if (nil == array)
    {
        return view;
    }
    
    CGRect tempRect = CGRectMake(0,0,0,0);
    
    CGFloat tempLabelX            = origin.x + XFNTableViewCellControlSpacing;
    CGFloat tempLabelY            = 0; //UIView是从origin.y开始布局，但是label在UIview的内部，应该是从0开始
    
    for (int iIndex=0; iIndex < array.count; iIndex++)
    {
        UILabel * tempLabel   = [[UILabel alloc] init];
        tempLabel.text        = array[iIndex];
        tempLabel.textColor   = color;
        tempLabel.font        = font;
        
        CGSize  tempLabelSize = [tempLabel.text sizeWithAttributes : @{NSFontAttributeName : tempLabel.font}];
        CGRect  tempLabelRect = CGRectMake(tempLabelX,
                                           tempLabelY,
                                           tempLabelSize.width,
                                           tempLabelSize.height);
        
        tempLabel.frame = tempLabelRect;
        [view addSubview: tempLabel];
        
        //每行只放一个label，始终左对齐
        tempLabelY            = tempLabelY + tempLabelSize.height+ XFNTableViewCellControlSpacing;
        tempRect              = CGRectMake(origin.x, origin.y, (_Macro_ScreenWidth - origin.x), (tempLabelY-XFNTableViewCellControlSpacing));
    }
    
    view.frame = tempRect;
    return view;
}


- (void)setModel:(NSObject *)model
{
    [super setModel:model]; //XFNWorkDetailContactInfoCellModel
    
    XFNWorkDetailContactInfoCellModel *cellModel = (XFNWorkDetailContactInfoCellModel *)model;
    
    _contactsArray  = cellModel.contactsArray;
    _labelsArray    = cellModel.labelsArray;
    
    [self initViewLayout];
}

//selector-----------------------------------------------------------------------------------------
-(void) pushViewForEditContactInfo:(id)sender
{
    [self.delegate toPushViewForEditContactInfo];
}

@end






















