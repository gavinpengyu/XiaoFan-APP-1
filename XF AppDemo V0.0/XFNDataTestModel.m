//
//  XFNDataTestModel.m
//  XF AppDemo V0.0
//
//  Created by po on 15/11/13.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNFrame.h"
#import "XFNDataTestModel.h"
#import "XFNFrameAssetModel.h"
#import <AVOSCloud/AVOSCloud.h>

@implementation XFNDataTestModel

//@dynamic XFNDataTestAddressInfoModel;
//@dynamic XFNDataTestStatusAttributePriceModel;
//@dynamic XFNDataTestContactInfoModel;
//@dynamic modelList;


+ (void)testData
{
    DLog(@"开始数据测试");
    XFNDataTestModel *dataTestModel = [[XFNDataTestModel alloc] init];
    [dataTestModel initDataToServer];
}

//写入伪数据，并上传至服务器
- (void)initDataToServer
{
    
    XFNDataTestModel *testModel = [XFNDataTestModel objectWithClassName:@"XFNDataTestModel"];
    [testModel addObject:@"金色黎明" forKey: @"communityName"];
    [testModel addObject:@"10栋" forKey: @"buildingNo"];
    [testModel addObject:@"608" forKey: @"roomNo"];
    
    //testModel.attribute = @"卡卡西";
    
    [testModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 保存成功了！
            DLog(@"！！！！！！！！！！testAddressInfo！！！！！！！！");
        }
    }];
    
    AVQuery *query = [AVQuery queryWithClassName:@"Post"];
    AVObject *post = [query getObjectWithId:@"5645ab7200b0c060f984d587"];
    
    NSString *communityName = [post objectForKey:@"communityName"];
    NSString *buildingNo     = [post objectForKey:@"buildingNo"];
    NSString *roomNo        = [post objectForKey:@"roomNo"];
    
    DLog(@"%@  %@  %@", communityName, buildingNo, roomNo);
    
    /*
    
    //XFNDataTestStatusAttributePriceModel *testStatusAttributePrice= [[XFNDataTestStatusAttributePriceModel alloc] init];
    XFNDataTestStatusAttributePriceModel *testStatusAttributePrice = [XFNDataTestStatusAttributePriceModel objectWithClassName:@"testStatusAttributePrice"];
    [testStatusAttributePrice addObject:@"一休" forKey: @"attribute"];
    [testStatusAttributePrice addObject:@"180" forKey: @"price"];
    [testStatusAttributePrice addObject:@"有效" forKey: @"status"];
    //testStatusAttributePrice.status = @"出售";
    
    [testStatusAttributePrice saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 保存成功了！
            DLog(@"！！！！！！！！！testStatusAttributePrice！！！！！！！！！");
        }
    }];
    
    //XFNDataTestContactInfoModel *testContactInfo= [[XFNDataTestContactInfoModel alloc] init];
    XFNDataTestContactInfoModel *testContactInfo = [XFNDataTestContactInfoModel objectWithClassName:@"testContactInfo"];
    [testContactInfo addObject:@"0" forKey: @"type"];
    [testContactInfo addObject:@"180" forKey: @"name"];
    [testContactInfo addObject:@"有效" forKey: @"number"];
    
    [testContactInfo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 保存成功了！
            DLog(@"！！！！！！！！！！testContactInfo！！！！！！！！");
        }
    }];
    
    NSArray *model = @[testAddressInfo, testStatusAttributePrice, testContactInfo];
    
    XFNDataTestModel *dataTestModel = [XFNDataTestModel objectWithClassName:@"TestData"];
    
    [dataTestModel setObject: model forKey: @"modelList"];
    
    [dataTestModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 保存成功了！
            DLog(@"！！！！！！！！！！dataTestModel！！！！！！！！");
        }
    }];
     
     */
}



//读取服务器上的数据，并按字段解析

//读取某一个字段的数据，修改后更新至服务器

@end


//-------------------------------------------------
/*
@implementation XFNDataTestAddressInfoModel

@dynamic community;
@dynamic buidingNo;
@dynamic roomNo;

+ (NSString *)parseClassName {
    return @"XFNDataTestAddressInfoModel";
}

+ (instancetype)initmodelWithcommunity : (NSString *) communityNameString
                            buildingNo : (NSString *) buildingNoString
                                roomNo : (NSString *) roomNoString
{
    XFNDataTestAddressInfoModel *model = [[XFNDataTestAddressInfoModel alloc] init];
    
    model.community = communityNameString;
    model.buidingNo    = buildingNoString;
    model.roomNo        = roomNoString;
    
    return model;
}

@end

@implementation XFNDataTestStatusAttributePriceModel

@dynamic attribute;
@dynamic price;
@dynamic status;

+ (NSString *)parseClassName {
    return @"XFNDataTestStatusAttributePriceModel";
}

+ (instancetype)initmodelWithstatus : (NSString *) status
                          attribute : (NSArray *)         attribute
                              price : (NSInteger)         price
{
    XFNDataTestStatusAttributePriceModel *model = [[XFNDataTestStatusAttributePriceModel alloc] init];
    
    model.status      = status;
    model.attribute = attribute;
    model.price     = price;
    
    return model;
}

@end

@implementation XFNDataTestContactInfoModel

@dynamic type;
@dynamic name;
@dynamic number;

+ (NSString *)parseClassName {
    return @"XFNDataTestContactInfoModel";
}

+ (instancetype)initmodelWithtype : (XFNFrameContactTypeEnum) contactTypeEnum
                             name : (NSString *)             contactNameString
                           number : (NSString *)             contactNumberString
{
    XFNDataTestContactInfoModel *model = [[XFNDataTestContactInfoModel alloc] init];
    
    model.type     = contactTypeEnum;
    model.name   = contactNameString;
    model.number = contactNumberString;
    
    return model;
}
*/

/*
 AVObject *post = [AVObject objectWithClassName:@"TestObject2"];
 [post setObject:@"Bar" forKey:@"Foo"];
 [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
 if (succeeded) {
 // 保存成功了！
 DLog(@"！！！！！！！！！！！！！！！！！！");
 }
 }];
 */