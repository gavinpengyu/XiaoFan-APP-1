//
//  XFNWorkDetailAuxiliaryInfoCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailAuxiliaryInfoCell_h
#define XFNWorkDetailAuxiliaryInfoCell_h

#import "XFNWorkDetailTableViewCell.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailAuxiliaryInfoCell : XFNWorkDetailTableViewCell
{
    NSArray  *_labelsArray;
}
- (void)setModel:(NSObject *)model;

@end

#endif /* XFNWorkDetailAuxiliaryInfoCell_h */
