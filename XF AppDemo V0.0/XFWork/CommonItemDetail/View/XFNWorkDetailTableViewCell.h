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

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTableViewCell : XFNFrameTableViewControllerCell

+ (UILabel*)initLabelWithTextColor: (UIColor*) color andFont: (UIFont*) font;

+ (UIView*) initLabelUIViewWithArray: (NSArray*) array andOriginPoint: (CGPoint) origin;

+ (NSArray*)arrayFromString: (NSString*) string  withFont: (UIFont*) font splitedByLimitedScreenWidth: (CGFloat) width;

@end

#endif /* XFNWorkDetailTableViewCell_h */
