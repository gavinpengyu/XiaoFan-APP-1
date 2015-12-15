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
    __unused XFNDataTestModel *dataTestModel = [[XFNDataTestModel alloc] init];
    //[dataTestModel getDateFromServer];
    //[dataTestModel initDataToServer];
}

- (void) getDateFromServer
{
    //新建查询
    AVQuery *query = [AVQuery queryWithClassName : _Macro_XFN_ASSET_MODEL_];
    
    //设置查询排序
    [query orderByAscending  : @"updatedAt"];
    [query addAscendingOrder : @"bIsOnTop"];
    
    //设置查询数量
    query.limit = 10;
    
    //后台查询，并将结果存入tableView数组
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error)
        {
            // 检索成功
            NSLog(@"Successfully received %lu posts.", (unsigned long)objects.count);
            
            __unused NSMutableArray       *tempTableViewArray = [[NSMutableArray alloc] init];
            XFNFrameAssetModel       *tempAssetModel = [XFNFrameAssetModel objectWithClassName: _Macro_XFN_ASSET_MODEL_];
            
            for (int ii=0; ii<objects.count; ii++)
            {
                tempAssetModel = (XFNFrameAssetModel*) objects[ii];
                NSString *temp=[[NSString alloc] init];
                //po 20151128，给XFNFrameAssetModel赋值之后，因为objects是AVObject，未实现子类化，因此不能直接使用子类语法访问，要用objectForKey
                //temp = tempAssetModel.communityName;
                temp = [tempAssetModel objectForKey : @"communityName"];
                DLog(@"%@", [tempAssetModel objectForKey : @"communityName"]);
            }
            
        } else
        {
            // 输出错误信息
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

//写入伪数据，并上传至服务器
- (void)initDataToServer
{
    
    //XFNFrameAssetModel *testModel = [XFNFrameAssetModel objectWithClassName:@"XFNFrameAssetModelNew"];
    
    for (int ii = 0; ii<20; ii++)
    {
        
        XFNFrameAssetModel *testModel = [XFNFrameAssetModel objectWithClassName: _Macro_XFN_ASSET_MODEL_];
        
        if(0 == ii%3)
        {
            testModel.communityName = @"金色黎明";
            testModel.attributeTo = @"飞鸟";
        }
        else if(1 == ii%3)
        {
            testModel.communityName = @"万科草庄";
            testModel.attributeTo = @"卡卡西";
        }
        else if(2 == ii%3)
        {
            testModel.communityName = @"草庄景墅";
            testModel.attributeTo = @"童虎";
        }
        else
        {
            DLog(@"!!!!!!!!!!ERROR!!!!!!!!!!!");
        }
        
        testModel.buildingNumber = [[NSString alloc] initWithFormat : @"%d", ii ];
        testModel.addedNumber    = @"1";
        testModel.roomNumber     = [[NSString alloc] initWithFormat : @"80%d", ii ];
        
        testModel.assetTotalPrice= [[NSString alloc] initWithFormat : @"%d", (ii+200) ];
        testModel.assetStatus    = @"出售中";
        
        testModel.typeOfPaying   = @"一次性";
        testModel.taxInfo        = @"无营业税";
        testModel.reserveMode    = @"预约";
        testModel.reserveRemark  = @"联系业主";
        
        testModel.deliveryMode   = @"空置";
        testModel.deliveryRemark = @"";
        
        testModel.assetTotalArea    = [[NSString alloc] initWithFormat : @"%d", (ii+100) ];
        testModel.assetSharedArea   = @"20";
        
        testModel.assetStorey       = @"8";
        testModel.storeyOfAll       = @"30";
        
        testModel.quantityOfRoom    = @"3";
        testModel.quantityOfToilet  = @"2";
        
        testModel.basicInfoLabelsOfAsset    = @"东边套,有明卫,多阳台,送飘窗,楼距大";
        testModel.decorationInfo            = @"豪装,地暖,墙纸";
        testModel.ancillaryInfo             = @"全配,空调,洗衣机,冰箱,电视机,餐桌";
        
        testModel.summaryInfoLabelsOfAsset  = @"东边套,地暖,墙纸,全配";
        
        testModel.bIsOnTop = false;
        [NSNumber numberWithBool:false];
        testModel.bIsFollowed = false;//[NSNumber numberWithBool:false];
        
        testModel.createdByWhom = @"飞鸟";
        
        NSMutableArray *tempContactArray = [[NSMutableArray alloc] init];
        NSString *tempContactString      = @"梁先生||业主||18905718888||开特斯拉";
        
        [tempContactArray addObject : tempContactString];
        testModel.contactInfo = tempContactArray;
        [tempContactArray removeAllObjects];
        
        NSString *tempLogString      = [[NSString alloc] initWithFormat : @"|SYS_LOG|:Created by %@", testModel.createdByWhom];
        [tempContactArray addObject : tempLogString];
        testModel.assetLog = tempContactArray;
        [tempContactArray removeAllObjects];
        
        [testModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                // 保存成功了！
                DLog(@"！！！！！！！！！！testAddressInfo！！！！！！！！");
            }
        }];
        
    }

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