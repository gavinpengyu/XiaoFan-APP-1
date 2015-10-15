//
//  XFWorkTableViewCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFWorkTableViewCell_h
#define XFWorkTableViewCell_h

#import "XFFrameTableViewControllerCell.h"

@interface XFWorkTableViewCell : XFFrameTableViewControllerCell

@property (weak, nonatomic) IBOutlet UILabel *followedLabel;
@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;
@property (weak, nonatomic) IBOutlet UILabel *details0Label;
@property (weak, nonatomic) IBOutlet UILabel *details1Label;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
//po,20151015,需在此处link buttoms

@end

#endif /* XFWorkTableViewCell_h */
