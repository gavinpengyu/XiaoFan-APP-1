//
//  XFNWorkTableViewHeader.m
//  XFN AppDemo V0.0
//
//  Created by po on 10/17/15.
//  Copyright © 2015 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNWorkTableViewHeader.h"
#import "XFNWorkTableViewHeaderItemButton.h"
#import "UIView+XFNExtension.h"
//#import "XFNWorkTableViewController.h"



@implementation XFNWorkTableViewHeader

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
    
    [headerItemModelsArray enumerateObjectsUsingBlock:^(XFNWorkTableViewHeaderItemModel *model, NSUInteger idx, BOOL *stop) {
        XFNWorkTableViewHeaderItemButton *button = [[XFNWorkTableViewHeaderItemButton alloc] init];
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

- (void)buttonClickd:(XFNWorkTableViewHeaderItemButton *)button
{
    if (self.buttonClickedOperationBlock)
    {
        self.buttonClickedOperationBlock(button.tag);
    }
}

@end


@implementation XFNWorkTableViewHeaderItemModel

+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    XFNWorkTableViewHeaderItemModel *model = [[XFNWorkTableViewHeaderItemModel alloc] init];
    model.title = title;
    model.imageName = imageName;
    //model.destinationControllerClass = destinationControllerClass;
    return model;
}

@end