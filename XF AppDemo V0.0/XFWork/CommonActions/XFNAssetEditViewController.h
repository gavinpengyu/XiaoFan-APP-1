//
//  XFNAssetEditViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNAssetEditViewController_h
#define XFNAssetEditViewController_h

#import "XFNWorkDetailTableViewController.h"

@protocol  XFNEditViewToControllerDelegate

- (void)toBackAndSubmitObject : (XFNFrameAssetModel*) object withCellIndex: (XFNDetailViewCellIndexEnum) cellIndex;

@end

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditViewController : UIViewController <XFNSendAssetModelToDetailViewDelegate, XFNEditViewToControllerDelegate>
{
    XFNFrameAssetModel *_detailModel;
}
//po 20151207 从编辑界面返回detail view时，直接将编辑后的数据通过传回，不从服务器刷新
@property (nonatomic,strong) id <XFNSendAssetModelToDetailViewDelegate> delegate;

@end

#endif /* XFNAssetEditViewController_h */
