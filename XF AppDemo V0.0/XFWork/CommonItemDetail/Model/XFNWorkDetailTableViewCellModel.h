//
//  XFNWorkDetailTableViewCellModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTableViewCellModel_h
#define XFNWorkDetailTableViewCellModel_h

#import "XFNFrameAssetModel.h"

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTableViewCellModel : XFNFrameAssetModel <AVSubclassing>


@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailImageViewCellModel : XFNWorkDetailTableViewCellModel


@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailBasicInfoCellModel : XFNWorkDetailTableViewCellModel

@property (nonatomic, copy) NSString* areaString;       //面积
@property (nonatomic, copy) NSString* unitLayoutString; //房型
@property (nonatomic, copy) NSString* sharedAreaString; //分摊面积
@property (nonatomic, copy) NSString* storeyString;     //楼层
@property (nonatomic, copy) NSArray * labelsArray;      //房源标签

- (instancetype)initWithObject: (AVObject*) assetModel;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTradeInfoCellModel : XFNWorkDetailTableViewCellModel

@property (nonatomic, copy) NSString* totalPriceString;       //总价
@property (nonatomic, copy) NSString* unitPriceString;        //单价
@property (nonatomic, copy) NSString* statusString;           //状态
@property (nonatomic, copy) NSString* attributedString;       //归属
@property (nonatomic, copy) NSString* reserveString;          //看房方式及备注
@property (nonatomic, copy) NSString* deliveryString;         //交房方式及备注
@property (nonatomic, copy) NSArray * labelsArray;            //交易标签，含税费及付款方式

- (instancetype)initWithObject: (AVObject*) assetModel;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailAuxiliaryInfoCellModel : XFNWorkDetailTableViewCellModel

@property (nonatomic, copy) NSArray * labelsArray;            //装修及配套标签

- (instancetype)initWithObject: (AVObject*) assetModel;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailContactInfoCellModel : XFNWorkDetailTableViewCellModel

@property (nonatomic, copy) NSArray * contactsArray;            //联系人
@property (nonatomic, copy) NSArray * labelsArray;            //联系人标签

- (instancetype)initWithObject: (AVObject*) assetModel;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailCommentsInfoCellModel : XFNWorkDetailTableViewCellModel

@end

//@interface XFNWorkDetailTableViewCellModel : XFNFrameCommonItemDetailModel
//
//@end
//
//@interface XFNWorkDetailTableViewCellModelGroup : XFNFrameCommonItemDetailModel
//
//@property (nonatomic,strong) NSMutableArray *detailTableViewModelArray;
//
//+ (XFNWorkDetailTableViewCellModelGroup *)initWithModelGroup:(NSMutableArray *)detailTableViewModelArray;
//
//@end

#endif /* XFNWorkDetailTableViewCellModel_h */
