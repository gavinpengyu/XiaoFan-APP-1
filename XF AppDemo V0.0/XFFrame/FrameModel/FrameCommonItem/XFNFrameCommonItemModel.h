//
//  XFNFrameCommonItemModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/31.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrameCommonItemModel_h
#define XFNFrameCommonItemModel_h

#import <UIKit/UIKit.h>

@interface XFNFrameCommonItemModel : NSObject

@property (nonatomic, copy) NSString* nameString;
@property (nonatomic, copy) NSString* detailString;
@property (nonatomic, copy) NSString* priceString;
@property (nonatomic, copy) NSString* statusString;
@property (nonatomic, copy) NSString* ownernameString;
@property (nonatomic, copy) NSString* sendtimeString;
@property (nonatomic, copy) UIImage*  ownerImage;

+ (instancetype)initmodelWithname : (NSString *)nameString
                           detail : (NSString *)detailString
                            price : (NSString *)priceString
                           status : (NSString *)statusString
                        ownername : (NSString *)ownernameString
                         sendtime : (NSString *)sendtimeString
                       ownerimage : (UIImage *) ownerImage;

@end

#endif /* XFNFrameCommonItemModel_h 0x10cd0c5e0*/
