//
//  XFNImageSlideViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNImageSlideViewController_h
#define XFNImageSlideViewController_h

@protocol  XFNImageSlideViewControllerDelegate<NSObject>

@required

- (NSMutableArray *)backDataSourceArray;

@optional
//返回ScrollerView的宽和高
- (CGSize)backScrollerViewForWidthAndHeight;


@end

@interface XFNImageSlideViewController : UIViewController

@property (nonatomic, assign) id<XFNImageSlideViewControllerDelegate> delegate;

@property (nonatomic, assign) BOOL isPageControl;

//返回当前点的是第几张图片
- (NSInteger)backCurrentCilkPicture;

@end

#endif /* XFNImageSlideViewController_h */
