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

@property (nonatomic, copy) NSString* nameString;
@property (nonatomic, copy) NSString* detailString;
@property (nonatomic, copy) NSString* priceString;
@property (nonatomic, copy) NSString* statusString;
@property (nonatomic, copy) NSString* ownernameString;
@property (nonatomic, copy) NSString* sendtimeString;
@property (nonatomic, copy) UIImage*  ownerImage;

@property (nonatomic, copy) XFNFrameAssetModel *assetAllInfoModel;

+ (instancetype)initWithObject: (XFNFrameAssetModel*) assetModel;

@end

#endif /* XFNWorkTableViewCellModel_h */
