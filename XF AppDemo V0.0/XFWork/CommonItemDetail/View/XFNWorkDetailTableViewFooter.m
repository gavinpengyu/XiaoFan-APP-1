//
//  XFNWorkDetailTableViewFooter.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/6.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"

#import "XFNWorkDetailTableViewFooter.h"
#import "XFNWorkDetailTableViewController.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTableViewFooter

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self layoutSubviews];
    }
    return self;
}

- (void)initSubviews
{
    _commentLabel               = [[UILabel alloc] init];
    _commentLabel.text          = @"跟进";
    _commentLabel.textColor     = [UIColor grayColor];
    _commentLabel.textAlignment = NSTextAlignmentCenter;
    _commentLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : _commentLabel];
    
    _followedLabel           = [[UILabel alloc] init];
    if (_bIsFollowed)
    {
        _followedLabel.text = @"取消关注";
    }
    else
    {
        _followedLabel.text = @"关注";
    }
    _followedLabel.textColor     = [UIColor grayColor];
    _followedLabel.textAlignment = NSTextAlignmentCenter;
    _followedLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : _followedLabel];
    
    _moreLabel               = [[UILabel alloc] init];
    _moreLabel.text          = @"更多";
    _moreLabel.textColor     = [UIColor grayColor];
    _moreLabel.textAlignment = NSTextAlignmentCenter;
    _moreLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)];
    [self addSubview : _moreLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self initSubviews];
    
    //Layout－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    
    //跟进－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    CGFloat commentsLabelY      = self.frame.origin.y + XFNTableViewCellControlSpacing; //在Label下方
    CGFloat commentsLabelX      = self.frame.origin.x + XFNTableViewCellControlSpacing; //与detailLabel X对齐；
    CGSize  commentsLabelSize   = [_commentLabel.text sizeWithAttributes : @{NSFontAttributeName : _commentLabel.font}];
    commentsLabelSize.width     = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing*2) / 3; //底部分为3个按钮，跟进在最左侧
    commentsLabelSize.height    = commentsLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  commentsLabelRect   = CGRectMake(commentsLabelX,
                                             commentsLabelY,
                                             commentsLabelSize.width,
                                             commentsLabelSize.height);
    _commentLabel.frame         = commentsLabelRect;
    
    UIButton* commentButton     = [UIButton buttonWithType: UIButtonTypeCustom];
    commentButton.frame         = _commentLabel.frame;
    
    [commentButton addTarget : self action : @selector (toPushCommentView:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : commentButton];
    
    //关注－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_isFollowedLabel
    CGFloat isFollowedLabelY    = commentsLabelY; //与跟进Y对齐
    CGFloat isFollowedLabelX    = commentsLabelX + commentsLabelSize.width; //在跟进X的后面
    CGSize  isFollowedLabelSize = [_followedLabel.text sizeWithAttributes : @{NSFontAttributeName : _followedLabel.font}];
    isFollowedLabelSize.width   = commentsLabelSize.width;//底部分为3个按钮，关注在最中间
    isFollowedLabelSize.height  = isFollowedLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  isFollowedLabelRect = CGRectMake(isFollowedLabelX,
                                             isFollowedLabelY,
                                             isFollowedLabelSize.width,
                                             isFollowedLabelSize.height);
    _followedLabel.frame      = isFollowedLabelRect;
    
    //在“关注”的前方添加一条分割竖线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UIView * gridVerticalLineOne = [[UIView alloc] initWithFrame: CGRectMake (isFollowedLabelX,
                                                                              isFollowedLabelY + 2,
                                                                              _Macro_XFNWorTableViewCellVerticalSeperatorWidth,
                                                                              isFollowedLabelSize.height - 4)];
    gridVerticalLineOne.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridVerticalLineOne];
    
    //更多－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_moreActionLabel
    CGFloat moreActionLabelY    = commentsLabelY; //与跟进Y对齐
    CGFloat moreActionLabelX    = isFollowedLabelX + isFollowedLabelSize.width; //在关注X的后面
    CGSize  moreActionLabelSize = [_moreLabel.text sizeWithAttributes : @{NSFontAttributeName : _moreLabel.font}];
    moreActionLabelSize.width   = commentsLabelSize.width;//底部分为3个按钮，更多在最右侧
    moreActionLabelSize.height  = moreActionLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  moreActionLabelRect = CGRectMake(moreActionLabelX,
                                             moreActionLabelY,
                                             moreActionLabelSize.width,
                                             moreActionLabelSize.height);
    _moreLabel.frame      = moreActionLabelRect;
    
    //在“更多”的前方添加一条分割竖线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UIView * gridVerticalLineTwo = [[UIView alloc] initWithFrame: CGRectMake (moreActionLabelX,
                                                                              moreActionLabelY + 2,
                                                                              _Macro_XFNWorTableViewCellVerticalSeperatorWidth,
                                                                              moreActionLabelSize.height - 4)];
    gridVerticalLineTwo.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridVerticalLineTwo];
}

- (void) toPushCommentView: (id)sender
{
    [self.delegate toPushViewForComment];
}

@end
