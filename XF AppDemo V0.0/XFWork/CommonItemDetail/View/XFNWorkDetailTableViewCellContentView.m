//
//  XFNWorkDetailTableViewCell.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNWorkDetailTableViewCellContentView.h"

@implementation XFNWorkDetailTableViewCellContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    XFNWorkDetailTableViewCellContentView *view = [[[NSBundle mainBundle] loadNibNamed:@"XFNWorkDetailTableViewCellContentView" owner:nil options:nil] lastObject];
    return view;
}

@end