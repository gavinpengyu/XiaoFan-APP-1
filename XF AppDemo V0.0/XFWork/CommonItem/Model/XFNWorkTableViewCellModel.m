 //
//  XFNWorkTableViewCellModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkTableViewCellModel.h"

@implementation XFNWorkTableViewCellModel

- (instancetype)initWithObject: (XFNFrameAssetModel*) assetModel
{
    XFNWorkTableViewCellModel *model = [[XFNWorkTableViewCellModel alloc] init];
    
    //po 20151128，虽然给_assetAllInfoModel类型转换为XFNFrameAssetModel，但实际上它还是AVObject类型，因此不能使用子类化访问
    _assetAllInfoModel = assetModel;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *tempSendTime = [dateFormatter stringFromDate: [_assetAllInfoModel objectForKey : @"updatedAt"]];
    
    model.nameString      = [[NSString alloc] initWithFormat : @"%@ | %@-%@-%@ | %@平米 | %@房%@卫",[_assetAllInfoModel objectForKey : @"communityName"],
                                                                                                              [_assetAllInfoModel objectForKey : @"buildingNumber"],
                                                                                                              [_assetAllInfoModel objectForKey : @"addedNumber"],
                                                                                                              [_assetAllInfoModel objectForKey : @"roomNumber"],
                                                                                                              [_assetAllInfoModel objectForKey : @"assetTotalArea"],
                                                                                                              [_assetAllInfoModel objectForKey : @"quantityOfRoom"],
                                                                                                              [_assetAllInfoModel objectForKey : @"quantityOfToilet"]];
    model.detailString    = [_assetAllInfoModel objectForKey : @"summaryInfoLabelsOfAsset"];
    model.priceString     = [[NSString alloc] initWithFormat : @"%@万", [_assetAllInfoModel objectForKey : @"assetTotalArea"]];
    model.statusString    = [_assetAllInfoModel objectForKey : @"assetStatus"];
    model.ownernameString = [_assetAllInfoModel objectForKey : @"attributeTo"];
    model.sendtimeString  = tempSendTime;
    model.ownerImage      = [UIImage imageNamed:@"TestOwnerImage"];//po 20151127，添加AVUser后，需要从AVUser中读取头像
    
    NSNumber *tempIsOnTop     = [_assetAllInfoModel objectForKey : @"bIsOnTop"];
    NSNumber *tempIsFollowed  = [_assetAllInfoModel objectForKey : @"bIsFollowed"];
    
    model.bThisItemIsOnTop    = tempIsOnTop.boolValue;
    model.bThisItemIsFollowed = tempIsFollowed.boolValue;
    
    return model;
}

@end