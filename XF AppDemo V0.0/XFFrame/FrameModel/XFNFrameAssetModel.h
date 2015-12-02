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
#import <AVObject+Subclass.h>

//-------------------------------------------------------------------------------------
@interface XFNFrameAssetModel : AVObject <AVSubclassing>

#pragma mark 地址
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *communityName;     //小区名
@property (nonatomic , copy) NSString *buildingNumber;    //楼栋号
@property (nonatomic , copy) NSString *addedNumber;       //单元号
@property (nonatomic , copy) NSString *roomNumber;        //房号

#pragma mark 图片
//-------------------------------------------------------------------------------------
//保留

#pragma mark 交易信息
//-------------------------------------------------------------------------------------
//交易价格
@property (nonatomic , copy) NSString *assetTotalPrice;
//交易状态
@property (nonatomic , copy) NSString *assetStatus;   //XFNLabelsForAsset -> labelsForAssetStatus
//交易条件
@property (nonatomic , copy) NSString *typeOfPaying;  //XFNLabelsForAsset -> labelsForTypeOfPay
//交易税费
@property (nonatomic , copy) NSString *taxInfo;       //XFNLabelsForAsset -> labelsForTaxInfo
//看房方式
@property (nonatomic , copy) NSString *reserveMode;
@property (nonatomic , copy) NSString *reserveRemark;
//交房
@property (nonatomic , copy) NSString *deliveryMode;
@property (nonatomic , copy) NSString *deliveryRemark;

#pragma mark 基本信息
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *assetTotalArea;
@property (nonatomic , copy) NSString *assetSharedArea;
@property (nonatomic , copy) NSString *assetStorey;
@property (nonatomic , copy) NSString *storeyOfAll;

@property (nonatomic , copy) NSString *quantityOfRoom;
@property (nonatomic , copy) NSString *quantityOfToilet;
//户型图，保留
@property (nonatomic , copy) NSString *basicInfoLabelsOfAsset;  //XFNLabelsForAsset -> labelsForAssetLayoutInfo
@property (nonatomic , copy) NSString *summaryInfoLabelsOfAsset;//房源摘要，用户可以在该房源的 中挑选需要显示在摘要中的标签，并显示在首页摘要中

#pragma mark 辅助开关
//-------------------------------------------------------------------------------------
@property (nonatomic , assign) Boolean bIsOnTop; //这套房源是否已置顶
@property (nonatomic , assign) Boolean bIsFollowed; //这套房源是否已关注

#pragma mark 装修及配套
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *decorationInfo;  //XFNLabelsForAsset -> labelsForDecorationInfo
@property (nonatomic , copy) NSString *ancillaryInfo;   //XFNLabelsForAsset -> labelsForAncillaryInfo

#pragma mark 联系人
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSArray *contactInfo; //每新增一个联系人，往该数组中添加一个NSString，NSString格式为“称呼||身份||电话||人物描述”

#pragma mark 特别备注
//-------------------------------------------------------------------------------------
//每新增一个Log，往该数组中添加一个NSString
//Log的开头有三种：
//  |SYS_LOG|:         所有的修改操作，均保存，除非是其他两种log；
//  |KEY_REMARK|:      1、用户在评论框输入信息，并选择“这是关键记录”；2、某些系统操作；
//  |USR_COMMENT|:     用户在评论框输入信息，未选择“这是关键记录”
@property (nonatomic , copy) NSArray *assetLog;

#pragma mark 信息归属
//-------------------------------------------------------------------------------------
@property (nonatomic , copy) NSString *attributeTo;   //当前归属人
@property (nonatomic , copy) NSString *createdByWhom; //创建人

#pragma mark 交通信息
//-------------------------------------------------------------------------------------
//保留

#pragma mark 周边信息
//-------------------------------------------------------------------------------------
//保留

@end

//-------------------------------------------------------------------------------------
@interface XFNLabelsForAsset : AVObject <AVSubclassing>

@property (nonatomic , copy) NSString *labelsForAssetStatus;
@property (nonatomic , copy) NSString *labelsForTypeOfPay;
@property (nonatomic , copy) NSString *labelsForTaxInfo;
@property (nonatomic , copy) NSString *labelsForAssetLayoutInfo;
@property (nonatomic , copy) NSString *labelsForDecorationInfo;
@property (nonatomic , copy) NSString *labelsForAncillaryInfo;

@end

#endif /* XFNFrameAssetModel_h */
