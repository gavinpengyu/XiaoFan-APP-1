//
//  XFNWorkDetailContactInfoCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailContactInfoCell_h
#define XFNWorkDetailContactInfoCell_h


#import "XFNWorkDetailTableViewCell.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailContactInfoCell : XFNWorkDetailTableViewCell
{
    NSArray * _contactsArray;
    NSArray * _labelsArray;
}

- (void)setModel:(NSObject *)model;

+ (UIView*) initContactUIViewWithArray: (NSArray*) array andOriginPoint: (CGPoint) origin andFont: (UIFont*) font andColor: (UIColor*) color;

@end

#endif /* XFNWorkDetailContactInfoCell_h */
