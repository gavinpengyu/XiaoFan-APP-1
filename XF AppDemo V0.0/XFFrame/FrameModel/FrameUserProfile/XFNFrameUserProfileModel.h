//
//  XFNFrameUserProfileModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/31.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrameUserProfileModel_h
#define XFNFrameUserProfileModel_h

@interface XFNFrameUserProfileModel : NSObject

@property (nonatomic, copy) NSString *useridstring;

+ (instancetype)initmodelWithuserID : (NSString *)userIdString;

@end


#endif /* XFNFrameUserProfileModel_h */
