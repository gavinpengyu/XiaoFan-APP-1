//
//  XFNWorkDetailTableViewCell.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTableViewCell_h
#define XFNWorkDetailTableViewCell_h

#import "XFNFrameTableViewControllerCell.h"
#import "XFNWorkDetailTableViewController.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTableViewCell : XFNFrameTableViewControllerCell

+ (UILabel*)initLabelWithTextColor: (UIColor*) color andFont: (UIFont*) font;

+ (UIView*) initLabelUIViewWithArray: (NSArray*) array andOriginPoint: (CGPoint) origin;

+ (UIView*) initCommentBarUIViewWithFont: (UIFont*) font andOriginPoint: (CGPoint) origin andIsFollowedFlag: (BOOL) flag;

+ (NSArray*)arrayFromString: (NSString*) string  withFont: (UIFont*) font splitedByLimitedScreenWidth: (CGFloat) width;

@end

#endif /* XFNWorkDetailTableViewCell_h */
