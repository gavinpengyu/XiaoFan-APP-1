//
//  XFNFrameAssetModel.m
//  XF AppDemo V0.0
//
//  Created by po on 15/11/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNFrame.h"
#import "XFNFrameAssetModel.h"

@implementation XFNFrameAssetModel

#pragma mark Address Information
//-------------------------------------------------------------------------------------
@dynamic  communityName;
@dynamic  buildingNo;
@dynamic  roomNo;
@dynamic  assetType;

#pragma mark Basic Information
//-------------------------------------------------------------------------------------
@dynamic  area;              //
@dynamic  sharedArea;
@dynamic  storey;
@dynamic  storyOfAll;
@dynamic  orientation;

#pragma mark Unit Type Information
//-------------------------------------------------------------------------------------
@dynamic  quantityOfRoom;              //
@dynamic  quantityOfHall;              //
@dynamic  quantityOfKitchen;              //
@dynamic  quantityOfToilet;              //
@dynamic  quantityOfBalcony;              //

#pragma mark Status Attribute Price Information
//-------------------------------------------------------------------------------------
@dynamic  status;              //
@dynamic  attribute;
@dynamic  price;
@dynamic  statusAttributePriceHistory;

#pragma mark Tax Information
//-------------------------------------------------------------------------------------
@dynamic  businessTax;              //营业税
@dynamic  valueAddedTax;//增值税
@dynamic  stampTax;//印花税
@dynamic  incomeTax;//所得税

#pragma mark Ancillary Facility Information
//-------------------------------------------------------------------------------------
@dynamic  decorationGrade;              //
@dynamic  priceOfDecoration;

@dynamic  furnitureList;              //
@dynamic  furnitureRemark;

@dynamic  EquipmentList;              //
@dynamic  EquipmentRemark;

#pragma mark Pictures Information
//-------------------------------------------------------------------------------------

#pragma mark Owener Label Information
//-------------------------------------------------------------------------------------


+ (NSString *)parseClassName {
    return @"XFNFrameAssetModel";
}

@end
