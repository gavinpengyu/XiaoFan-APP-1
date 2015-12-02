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

//-------------------------------------------------------------------------------------
@implementation XFNFrameAssetModel
#pragma mark 地址
//-------------------------------------------------------------------------------------
@dynamic communityName;     //小区名
@dynamic buildingNumber;    //楼栋号
@dynamic addedNumber;       //单元号
@dynamic roomNumber;        //房号

#pragma mark 图片
//-------------------------------------------------------------------------------------
//保留

#pragma mark 交易信息
//-------------------------------------------------------------------------------------
//交易价格
@dynamic assetTotalPrice;
//交易状态
@dynamic assetStatus;   //XFNLabelsForAsset -> labelsForAssetStatus
//交易条件
@dynamic typeOfPaying;  //XFNLabelsForAsset -> labelsForTypeOfPay
//交易税费
@dynamic taxInfo;       //XFNLabelsForAsset -> labelsForTaxInfo
//看房方式
@dynamic reserveMode;
@dynamic reserveRemark;
//交房
@dynamic deliveryMode;
@dynamic deliveryRemark;

#pragma mark 基本信息
//-------------------------------------------------------------------------------------
@dynamic assetTotalArea;
@dynamic assetSharedArea;
@dynamic assetStorey;
@dynamic storeyOfAll;

@dynamic quantityOfRoom;
@dynamic quantityOfToilet;
//户型图，保留
@dynamic basicInfoLabelsOfAsset;  //XFNLabelsForAsset -> labelsForAssetLayoutInfo
@dynamic summaryInfoLabelsOfAsset;//房源摘要，用户可以在该房源的 中挑选需要显示在摘要中的标签，并显示在首页摘要中

#pragma mark 辅助开关
//-------------------------------------------------------------------------------------
@dynamic bIsOnTop; //这套房源是否已置顶
@dynamic bIsFollowed; //这套房源是否已关注

#pragma mark 装修及配套
//-------------------------------------------------------------------------------------
@dynamic decorationInfo;  //XFNLabelsForAsset -> labelsForDecorationInfo
@dynamic ancillaryInfo;   //XFNLabelsForAsset -> labelsForAncillaryInfo

#pragma mark 联系人
//-------------------------------------------------------------------------------------
@dynamic contactInfo; //每新增一个联系人，往该数组中添加一个NSString，NSString格式为“称呼||身份||电话||人物描述”

#pragma mark 特别备注
//-------------------------------------------------------------------------------------
//每新增一个Log，往该数组中添加一个NSString
//Log的开头有三种：
//  |SYS_LOG|:         所有的修改操作，均保存，除非是其他两种log；
//  |KEY_REMARK|:      1、用户在评论框输入信息，并选择“这是关键记录”；2、某些系统操作；
//  |USR_COMMENT|:     用户在评论框输入信息，未选择“这是关键记录”
@dynamic assetLog;

#pragma mark 信息归属
//-------------------------------------------------------------------------------------
@dynamic attributeTo;   //当前归属人
@dynamic createdByWhom; //创建人

#pragma mark 交通信息
//-------------------------------------------------------------------------------------
//保留

#pragma mark 周边信息
//-------------------------------------------------------------------------------------
//保留

+ (NSString *)parseClassName {
    return @"XFNFrameAssetModel";
}

@end

//-------------------------------------------------------------------------------------
@implementation XFNLabelsForAsset

@dynamic labelsForAssetStatus;
@dynamic labelsForTypeOfPay;
@dynamic labelsForTaxInfo;
@dynamic labelsForAssetLayoutInfo;
@dynamic labelsForDecorationInfo;
@dynamic labelsForAncillaryInfo;

+ (NSString *)parseClassName {
    return @"XFNLabelsForAsset";
}

@end
