//
//  XFNMeTableViewModel.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/27.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNMeTableViewModel_h
#define XFNMeTableViewModel_h

#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrameUserProfileModel.h"

@interface XFNMeTableViewModel : XFNFrameUserProfileModel

@property (nonatomic,strong) XFNMeTableViewModel* model;

- (void)setModel:(XFNMeTableViewModel *)model;

@end

#endif /* XFNMeTableViewModel_h */
