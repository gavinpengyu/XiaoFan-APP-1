//
//  XFNWorkTableViewHeader.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/1.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkTableViewHeader_h
#define XFNWorkTableViewHeader_h

#import <UIKit/UIKit.h>

#define _Macro_XFNWorkTableViewHearder_Height 30

@protocol XFNHeaderToControllerDelegate;

@interface XFNWorkTableViewHeader : UIView
//-----------------------------------------------------------------------------------------
{
    UILabel *_headLabelA;
    UILabel *_headLabelB;
    UILabel *_headLabelC;
    UILabel *_headLabelD;

    UILabel *_configHeadLabel; //只显示，暂不实现功能 po 20151201
}

@property (nonatomic,strong) id <XFNHeaderToControllerDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;
//-----------------------------------------------------------------------------------------
@end

#endif /* XFNWorkTableViewHeader_h */
