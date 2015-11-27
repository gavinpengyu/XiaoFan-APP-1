 //
//  XFNWorkTableViewCellModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNWorkTableViewCellModel.h"

@implementation XFNWorkTableViewCellModel

+ (instancetype)initWithObject: (XFNFrameAssetModel*) assetModel
{
    XFNWorkTableViewCellModel *model = [[XFNWorkTableViewCellModel alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *tempSendTime = [dateFormatter stringFromDate: assetModel.updatedAt];
    
    model.nameString      = [[NSString alloc] initWithFormat : @"%@|%@栋|%@单元|%@",assetModel.communityName, assetModel.buildingNumber, assetModel.addedNumber, assetModel.roomNumber];
    model.detailString    = assetModel.summaryInfoLabelsOfAsset;
    model.priceString     = assetModel.assetTotalArea;
    model.statusString    = assetModel.assetStatus;
    model.ownernameString = assetModel.attributeTo;
    model.sendtimeString  = tempSendTime;
    model.ownerImage      = [UIImage imageNamed:@"TestOwnerImage"];//po 20151127，添加AVUser后，需要从AVUser中读取头像
    
    model.assetAllInfoModel = assetModel;
    
    return model;
}

@end