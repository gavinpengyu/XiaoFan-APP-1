//
//  XFNWorkDetailTableViewCellModel.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailTableViewCellModel_h
#define XFNWorkDetailTableViewCellModel_h

#import "XFNFrameCommonItemDetailModel.h"

@interface XFNWorkDetailTableViewCellModel : XFNFrameCommonItemDetailModel

@end

@interface XFNWorkDetailTableViewCellModelGroup : XFNFrameCommonItemDetailModel

@property (nonatomic,strong) NSMutableArray *detailTableViewModelArray;

+ (XFNWorkDetailTableViewCellModelGroup *)initWithModelGroup:(NSMutableArray *)detailTableViewModelArray;

@end

#endif /* XFNWorkDetailTableViewCellModel_h */
