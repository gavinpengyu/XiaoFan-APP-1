//
//  XFNFrameAssetModel.h
//  XF AppDemo V0.0
//
//  Created by po on 15/11/13.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrameAssetModel_h
#define XFNFrameAssetModel_h

#import <AVOSCloud/AVOSCloud.h>

@interface XFNFrameAssetModel : AVObject <AVSubclassing>

#pragma mark Address Information
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *communityName;     //小区名
@property (nonatomic , copy) NSString *buildingNo;        //
@property (nonatomic , copy) NSString *roomNo;
@property (nonatomic , copy) NSString *assetType;

#pragma mark Basic Information
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *area;              //
@property (nonatomic , copy) NSString *sharedArea;
@property (nonatomic , copy) NSString *storey;
@property (nonatomic , copy) NSString *storyOfAll;
@property (nonatomic , copy) NSString *orientation;

#pragma mark Unit Type Information
//-------------------------------------------------------------------------------------
@property (nonatomic , assign) NSInteger quantityOfRoom;              //
@property (nonatomic , assign) NSInteger quantityOfHall;              //
@property (nonatomic , assign) NSInteger quantityOfKitchen;              //
@property (nonatomic , assign) NSInteger quantityOfToilet;              //
@property (nonatomic , assign) NSInteger quantityOfBalcony;              //

#pragma mark Status Attribute Price Information
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *status;              //
@property (nonatomic , copy) NSString *attribute;
@property (nonatomic , copy) NSString *price;
@property (nonatomic , copy) NSArray  *statusAttributePriceHistory;

#pragma mark Tax Information
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *businessTax;              //营业税
@property (nonatomic , copy) NSString *valueAddedTax;//增值税
@property (nonatomic , copy) NSString *stampTax;//印花税
@property (nonatomic , copy) NSString *incomeTax;//所得税

#pragma mark Ancillary Facility Information
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *decorationGrade;              //
@property (nonatomic , copy) NSString *priceOfDecoration;

@property (nonatomic , copy) NSString *furnitureList;              //
@property (nonatomic , copy) NSString *furnitureRemark;

@property (nonatomic , copy) NSString *EquipmentList;              //
@property (nonatomic , copy) NSString *EquipmentRemark;

#pragma mark Pictures Information
//-------------------------------------------------------------------------------------

#pragma mark Owener Label Information
//-------------------------------------------------------------------------------------


@end

#endif /* XFNFrameAssetModel_h */
