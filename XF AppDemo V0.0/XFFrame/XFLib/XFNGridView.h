//
//  XFNGridView.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/1.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNGridView_h
#define XFNGridView_h

#import <UIKit/UIKit.h>

@interface XFNGridView : UIView

/**
 * @brief 网格间距，默认30
 */
@property (nonatomic, assign) CGFloat   gridSpacing;

/**
 * @brief 网格线宽度，默认为1 pixel (1.0f / [UIScreen mainScreen].scale)
 */
@property (nonatomic, assign) CGFloat   gridLineWidth;

/**
 * @brief 网格颜色，默认蓝色
 */
@property (nonatomic, strong) UIColor   *gridColor;

@end

//DEMO TO USE
//XFNGridView *gridView = [[XFNGridView alloc] initWithFrame:self.view.bounds];
//gridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//gridView.alpha = 0.6;
//gridView.gridColor = [UIColor greenColor];
//[self.view addSubview:gridView];

#endif /* XFNGridView_h */
