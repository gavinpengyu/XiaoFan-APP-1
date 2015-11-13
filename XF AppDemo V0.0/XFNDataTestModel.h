//
//  XFNDataTestModel.h
//  XF AppDemo V0.0
//
//  Created by po on 15/11/13.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNDataTestModel_h
#define XFNDataTestModel_h

#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrameAssetModel.h"
#import "XFNFrameCommonItemDetailModel.h"

/*
typedef NS_ENUM(NSInteger, XFNDataTestEnum) {
    XFNDataTestEnumAddressInfo = 0,
    XFNDataTestEnumStatusAttributePrice,
    XFNDataTestEnumContactInfo,
};

typedef NS_ENUM(NSInteger, XFNFrameContactTypeEnum) {
    XFNFrameContactTypeOwner = 0,
    XFNFrameContactTypeRelative,
    XFNFrameContactTypeRenter,
    XFNFrameContactTypeFriend
};*/

@interface XFNDataTestModel : XFNFrameAssetModel <AVSubclassing>

//@property(nonatomic,copy) NSArray *modelList;
//@property(nonatomic,copy) Class XFNDataTestAddressInfoModel;
//@property(nonatomic,copy) Class XFNDataTestStatusAttributePriceModel;
//@property(nonatomic,copy) Class XFNDataTestContactInfoModel;

+ (void) testData;

@end
/*
@interface XFNDataTestAddressInfoModel : AVObject <AVSubclassing>

@property(nonatomic,copy) NSString *community;
@property(nonatomic,copy) NSString *buidingNo;
@property(nonatomic,copy) NSString *roomNo;

+ (instancetype)initmodelWithcommunity : (NSString *) communityNameString
                            buildingNo : (NSString *) buildingNoString
                                roomNo : (NSString *) roomNoString;

@end

@interface XFNDataTestStatusAttributePriceModel : AVObject <AVSubclassing>

@property(nonatomic,copy) NSArray *attribute;
@property(nonatomic,assign) NSInteger price;
@property(nonatomic,copy) NSString *status;

+ (instancetype)initmodelWithstatus : (NSString *) status
                          attribute : (NSArray *)  attribute
                              price : (NSInteger) price;

@end


@interface XFNDataTestContactInfoModel : AVObject <AVSubclassing>

@property(nonatomic,assign) XFNFrameContactTypeEnum type;
@property(nonatomic,copy)   NSString *name;
@property(nonatomic,copy)   NSString *number;

+ (instancetype)initmodelWithtype : (XFNFrameContactTypeEnum) contactTypeEnum
                             name : (NSString *)             contactNameString
                           number : (NSString *)             contactNumberString;
 */



#endif /* XFNDataTestModel_h */
