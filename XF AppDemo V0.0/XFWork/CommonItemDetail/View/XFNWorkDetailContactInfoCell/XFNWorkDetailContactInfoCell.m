//
//  XFNWorkDetailContactInfoCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"
#import "XFNWorkDetailTableViewCellModel.h"

#import "XFNWorkDetailContactInfoCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailContactInfoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
}

@end