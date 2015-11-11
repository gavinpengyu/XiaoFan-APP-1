//
//  XFNWorkDetailTableViewCellModel.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNWorkDetailTableViewCellModel.h"

@implementation XFNWorkDetailTableViewCellModel

@end

@implementation XFNWorkDetailTableViewCellModelGroup

+ (XFNWorkDetailTableViewCellModelGroup *)initWithModelGroup:(NSMutableArray *)detailTableViewModelArray
{
    XFNWorkDetailTableViewCellModelGroup *group = [[XFNWorkDetailTableViewCellModelGroup alloc] init];
    
    group.detailTableViewModelArray = detailTableViewModelArray;
    
    return group;
    
}

@end