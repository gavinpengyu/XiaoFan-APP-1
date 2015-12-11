//
//  XFNFrameUserProfileModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/31.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XFNFrameUserProfileModel.h"


@implementation XFNFrameUserProfileModel
{
    NSString* _useridstring;
    NSString* userpasswordstring;
    
    NSString* usernamestring;
    UIImage*  userheadimage;
    NSString* usergenderstring;
    NSString* useraddressstring;
    NSString* userareastring;
    NSString* usernicknamestring;
    NSString* usermobilestring;
    NSString* userphonestring;
    NSString* useremailstring;
}

+ (instancetype)initmodelWithuserID : (NSString *)userIdString
{
    XFNFrameUserProfileModel *model = [[XFNFrameUserProfileModel alloc] init];
    model.useridstring = userIdString;
    return model;
}


@end
