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
    
    NSString *tempPrice   = [[NSString alloc] initWithFormat : @"%@", [_assetAllInfoModel objectForKey : @"assetTotalPrice"]];
    NSString *tempArea    = [[NSString alloc] initWithFormat : @"%@", [_assetAllInfoModel objectForKey : @"assetTotalArea"]];
    NSInteger unitPrice   = ([tempPrice integerValue] * 10000) / [tempArea integerValue]; //总价是以万为单位，因此此处要乘以10000
    
    model.nameString      = [[NSString alloc] initWithFormat : @"%@ | %@-%@-%@",[_assetAllInfoModel objectForKey : @"communityName"],
                                                                                [_assetAllInfoModel objectForKey : @"buildingNumber"],
                                                                                [_assetAllInfoModel objectForKey : @"addedNumber"],
                                                                                [_assetAllInfoModel objectForKey : @"roomNumber"]];
    
    model.detailString    = [[NSString alloc] initWithFormat : @"%@平米 | %@房%@卫 | %@元/平米", [_assetAllInfoModel objectForKey : @"assetTotalArea"],
                                                                                               [_assetAllInfoModel objectForKey : @"quantityOfRoom"],
                                                                                               [_assetAllInfoModel objectForKey : @"quantityOfToilet"],
                                                                                               [NSString stringWithFormat: @"%ld", unitPrice]];
    model.priceString     = [[NSString alloc] initWithFormat : @"%@万", tempPrice];
    model.statusString    = [_assetAllInfoModel objectForKey : @"assetStatus"];
    model.ownernameString = [_assetAllInfoModel objectForKey : @"attributeTo"];
    model.sendtimeString  = tempSendTime;
    model.ownerImage      = [UIImage imageNamed:@"TestOwnerImage"];//po 20151127，添加AVUser后，需要从AVUser中读取头像
    
    NSNumber *tempIsOnTop     = [_assetAllInfoModel objectForKey : @"bIsOnTop"];
    NSNumber *tempIsFollowed  = [_assetAllInfoModel objectForKey : @"bIsFollowed"];
    
    model.bThisItemIsOnTop    = tempIsOnTop.boolValue;
    model.bThisItemIsFollowed = tempIsFollowed.boolValue;
    
    NSString *tempLabelString = [_assetAllInfoModel objectForKey : @"summaryInfoLabelsOfAsset"];
    model.labelsArray         = [tempLabelString componentsSeparatedByString: _Macro_XFN_String_Seperator]; //服务器中，labels以字符串形式存放，label之间用_Macro_XFN_String_Seperator分隔
    
    return model;
}

@end