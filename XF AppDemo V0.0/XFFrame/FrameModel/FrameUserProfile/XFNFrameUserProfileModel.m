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

@dynamic followedItemArray;

@dynamic onTopItemArray;

+ (NSString *)parseClassName {
    return @"_User";
}

@end
