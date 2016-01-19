//
//  XFNWorkTableViewCellModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkTableViewCellModel_h
#define XFNWorkTableViewCellModel_h

#import <Foundation/Foundation.h>
#import "XFNFrameAssetModel.h"

@interface XFNWorkTableViewCellModel : XFNFrameAssetModel
{
    XFNFrameAssetModel *_assetAllInfoModel;
}
@property (nonatomic, copy) NSString* ownernameString;
@property (nonatomic, copy) NSString* sendtimeString;
@property (nonatomic, copy) UIImage*  ownerImage;

@property (nonatomic, copy) NSString* nameString;
@property (nonatomic, copy) NSString* detailString;
@property (nonatomic, copy) NSString* priceString;
@property (nonatomic, copy) NSString* statusString;

@property (nonatomic, copy) NSArray* labelsArray;

@property (nonatomic, assign) Boolean    bThisItemIsOnTop;
@property (nonatomic, assign) Boolean    bThisItemIsFollowed;

- (instancetype)initWithObject: (AVObject*) assetModel;

- (void)setBThisItemIsFollowed:(Boolean)bThisItemIsFollowed;

- (void)setBThisItemIsOnTop:(Boolean)bThisItemIsOnTop;

@end

#endif /* XFNWorkTableViewCellModel_h */
