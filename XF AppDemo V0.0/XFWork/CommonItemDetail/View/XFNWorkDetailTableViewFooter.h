//
//  XFNWorkDetailTableViewFooter.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/6.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTableViewFooter_h
#define XFNWorkDetailTableViewFooter_h

#import <UIKit/UIKit.h>

#define _Macro_XFNWorkTableViewFooter_Height 42

@protocol XFNPushEditViewDelegate;

@interface XFNWorkDetailTableViewFooter : UIView
//-----------------------------------------------------------------------------------------
{
    UILabel *_commentLabel;
    UILabel *_followedLabel;
    UILabel *_moreLabel;
}

@property (nonatomic, assign) BOOL bIsFollowed;

@property (nonatomic,strong) id <XFNPushEditViewDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;
//-----------------------------------------------------------------------------------------
@end

#endif /* XFNWorkDetailTableViewFooter_h */
