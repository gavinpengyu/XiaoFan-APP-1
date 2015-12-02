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

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailAuxiliaryInfoCellModel : XFNWorkDetailTableViewCellModel

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailContactInfoCellModel : XFNWorkDetailTableViewCellModel

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
