//
//  XFNFrameStatusAndPriceModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/5.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrameCommonItemDetailModel_h
#define XFNFrameCommonItemDetailModel_h

//-----------------------------------------------------------------------------------------
typedef NS_ENUM(NSInteger, XFNFrameStatusEnum) {
    XFNFrameStatusOnSale = 0,
    XFNFrameStatusOnRent,
    XFNFrameStatusAskForSale,
    XFNFrameStatusASkForRent,
    XFNFrameStatusSuspend,
    XFNFrameStatusInvalid
};

typedef NS_ENUM(NSInteger, XFNFrameContactTypeEnum) {
    XFNFrameContactTypeOwner = 0,
    XFNFrameContactTypeRelative,
    XFNFrameContactTypeRenter,
    XFNFrameContactTypeFriend
};

typedef NS_ENUM(NSInteger, XFNFrameHouseOrientationEnum) {
    XFNFrameHouseOrientationEast = 0,
    XFNFrameHouseOrientationSouthEast,
    XFNFrameHouseOrientationSouth,
    XFNFrameHouseOrientationSouthWest,
    XFNFrameHouseOrientationWest,
    XFNFrameHouseOrientationNorthWest,
    XFNFrameHouseOrientationNorth,
    XFNFrameHouseOrientationNorthEast
};

typedef NS_ENUM(NSInteger, XFNFrameDecorationGradeEnum) {
    XFNFrameDecorationGradeNone = 0,
    XFNFrameDecorationGradeSimple,
    XFNFrameDecorationGradeQuality
};

typedef NS_ENUM(NSInteger, XFNFrameDataTypeEnum) {
    XFNFrameDataTypeIsCommonItemDetailAddressInfo = 0,
    XFNFrameDataTypeIsCommonItemDetailStatusAttributePrice,
    XFNFrameDataTypeIsCommonItemDetailContactInfo,
    XFNFrameDataTypeIsCommonItemDetailBasicInfo,
    XFNFrameDataTypeIsCommonItemDetailDecorationInfo,
    XFNFrameDataTypeIsCommonItemDetailUnitType,
    XFNFrameDataTypeIsCommonItemDetailAll,
    XFNFrameDataTypeIsCommonItem
};

typedef NS_ENUM(NSInteger, XFNFrameDataErrorCodeEnum) {
    XFNFrameDataErrorCodeNoError = 0,
    XFNFrameDataErrorCodeNotExist,
    XFNFrameDataErrorCodeOthers
};

//-----------------------------------------------------------------------------------------
@interface XFNFrameCommonItemDetailModel : NSObject

@property (nonatomic, copy) Class XFNFrameAddressInfoModel;        //地址信息
@property (nonatomic, copy) Class XFNFrameStatusAttributePriceModel;        //价格及状态
@property (nonatomic, copy) Class XFNFrameContactInfoModel;           //业主、联系人信息
@property (nonatomic, copy) Class XFNFrameBasicInfoModel;             //基本信息
@property (nonatomic, copy) Class XFNFrameDecorationInfoModel;        //装修信息
@property (nonatomic, copy) Class XFNFrameUnitTypeModel;              //户型信息

/*
+ (instancetype)initmodelWithfirstClass : (Class) XFNFrameStatusAttributePriceModel
                            secondClass : (Class)          XFNFrameContactInfoModel
                             thirdClass : (Class)            XFNFrameBasicInfoModel
                             fouthClass : (Class)       XFNFrameDecorationInfoModel
                             fifthClass : (Class)             XFNFrameUnitTypeModel;

*/

- (NSMutableArray *) getDataWithType : (XFNFrameDataTypeEnum) dataTypeEnum;  //po, 20151106, 后续根据需要添加操作参数

- (XFNFrameDataErrorCodeEnum) sendDataWithType : (XFNFrameDataTypeEnum) dataTypeEnum
                                    withBuffer : (NSMutableArray *)    sendBuffer;

- (void) initPseudoData;

@end

//-----------------------------------------------------------------------------------------
@interface XFNFrameAddressInfoModel : NSObject

@property (nonatomic, copy) NSString*  communityNameString;//小区名
@property (nonatomic, copy) NSString*  buildingNoString; //栋号
@property (nonatomic, copy) NSString*  roomNoString; //房号

