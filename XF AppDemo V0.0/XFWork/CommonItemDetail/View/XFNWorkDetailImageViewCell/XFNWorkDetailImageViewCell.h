//
//  XFNWorkDetailImageViewCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailImageViewCell_h
#define XFNWorkDetailImageViewCell_h

#import "XFNFrameTableViewControllerCell.h"
#import "XFNImageSlideViewController.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailImageViewCell : XFNFrameTableViewControllerCell <XFNImageSlideViewControllerDelegate>

@property (nonatomic, strong) XFNImageSlideViewController *imageSlideVC;

- (void)setModel:(NSObject *)model;

@end


//-----------------------------------------------------------------------------------------


#endif /* XFNWorkDetailImageViewCell_h */
