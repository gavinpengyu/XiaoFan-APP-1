//
//  XFNFrameStatusAndPriceModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/5.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNFrameCommonItemModel.h"
#import "XFNFrameCommonItemDetailModel.h"

#define _DEBUG_PSEUDO_DATA_  //调试模式下填充伪数据

#ifdef _DEBUG_PSEUDO_DATA_

static NSMutableArray * sXFNCommonItemDetailPseudoData;

#endif

//-----------------------------------------------------------------------------------------
@implementation XFNFrameCommonItemDetailModel

/*
+ (instancetype)initmodelWithfirstClass : (Class) XFNFrameStatusAttributePriceModel
                            secondClass : (Class)          XFNFrameContactInfoModel
                             thirdClass : (Class)            XFNFrameBasicInfoModel
                             fouthClass : (Class)       XFNFrameDecorationInfoModel
                             fifthClass : (Class)             XFNFrameUnitTypeModel
{
    XFNFrameCommonItemDetailModel *model = [[XFNFrameCommonItemDetailModel alloc] init];

    model.XFNFrameStatusAttributePriceModel = XFNFrameStatusAttributePriceModel;//为什么不能直接赋值？为什么也不能使用copy？
    model.XFNFrameContactInfoModel          = XFNFrameContactInfoModel;
    model.XFNFrameBasicInfoModel            = XFNFrameBasicInfoModel;
    model.XFNFrameDecorationInfoModel       = XFNFrameDecorationInfoModel;
    model.XFNFrameUnitTypeModel             = XFNFrameUnitTypeModel;
    
    return model;
}
*/

