//
//  XFNAssetEditViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNAssetEditViewController.h"

@implementation XFNAssetEditViewController
//-----------------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark Protocol Delegate, From detail view to edit view, here is receiver
//-----------------------------------------------------------------------------------------
- (void)toSendAssetModelwithObject : (XFNFrameAssetModel*) object
{
    _detailModel = object;
}

#pragma mark Protocol Delegate, From edit view cell to edit view controller, here is receiver
- (void)toBackAndSubmitObject : (XFNFrameAssetModel*) object withCellIndex: (XFNDetailViewCellIndexEnum) cellIndex
{
    _detailModel = object;
    
    //根据类型上传至服务器
    if (XFNWorkDetailBasicInfoCellIndexEnum == cellIndex)
    {
        XFNFrameAssetModel *tempModel = [XFNFrameAssetModel objectWithoutDataWithClassName: _Macro_XFN_ASSET_MODEL_
                                                                                  objectId: _detailModel.objectId];
        
        tempModel.assetTotalArea         = [_detailModel objectForKey: @"assetTotalArea"];
        tempModel.assetSharedArea        = [_detailModel objectForKey: @"assetSharedArea"];
        tempModel.quantityOfRoom         = [_detailModel objectForKey: @"quantityOfRoom"];
        tempModel.quantityOfToilet       = [_detailModel objectForKey: @"quantityOfToilet"];
        tempModel.assetStorey            = [_detailModel objectForKey: @"assetStorey"];
        tempModel.storeyOfAll            = [_detailModel objectForKey: @"storeyOfAll"];
        tempModel.basicInfoLabelsOfAsset = [_detailModel objectForKey: @"basicInfoLabelsOfAsset"];
        [tempModel saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded)
            {
                DLog(@"objectId=%@ updated", _detailModel.objectId);
            }
        }];
    }
    
    //返回detail view
    [self.delegate toSendAssetModelwithObject: _detailModel];
    [[self navigationController] popViewControllerAnimated:YES];
}

@end