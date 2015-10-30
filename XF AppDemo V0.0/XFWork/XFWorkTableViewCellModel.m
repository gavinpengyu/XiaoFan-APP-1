//
//  XFWorkTableViewCellModel.m
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFWorkTableViewCellModel.h"

@implementation XFWorkTableViewCellModel

+ (instancetype)modelWithFollowed : (NSString *)followedString
                      ownerString : (NSString *)ownerString
                   details0String : (NSString *)details0String
                   details1String : (NSString *)details1String
                      priceString : (NSString *)priceString
{
    XFWorkTableViewCellModel *model = [[XFWorkTableViewCellModel alloc] init];
    model.followedString = followedString;
    model.ownerString = ownerString;
    model.details0String = details0String;
    model.details1String = details1String;
    model.priceString = priceString;
    return model;
}
/*
//Adapter of datacom, po, 20151027
- (NSMutableArray *) getModelDataWithFlag : (XFCellModelDataGetType) dataGetType
{
    //*********BEGIN         pseudo data, Asset, po, 20151027 ************
    NSMutableArray *tempAsset = [NSMutableArray array];
    for (int i = 0; i < 12; i++)
    {
        XFWorkTableViewCellModel *model = [XFWorkTableViewCellModel
                                           modelWithFollowed : [NSString stringWithFormat:@"%d人已关注", i]
                                           ownerString : [NSString stringWithFormat:@"番茄%d号", i]
                                           details0String : @"红街公寓"
                                           details1String : [NSString stringWithFormat:@"10-%d-1001",i]
                                           priceString : [NSString stringWithFormat:@"20%d万",i] ];
        [tempAsset addObject : model];
    }
    NSMutableArray *tempAccount = [NSMutableArray array];
    for (int i = 0; i < 12; i++)
    {
        XFWorkTableViewCellModel *model = [XFWorkTableViewCellModel
                                           modelWithFollowed : [NSString stringWithFormat:@"%d人已关注", i]
                                           ownerString : [NSString stringWithFormat:@"番茄%d号", i]
                                           details0String : @"林先生 丁桥"
                                           details1String : [NSString stringWithFormat:@"2-3房，90-100平"]
                                           priceString : [NSString stringWithFormat:@"20%d万",i] ];
        [tempAccount addObject : model];
    }
    //*********END         pseudo data, Asset, po, 20151027 **************
    
    switch (dataGetType) {
        case XFGetTypeDefault:
        {
            [tempAsset addObjectsFromArray: tempAccount];
            return tempAsset;
        }
        case XFGetTypeAsset : return tempAsset;
            
        case XFGetTypeAccount : return tempAccount;
            
        default:
        {
            NSLog(@"Error in dataGetType.");
            return nil;
        }
    }
}*/

@end