- (NSMutableArray *) getDataWithType : (XFNFrameDataTypeEnum) dataTypeEnum
{
#ifdef _DEBUG_PSEUDO_DATA_

    NSMutableArray *tempDetail = [NSMutableArray array];
    NSMutableArray *temp = [NSMutableArray array];

    //地址信息
    XFNFrameAddressInfoModel *modelAddressInfo = [[XFNFrameAddressInfoModel alloc] init];
    modelAddressInfo = sXFNCommonItemDetailPseudoData[XFNFrameDataTypeIsCommonItemDetailAddressInfo];
    if (XFNFrameDataTypeIsCommonItemDetailAddressInfo == dataTypeEnum)
    {
        [temp addObject : modelAddressInfo];
        return temp;
    }
    [tempDetail addObject : modelAddressInfo];
    
    //状态及价格
    XFNFrameStatusAttributePriceModel *modelStatusAttributePrice = [[XFNFrameStatusAttributePriceModel alloc] init];
    modelStatusAttributePrice = sXFNCommonItemDetailPseudoData[XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice];
    if (XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice == dataTypeEnum)
    {
        [temp addObject : modelStatusAttributePrice];
        return temp;
    }
    [tempDetail addObject : modelStatusAttributePrice];
    
    //联系人信息
    XFNFrameContactInfoModel *modelContactInfo = [[XFNFrameContactInfoModel alloc] init];
    modelContactInfo = sXFNCommonItemDetailPseudoData[XFNFrameDataTypeIsCommonItemDetailContactInfo];
    if (XFNFrameDataTypeIsCommonItemDetailContactInfo == dataTypeEnum)
    {
        [temp addObject : modelContactInfo];
        return temp;
    }
    [tempDetail addObject : modelContactInfo];
    
    //基础信息
    XFNFrameBasicInfoModel *modelBasicInfo = [[XFNFrameBasicInfoModel alloc] init];
    modelBasicInfo = sXFNCommonItemDetailPseudoData[XFNFrameDataTypeIsCommonItemDetailBasicInfo];
    if (XFNFrameDataTypeIsCommonItemDetailBasicInfo == dataTypeEnum)
    {
        [temp addObject : modelBasicInfo];
        return temp;
    }
    [tempDetail addObject : modelBasicInfo];
    
    //装修信息
    XFNFrameDecorationInfoModel *modelDecorationInfo = [[XFNFrameDecorationInfoModel alloc] init];
    modelDecorationInfo = sXFNCommonItemDetailPseudoData[XFNFrameDataTypeIsCommonItemDetailDecorationInfo];
    if (XFNFrameDataTypeIsCommonItemDetailDecorationInfo == dataTypeEnum)
    {
        [temp addObject : modelDecorationInfo];
        return temp;
    }
    [tempDetail addObject : modelDecorationInfo];

    //户型信息
    XFNFrameUnitTypeModel *modelUnitType = [[XFNFrameUnitTypeModel alloc] init];
    modelUnitType = sXFNCommonItemDetailPseudoData[XFNFrameDataTypeIsCommonItemDetailUnitType];
    if (XFNFrameDataTypeIsCommonItemDetailUnitType == dataTypeEnum)
    {
        [temp addObject : modelUnitType];
        return temp;
    }
    [tempDetail addObject : modelUnitType];
    
    //返回全部详情
    if (XFNFrameDataTypeIsCommonItemDetailAll == dataTypeEnum)
    {
        return tempDetail;
    }
    
    //返回CommonItem
    if (XFNFrameDataTypeIsCommonItem == dataTypeEnum)
    {
        NSString *name      = [NSString stringWithFormat:@"%@ | %@栋 | %@", modelAddressInfo.communityNameString, modelAddressInfo.buildingNoString ,modelAddressInfo.roomNoString];
        NSString *price     = [NSString stringWithFormat:@"%@万", modelStatusAttributePrice.priceString];
        NSString *status    = [NSString stringWithFormat:@"%@", [modelStatusAttributePrice getStatusEnumString : modelStatusAttributePrice.statusEnum]];
        NSString *ownername = [NSString stringWithFormat:@"%@", modelStatusAttributePrice.attributeString];
        //装修级别，组合字符串，默认为毛坯
        //NSString *decoration = [NSString stringWithFormat:@"毛坯"];
        NSString *decoration = [[NSString alloc] init];
        decoration = [modelDecorationInfo getDecorationGradeEnumString:modelDecorationInfo.decorationGradeEnum];
       /* if (XFNFrameDecorationGradeSimple == modelDecorationInfo.decorationGradeEnum)
        {
            decoration = [NSString stringWithFormat:@"简装"];
        }
        if (XFNFrameDecorationGradeQuality == modelDecorationInfo.decorationGradeEnum)
        {
            decoration = [NSString stringWithFormat:@"精装"];
        }*/
        //
        NSString *detail = [NSString stringWithFormat:@"%ld室%ld厅%ld厨%ld卫 | %@平米 | %@", modelUnitType.quantityOfRoomInteger,
                            modelUnitType.quantityOfHallInteger,
                            modelUnitType.quantityOfKitchenInteger,
                            modelUnitType.quantityOfToiletInteger,
                            modelBasicInfo.areaString,
                            (NSString*) decoration];
        //设定时间为当前系统时间
        NSDateFormatter *nsdf2=[[NSDateFormatter alloc] init];
        [nsdf2 setDateStyle:NSDateFormatterShortStyle];
        [nsdf2 setDateFormat:@"YYYY/MM/DD HH:mm"];
        NSString *time = [nsdf2 stringFromDate : [NSDate date]];//po 20151111：此处有bug，11月11日时显示2015/11/315
        
        XFNFrameCommonItemModel *modelCommonItem = [XFNFrameCommonItemModel initmodelWithname : (NSString*)name
                                                                                       detail : (NSString*)detail
                                                                                        price : (NSString*)price
                                                                                       status : (NSString*)status
                                                                                    ownername : (NSString*)ownername
                                                                                     sendtime : (NSString*)time
                                                                                   ownerimage : [UIImage imageNamed:@"TestOwnerImage"]];

        [temp addObject : modelCommonItem];
        return temp;
    }
    
    DLog(@"ERROR: INPUT IS OUT OF ENUM!");
    return Nil;
    
#else
    //在此处添加访问MySQL Lite及服务器代码
    DLog(@"DATA ERROR!");
    return nil;
#endif
    
}

