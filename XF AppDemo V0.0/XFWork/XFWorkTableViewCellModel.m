//
//  XFWorkTableViewCellModel.m
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFWorkTableViewCellModel.h"

@implementation XFWorkTableViewCellModel

+ (instancetype)modelWithFollowed : (NSString *)followedString
                      ownerString : (NSString *)ownerString
                   details0String : (NSString *)details0String
                   details1String : (NSString *)details1String
                      priceString : (NSString *)priceString
{
    XFWorkTableViewCellModel *model = [[XFWorkTableViewCellModel alloc] init];
    model.followedString = followedString;
    model.ownerString = ownerString;
    model.details0String = details0String;
    model.details1String = details1String;
    model.priceString = priceString;
    return model;
}

@end