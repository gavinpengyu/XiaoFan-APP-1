//
//  XFWorkTableViewCellModel.h
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFWorkTableViewCellModel_h
#define XFWorkTableViewCellModel_h

#import <Foundation/Foundation.h>

@interface XFWorkTableViewCellModel : NSObject

@property (nonatomic, copy) NSString *followedString;
@property (nonatomic, copy) NSString *ownerString;
@property (nonatomic, copy) NSString *details0String;
@property (nonatomic, copy) NSString *details1String;
@property (nonatomic, copy) NSString *priceString;

+ (instancetype)modelWithFollowed : (NSString *)followedString
                      ownerString : (NSString *)ownerString
                   details0String : (NSString *)details0String
                   details1String : (NSString *)details1String
                      priceString : (NSString *)priceString;

@end

#endif /* XFWorkTableViewCellModel_h */