- (XFNFrameDataErrorCodeEnum) sendDataWithType : (XFNFrameDataTypeEnum) dataTypeEnum
                                    withBuffer : (NSMutableArray *)    sendBuffer
{
#ifdef _DEBUG_PSEUDO_DATA_
        
        if (XFNFrameDataTypeIsCommonItemDetailAddressInfo == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //状态及价格
        if (XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //联系人信息
        if (XFNFrameDataTypeIsCommonItemDetailContactInfo == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //基础信息
        if (XFNFrameDataTypeIsCommonItemDetailBasicInfo == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //装修信息
        if (XFNFrameDataTypeIsCommonItemDetailDecorationInfo == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //户型信息
        if (XFNFrameDataTypeIsCommonItemDetailUnitType == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //返回全部详情
        if (XFNFrameDataTypeIsCommonItemDetailAll == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        //返回CommonItem
        if (XFNFrameDataTypeIsCommonItem == dataTypeEnum)
        {
            DLog(@"DATA Updated!");
            return XFNFrameDataErrorCodeNoError;
        }
        
        DLog(@"DATA ERROR!");
        return XFNFrameDataErrorCodeNoError;
        
#else
        //在此处添加访问MySQL Lite及服务器代码
        DLog(@"DATA ERROR!");
        return XFNFrameDataErrorCodeNoError;
#endif
    
}

- (void) initPseudoData
{
    sXFNCommonItemDetailPseudoData = [NSMutableArray array];
    
    XFNFrameAddressInfoModel *modelAddressInfoPrice = [XFNFrameAddressInfoModel initmodelWithcommunity : @"万科草庄"
                                                                                            buildingNo : [NSString stringWithFormat:@"%s", "5"]
                                                                                                roomNo : [NSString stringWithFormat:@"%s", "508"]];
    [sXFNCommonItemDetailPseudoData addObject : modelAddressInfoPrice];
    
    XFNFrameStatusAttributePriceModel *modelStatusAttributePrice = [XFNFrameStatusAttributePriceModel initmodelWithstatus : XFNFrameStatusOnSale
                                                                                                                attribute : @"飞鸟"
                                                                                                                    price : @"180"];
    [sXFNCommonItemDetailPseudoData addObject : modelStatusAttributePrice];
    
    XFNFrameContactInfoModel *modelContactInfo = [XFNFrameContactInfoModel initmodelWithtype : XFNFrameContactTypeOwner
                                                                                        name : @"PO"
                                                                                      number : @"18907489490"];
    [sXFNCommonItemDetailPseudoData addObject : modelContactInfo];
    
    XFNFrameBasicInfoModel *modelBasicInfo = [XFNFrameBasicInfoModel initmodelWitharea : [NSString stringWithFormat:@"%s", "180"]
                                                                            sharedArea : [NSString stringWithFormat:@"%s", "20"]
                                                                                storey : @"5"
                                                                           storeyOfAll : @"15"
                                                                  houseOrientationEnum : XFNFrameHouseOrientationEast];
    [sXFNCommonItemDetailPseudoData addObject : modelBasicInfo];
    
    XFNFrameDecorationInfoModel *modelDecorationInfo = [XFNFrameDecorationInfoModel initmodelWithgrade : XFNFrameDecorationGradeNone
                                                                                                 price : @"0"];
    [sXFNCommonItemDetailPseudoData addObject : modelDecorationInfo];
    
    XFNFrameUnitTypeModel *modelUnitType = [XFNFrameUnitTypeModel initmodelWithroom: (NSInteger) 3
                                                                             hall: (NSInteger) 1
                                                                          kitchen: (NSInteger) 1
                                                                           toilet: (NSInteger) 2
                                                                          balcony: (NSInteger) 2];
    [sXFNCommonItemDetailPseudoData addObject : modelUnitType];
}

@end

#pragma mark - Detailed Models

//-----------------------------------------------------------------------------------------
@implementation XFNFrameAddressInfoModel

+ (instancetype)initmodelWithcommunity : (NSString *) communityNameString
                            buildingNo : (NSString *) buildingNoString
                                roomNo : (NSString *) roomNoString
{
    XFNFrameAddressInfoModel *model = [[XFNFrameAddressInfoModel alloc] init];
    
    model.communityNameString = communityNameString;
    model.buildingNoString    = buildingNoString;
    model.roomNoString        = roomNoString;
    
    return model;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ at %p, communityName:%@, buildingNo:%@, roomNo: %@>", [self class], self, self.communityNameString, self.buildingNoString, self.roomNoString];
}

@end

//-----------------------------------------------------------------------------------------
@implementation XFNFrameStatusAttributePriceModel

+ (instancetype)initmodelWithstatus : (XFNFrameStatusEnum) statusEnum
                          attribute : (NSString *)         attributeString
                              price : (NSString *)         priceString
{
    XFNFrameStatusAttributePriceModel *model = [[XFNFrameStatusAttributePriceModel alloc] init];
    
    model.statusEnum      = statusEnum;
    model.attributeString = attributeString;
    model.priceString     = priceString;
    
    return model;
}

- (NSString*) description
{
    return [NSString stringWithFormat:@"<%@ at %p, status:%ld, attribute:%@, priceNo: %@>", [self class], self, self.statusEnum, self.attributeString, self.priceString];
}

- (NSString*) getStatusEnumString: (XFNFrameStatusEnum) statusEnum;
{
    if( XFNFrameStatusOnSale == statusEnum )
    {
        return [NSString stringWithFormat: @"出售"];
    }
    if( XFNFrameStatusOnRent == statusEnum )
    {
        return [NSString stringWithFormat: @"出租"];
    }
    if( XFNFrameStatusAskForSale == statusEnum )
    {
        return [NSString stringWithFormat: @"求售"];
    }
    if( XFNFrameStatusASkForRent == statusEnum )
    {
        return [NSString stringWithFormat: @"求租"];
    }
    if( XFNFrameStatusSuspend == statusEnum )
    {
        return [NSString stringWithFormat: @"暂缓"];
    }
    if( XFNFrameStatusInvalid == statusEnum )
    {
        return [NSString stringWithFormat: @"无效"];
    }
    
    DLog(@"出错：错误的枚举类型%ld", statusEnum);
    return nil;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNFrameContactInfoModel

+ (instancetype)initmodelWithtype : (XFNFrameContactTypeEnum) contactTypeEnum
                             name : (NSString *)             contactNameString
                           number : (NSString *)             contactNumberString
{
    XFNFrameContactInfoModel *model = [[XFNFrameContactInfoModel alloc] init];
    
    model.contactTypeEnum     = contactTypeEnum;
    model.contactNameString   = contactNameString;
    model.contactNumberString = contactNumberString;
    
    return model;
}

- (NSString*) getContactTypeEnumString: (XFNFrameContactTypeEnum) contactTypeEnum
{
    if( XFNFrameContactTypeOwner == contactTypeEnum )
    {
        return [NSString stringWithFormat: @"业主"];
    }
    if( XFNFrameContactTypeRelative == contactTypeEnum )
    {
        return [NSString stringWithFormat: @"亲人"];
    }
    if( XFNFrameContactTypeRenter == contactTypeEnum )
    {
        return [NSString stringWithFormat: @"租客"];
    }
    if( XFNFrameContactTypeFriend == contactTypeEnum )
    {
        return [NSString stringWithFormat: @"朋友"];
    }
    
    DLog(@"出错：错误的枚举类型%ld", contactTypeEnum);
    return nil;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNFrameBasicInfoModel

+ (instancetype)initmodelWitharea : (NSString *)  areaString
                       sharedArea : (NSString *) sharedAreaString
                           storey : (NSString *) storeyString
                      storeyOfAll : (NSString *)                  storeyOfAllString
             houseOrientationEnum : (XFNFrameHouseOrientationEnum) houseOrientationEnum
{
    XFNFrameBasicInfoModel *model = [[XFNFrameBasicInfoModel alloc] init];
    
    model.areaString           = areaString;
    model.sharedAreaString     = sharedAreaString;
    model.storeyString         = storeyString;
    model.storeyOfAllString    = storeyOfAllString;
    model.houseOrientationEnum = houseOrientationEnum;
    return model;
}

- (NSString*) getOrientationEnumString: (XFNFrameHouseOrientationEnum) orientationEnum
{
    if( XFNFrameHouseOrientationEast == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝东"];
    }
    if( XFNFrameHouseOrientationSouthEast == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝东南"];
    }
    if( XFNFrameHouseOrientationSouth == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝南"];
    }
    if( XFNFrameHouseOrientationSouthWest == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝西南"];
    }
    if( XFNFrameHouseOrientationWest == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝西"];
    }
    if( XFNFrameHouseOrientationNorthWest == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝西北"];
    }
    if( XFNFrameHouseOrientationNorth == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝北"];
    }
    if( XFNFrameHouseOrientationNorthEast == orientationEnum )
    {
        return [NSString stringWithFormat: @"朝东北"];
    }
    
    DLog(@"出错：错误的枚举类型%ld", orientationEnum);
    return nil;
}
@end

//-----------------------------------------------------------------------------------------
@implementation XFNFrameDecorationInfoModel

+ (instancetype)initmodelWithgrade : (XFNFrameDecorationGradeEnum) decorationGradeEnum
                             price : (NSString *)                 priceOfDecorationString
{
    XFNFrameDecorationInfoModel *model = [[XFNFrameDecorationInfoModel alloc] init];
    
    model.decorationGradeEnum     = decorationGradeEnum;
    model.priceOfDecorationString = priceOfDecorationString;
    
    return model;
}

- (NSString*) getDecorationGradeEnumString: (XFNFrameDecorationGradeEnum) decorationGradeEnum
{
    if( XFNFrameDecorationGradeNone == decorationGradeEnum )
    {
        return [NSString stringWithFormat: @"毛坯"];
    }
    if( XFNFrameDecorationGradeSimple == decorationGradeEnum )
    {
        return [NSString stringWithFormat: @"简装"];
    }
    if( XFNFrameDecorationGradeQuality == decorationGradeEnum )
    {
        return [NSString stringWithFormat: @"精装"];
    }
    
    DLog(@"出错：错误的枚举类型%ld", decorationGradeEnum);
    return nil;
}

@end

//-----------------------------------------------------------------------------------------
@implementation XFNFrameUnitTypeModel

+ (instancetype)initmodelWithroom : (NSInteger) quantityOfRoomInteger
                             hall : (NSInteger) quantityOfHallInteger
                          kitchen : (NSInteger) quantityOfKitchenInteger
                           toilet : (NSInteger) quantityOfToiletInteger
                          balcony : (NSInteger) quantityOfBalconyInteger
{
    XFNFrameUnitTypeModel *model = [[XFNFrameUnitTypeModel alloc] init];
    
    model.quantityOfRoomInteger    = quantityOfRoomInteger;
    model.quantityOfHallInteger    = quantityOfHallInteger;
    model.quantityOfKitchenInteger = quantityOfKitchenInteger;
    model.quantityOfToiletInteger  = quantityOfToiletInteger;
    model.quantityOfBalconyInteger = quantityOfBalconyInteger;
    
    return model;
}
@end









//-----------------------------------------------------------------------------------------





















