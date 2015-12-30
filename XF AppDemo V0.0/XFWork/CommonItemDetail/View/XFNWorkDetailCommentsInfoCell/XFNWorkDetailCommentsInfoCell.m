//
//  XFNWorkDetailCommentsInfoCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"

#import "XFNWorkDetailCommentsInfoCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailCommentsInfoCell
{
    UILabel * labelOfCommentsInfo;
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
    labelOfCommentsInfo   = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor lightGrayColor]
                                                                      andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)]];
    [self addSubview : labelOfCommentsInfo];
    labelOfCommentsInfo.text  = @"跟进记录";
}


- (void)initViewLayout
{
    /* View
     
     跟进记录
     －－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
       头像上  童虎 2015-10-10 17:21
     
       头像下  价格：245万 -> 240万
       --------------------------------------------------------------------
       头像上  飞鸟 2015-10-09 17:21
     
       头像下  归属：飞鸟 -> 童虎
       --------------------------------------------------------------------
       头像上  飞鸟 2015-10-09 17:20
     
       头像下  归属：飞鸟 创建房源

     */
    
    //-----------------------------------------------------------------------------------------
    CGFloat labelOfCommentsInfoX     = XFNTableViewCellControlSpacing;
    CGFloat labelOfCommentsInfoY     = XFNTableViewCellControlSpacing;
    CGSize  labelOfCommentsInfoSize  = [labelOfCommentsInfo.text sizeWithAttributes : @{NSFontAttributeName : labelOfCommentsInfo.font}];
    CGRect  labelOfCommentsInfoRect  = CGRectMake(labelOfCommentsInfoX,
                                                 labelOfCommentsInfoY,
                                                 labelOfCommentsInfoSize.width,
                                                 labelOfCommentsInfoSize.height);
    labelOfCommentsInfo.frame        = labelOfCommentsInfoRect;
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLine   = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing,
                                                                               labelOfCommentsInfoY + labelOfCommentsInfoSize.height + XFNTableViewCellControlSpacing/2,
                                                                               _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                                                               _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    _commentsTableVC            = [[XFNDetailCommentsTableViewController alloc] init];
    
    //protocol 将comments发送至tableview
    self.delegate = _commentsTableVC;
    [self.delegate toSendCommentswithArray: _commentsArray];
    
    CGRect commentsTableVCRect  = [self.delegate getTabelViewCGRect];
    //DLog(@"x=%f, y=%f, width=%f, height=%f", commentsTableVCRect.origin.x, commentsTableVCRect.origin.y, commentsTableVCRect.size.width, commentsTableVCRect.size.height);
    _commentsTableVC.view.frame = CGRectMake(0,
                                            (gridHorizontalLine.frame.origin.y + gridHorizontalLine.frame.size.height),
                                             _Macro_ScreenWidth,
                                             commentsTableVCRect.size.height);//po 20151205，如果直接固定tableview的高度，则tableview里面cell很多的时候，最下面的看不到；如果不固定，则会在操作的时候很容易进到tableview里面，无法返回detailview
    
    [self addSubview: _commentsTableVC.view];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,
                             0,
                             _Macro_ScreenWidth,
                             (_commentsTableVC.view.frame.origin.y + _commentsTableVC.view.frame.size.height));
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model]; //XFNWorkDetailContactInfoCellModel
    
    XFNWorkDetailCommentsInfoCellModel *cellModel = (XFNWorkDetailCommentsInfoCellModel *)model;
    
    _commentsArray  = cellModel.commentsArray;
    
    [self initViewLayout];
}

@end









































