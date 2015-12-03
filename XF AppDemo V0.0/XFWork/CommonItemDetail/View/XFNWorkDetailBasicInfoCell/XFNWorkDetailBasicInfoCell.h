//
//  XFNWorkDetailBasicInfoCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailBasicInfoCell_h
#define XFNWorkDetailBasicInfoCell_h

#import "XFNWorkDetailTableViewCell.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailBasicInfoCell : XFNWorkDetailTableViewCell
{
    UILabel  *_areaLabel;
    UILabel  *_unitLayoutLabel;
    UILabel  *_sharedAreaLabel;
    UILabel  *_storeyLabel;
    
    NSArray  *_labelsArray;
}

- (void)setModel:(NSObject *)model;

@end

#endif /* XFNWorkDetailBasicInfoCell_h */
