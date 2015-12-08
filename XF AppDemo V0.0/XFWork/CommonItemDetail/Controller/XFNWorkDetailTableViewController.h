//
//  XFNWorkDetailTableViewController.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTableViewController_h
#define XFNWorkDetailTableViewController_h

#import "XFNFrameTableViewController.h"
#import "XFNFrameAssetModel.h"


typedef NS_ENUM(NSInteger, XFNDetailViewCellIndexEnum) {
    XFNWorkDetailImageViewCellIndexEnum = 0,
    XFNWorkDetailBasicInfoCellIndexEnum,
    XFNWorkDetailTradeInfoCellIndexEnum,
    XFNWorkDetailAuxiliaryInfoCellIndexEnum,
    XFNWorkDetailContactInfoCellIndexEnum,
    XFNWorkDetailCommentsInfoCellIndexEnum
};

//Protocol CommonItem / Edit View - > CommonItemDetail  XFNFrameAssetModel (AVObject)
//-----------------------------------------------------------------------------------------
@protocol XFNSendAssetModelToDetailViewDelegate

- (void)toSendAssetModelwithObject : (XFNFrameAssetModel*) object;

@end

//Protocol Cell - > CommonItemDetail 
//-----------------------------------------------------------------------------------------
@protocol XFNPushEditViewDelegate

- (void)toPushViewForEditBasicInfo;
- (void)toPushViewForEditTradeInfo;
- (void)toPushViewForEditAuxiliaryInfo;
- (void)toPushViewForEditContactInfo;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTableViewController : XFNFrameTableViewController < UITableViewDataSource, UITableViewDelegate, XFNSendAssetModelToDetailViewDelegate, XFNPushEditViewDelegate >
{
    XFNFrameAssetModel *_detailModel;
}

@property (nonatomic,strong) id <XFNSendAssetModelToDetailViewDelegate> delegate;//protocol 将数据传至edit View

@end

#endif /* XFNWorkDetailTableViewController_h */