+ (instancetype)initmodelWithcommunity : (NSString *) communityNameString
                            buildingNo : (NSString *) buildingNoString
                                roomNo : (NSString *) roomNoString;
@end

//-----------------------------------------------------------------------------------------
@interface XFNFrameStatusAttributePriceModel : NSObject

@property (nonatomic, assign) XFNFrameStatusEnum  statusEnum;
@property (nonatomic, copy)   NSString*          attributeString; //归属人
@property (nonatomic, copy)   NSString*          priceString; //意向价格

+ (instancetype)initmodelWithstatus : (XFNFrameStatusEnum) statusEnum
                          attribute : (NSString *)        attributeString
                              price : (NSString *)        priceString;

- (NSString*) getStatusEnumString: (XFNFrameStatusEnum) statusEnum;
@end

//-----------------------------------------------------------------------------------------
@interface XFNFrameContactInfoModel : NSObject

@property (nonatomic, assign) XFNFrameContactTypeEnum  contactTypeEnum; //与业主的关系
@property (nonatomic, copy)   NSString*                contactNameString; //联系人称呼
@property (nonatomic, copy)   NSString*                contactNumberString; //联系人电话

+ (instancetype)initmodelWithtype : (XFNFrameContactTypeEnum) contactTypeEnum
                             name : (NSString *)             contactNameString
                           number : (NSString *)             contactNumberString;

- (NSString*) getContactTypeEnumString: (XFNFrameContactTypeEnum) contactTypeEnum;

@end

//-----------------------------------------------------------------------------------------
@interface XFNFrameBasicInfoModel : NSObject

@property (nonatomic, copy)    NSString*                     areaString; //面积
@property (nonatomic, copy)    NSString*                     sharedAreaString; //分摊面积
@property (nonatomic, copy)    NSString*                     storeyString; //楼层
@property (nonatomic, copy)    NSString*                     storeyOfAllString; //总楼层
@property (nonatomic, assign)  XFNFrameHouseOrientationEnum  houseOrientationEnum;//朝向

+ (instancetype)initmodelWitharea : (NSString *)                  areaString
                       sharedArea : (NSString *)                  sharedAreaString
                           storey : (NSString *)                  storeyString
                      storeyOfAll : (NSString *)                  storeyOfAllString
             houseOrientationEnum : (XFNFrameHouseOrientationEnum) houseOrientationEnum;

- (NSString*) getOrientationEnumString : (XFNFrameHouseOrientationEnum) orientationEnum;

@end

//-----------------------------------------------------------------------------------------
@interface XFNFrameDecorationInfoModel : NSObject

@property (nonatomic, assign)  XFNFrameDecorationGradeEnum  decorationGradeEnum; //装修级别
@property (nonatomic, copy)    NSString*                    priceOfDecorationString; //装修总价

+ (instancetype)initmodelWithgrade : (XFNFrameDecorationGradeEnum) decorationGradeEnum
                             price : (NSString *)                 priceOfDecorationString;

- (NSString*) getDecorationGradeEnumString: (XFNFrameDecorationGradeEnum) decorationGradeEnum;

@end

//-----------------------------------------------------------------------------------------
@interface XFNFrameUnitTypeModel : NSObject

@property (nonatomic, assign) NSInteger  quantityOfRoomInteger; //房
@property (nonatomic, assign) NSInteger  quantityOfHallInteger; //厅
@property (nonatomic, assign) NSInteger  quantityOfKitchenInteger; //厨
@property (nonatomic, assign) NSInteger  quantityOfToiletInteger; //卫
@property (nonatomic, assign) NSInteger  quantityOfBalconyInteger; //阳台

+ (instancetype)initmodelWithroom : (NSInteger) quantityOfRoomInteger
                             hall : (NSInteger) quantityOfHallInteger
                          kitchen : (NSInteger) quantityOfKitchenInteger
                           toilet : (NSInteger) quantityOfToiletInteger
                          balcony : (NSInteger) quantityOfBalconyInteger;
@end

//家具信息 XFNFurnitureModel
//家电
//照片
//看房方式
//税费
//归属人
//业主标签


#endif /* XFNFrameCommonItemDetailModel_h */
