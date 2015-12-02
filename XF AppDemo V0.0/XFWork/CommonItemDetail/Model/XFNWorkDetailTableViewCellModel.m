//
//  XFNWorkDetailTableViewCellModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNWorkDetailTableViewCellModel.h"


//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTableViewCellModel

@end

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailBasicInfoCellModel

- (instancetype)initWithObject: (AVObject*) assetModel
{
    XFNWorkDetailBasicInfoCellModel* model = [[XFNWorkDetailBasicInfoCellModel alloc] init];
    
    model.areaString       = [[NSString alloc] initWithFormat : @"%@平米", [assetModel objectForKey : @"assetTotalArea"]];
    model.sharedAreaString = [[NSString alloc] initWithFormat : @"%@平米", [assetModel objectForKey : @"assetSharedArea"]];
    model.unitLayoutString = [[NSString alloc] initWithFormat : @"%@房%@卫", [assetModel objectForKey : @"quantityOfRoom"],
                                                                             [assetModel objectForKey : @"quantityOfToilet"]];
    model.storeyString     = [[NSString alloc] initWithFormat : @"%@/%@",    [assetModel objectForKey : @"assetStorey"],
                                                                             [assetModel objectForKey : @"storeyOfAll"]];

    NSString *tempLabelString = [assetModel objectForKey : @"basicInfoLabelsOfAsset"];
    model.labelsArray         = [tempLabelString componentsSeparatedByString:@","];
    
    return model;
}
@end
