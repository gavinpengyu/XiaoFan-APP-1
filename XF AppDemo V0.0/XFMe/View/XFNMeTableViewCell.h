//
//  XFNMeTableViewCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/27.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNMeTableViewCell_h
#define XFNMeTableViewCell_h

#import "XFNFrameTableViewControllerCell.h"

//-----------------------------------------------------------------------------------------
@interface XFNMeTableViewCell : XFNFrameTableViewControllerCell
{
    UILabel* _userName;
    UILabel* _userPhone;
}

- (void) setModel:(XFNMeTableViewModel *)model;

@end

//-----------------------------------------------------------------------------------------
@interface XFNMeTableViewCellSection0Row0 : XFNMeTableViewCell

- (void) initViewLayout;

@end

//-----------------------------------------------------------------------------------------
@interface XFNMeTableViewCellSection0Row1 : XFNMeTableViewCell

- (void) initViewLayout;

@end

//-----------------------------------------------------------------------------------------
@interface XFNMeTableViewCellSection1Row0 : XFNMeTableViewCell

- (void) initViewLayout;

@end

#endif /* XFNMeTableViewCell_h */
