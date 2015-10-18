//
//  XFWorkTableViewHeader.m
//  XF AppDemo V0.0
//
//  Created by po on 10/17/15.
//  Copyright © 2015 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFWorkTableViewHeader.h"
#import "XFWorkTableViewHeaderItemButton.h"
#import "UIView+XFExtension.h"



@implementation XFWorkTableViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) { //此处可能有bug，为什么是＝而不是＝＝？po,20151018
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setHeaderItemModelsArray:(NSArray *)headerItemModelsArray
{
    _headerItemModelsArray = headerItemModelsArray;
    
    [headerItemModelsArray enumerateObjectsUsingBlock:^(XFWorkTableViewHeaderItemModel *model, NSUInteger idx, BOOL *stop) {
        XFWorkTableViewHeaderItemButton *button = [[XFWorkTableViewHeaderItemButton alloc] init];
        button.tag = idx;
        button.title = model.title;
        button.imageName = model.imageName;
        [button addTarget:self action:@selector(buttonClickd:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.subviews.count == 0) return;
    CGFloat w = self.sd_width / self.subviews.count;
    CGFloat h = self.sd_height;
    [self.subviews enumerateObjectsUsingBlock:^(UIView *button, NSUInteger idx, BOOL *stop) {
        button.frame = CGRectMake(idx * w, 0, w, h);
    }];
}

- (void)buttonClickd:(XFWorkTableViewHeaderItemButton *)button
{
    if (self.buttonClickedOperationBlock) {
        self.buttonClickedOperationBlock(button.tag);
    }
}

@end


@implementation XFWorkTableViewHeaderItemModel

+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName destinationControllerClass:(Class)destinationControllerClass
{
    XFWorkTableViewHeaderItemModel *model = [[XFWorkTableViewHeaderItemModel alloc] init];
    model.title = title;
    model.imageName = imageName;
    model.destinationControllerClass = destinationControllerClass;
    return model;
}

@end