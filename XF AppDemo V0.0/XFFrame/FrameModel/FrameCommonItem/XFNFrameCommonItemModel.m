//
//  XFNFrameCommonItemModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/31.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrameCommonItemModel.h"

@implementation XFNFrameCommonItemModel

+ (instancetype)initmodelWithname : (NSString *)nameString
                           detail : (NSString *)detailString
                            price : (NSString *)priceString
                           status : (NSString *)statusString
                        ownername : (NSString *)ownernameString
                         sendtime : (NSString *)sendtimeString
                       ownerimage : (UIImage *) ownerImage
{
    XFNFrameCommonItemModel *model = [[XFNFrameCommonItemModel alloc] init];
    model.nameString = nameString;
    model.detailString = detailString;
    model.priceString = priceString;
    model.statusString = statusString;
    model.ownernameString = ownernameString;
    model.sendtimeString = sendtimeString;
    model.ownerImage = ownerImage;
    return model;
}

@end