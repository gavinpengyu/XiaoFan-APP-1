//
//  XFNWorkDetailImageViewCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"

#import "XFNWorkDetailImageViewCell.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailImageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void) initSubView
{
    self.backgroundColor = [UIColor whiteColor];
    
    _imageSlideVC = [[XFNImageSlideViewController alloc]init];
    
    //如果想添加pageControl,就将其置为YES,不需要的可以不写,或者置为NO
    _imageSlideVC.isPageControl = YES;
    _imageSlideVC.delegate = self;
    
    //设置子控制器view的frame
    _imageSlideVC.view.frame = CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenWidth*9/16);
    [self addSubview:_imageSlideVC.view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapAction:)];
    [_imageSlideVC.view addGestureRecognizer:tap];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame = CGRectMake (0, 0, _Macro_ScreenWidth, (_Macro_ScreenWidth * 9/16));
}

- (void) initViewLayout
{
    
}

- (void)handleTapAction:(UITapGestureRecognizer *)sender
{
    //po 20151203 后续在此处添加点击图片的action
    DLog(@"当前点击了第 %ld 张图片",[_imageSlideVC backCurrentCilkPicture]);
}

- (NSMutableArray *)backDataSourceArray
{
    NSArray *array = @[@"TestImage0.jpg",@"TestImage1.jpg",@"TestImage2.jpg",@"TestImage3.jpg",@"TestImage4.jpg",@"TestImage5.jpg",@"TestImage6.jpg"];
    return [NSMutableArray arrayWithArray:array];
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
}

@end

