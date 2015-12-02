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

//Protocol CommonItem - > CommonItemDetail  XFNFrameAssetModel (AVObject)
//-----------------------------------------------------------------------------------------
@protocol XFNSendAssetModelToDetailViewDelegate

- (void)toSendAssetModelwithObject : (XFNFrameAssetModel*) object;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailTableViewController : XFNFrameTableViewController < UITableViewDataSource, UITableViewDelegate, XFNSendAssetModelToDetailViewDelegate >
{
    NSMutableArray     *_cellHeightArray;
    XFNFrameAssetModel *_detailModel;
}
@end

//@interface XFNWorkDetailTableViewController : XFNFrameTableViewController < UITableViewDataSource, UITableViewDelegate >
//{
//    UITableView *_detailTableView;
//    NSMutableArray *_detailTableViewModel;
//    //NSMutableArray *_detailTableViewModelCells; //可用于存储cell，计算高度，但是暂未使用
//}
//@end

#endif /* XFNWorkDetailTableViewController_h */
