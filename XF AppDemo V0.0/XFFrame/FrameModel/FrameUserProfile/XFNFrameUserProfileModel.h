//
//  XFNFrameUserProfileModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/31.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrameUserProfileModel_h
#define XFNFrameUserProfileModel_h

#import <AVOSCloud/AVOSCloud.h>

@interface XFNFrameUserProfileModel : AVUser <AVSubclassing>

@property (nonatomic , copy) NSArray *followedItemArray;

@property (nonatomic , copy) NSArray *onTopItemArray;

+ (NSString *)parseClassName;

@end


#endif /* XFNFrameUserProfileModel_h */
