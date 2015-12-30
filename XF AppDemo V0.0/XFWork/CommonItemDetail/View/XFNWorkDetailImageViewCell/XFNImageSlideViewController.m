//
//  XFNImageSlideViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"

#import "XFNWorkDetailImageViewCell.h"
#import "XFNImageSlideViewController.h"

//-----------------------------------------------------------------------------------------
@interface XFNImageSlideViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *leftImageView, *middleImageView, *rightImageView;

@property (nonatomic, strong) UIScrollView *scrollerView;
//当前展示的图片
@property (nonatomic, assign) NSInteger currentIndex;
//数据源
@property (nonatomic, strong) NSMutableArray *dataSource;
//scrollerView的宽高
@property (nonatomic, assign) NSInteger scrollerViewWidth, scrollerViewHeight;

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation XFNImageSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollerViewWidth = _Macro_ScreenWidth;
    _scrollerViewHeight = self.scrollerViewWidth * 0.5625;
    
    if (_delegate && [_delegate respondsToSelector:@selector(backDataSourceArray)])
    {
        if (_delegate && [_delegate respondsToSelector:@selector(backScrollerViewForWidthAndHeight)])
        {
            CGSize size = [_delegate backScrollerViewForWidthAndHeight];
            self.scrollerViewWidth = size.width;
            self.scrollerViewHeight = size.height;
        }
        
        self.dataSource = [NSMutableArray arrayWithArray:[_delegate backDataSourceArray]];
        [self configureScrollerView];
        [self configureImageView];
        
        if (self.isPageControl)
        {
            [self configurePageController];
        }
        
    }
    
}

- (void)configureScrollerView{
    
    _scrollerView                 = [[UIScrollView alloc]initWithFrame:(CGRectMake(0, 0, self.scrollerViewWidth, self.scrollerViewHeight))];
    _scrollerView.backgroundColor = [UIColor lightGrayColor];
    _scrollerView.delegate        = self;
    _scrollerView.contentSize     = CGSizeMake(self.scrollerViewWidth * 3, self.scrollerViewHeight);
    _scrollerView.contentOffset   = CGPointMake(self.scrollerViewWidth, 0);
    _scrollerView.pagingEnabled   = YES;
    [self.view addSubview:_scrollerView];
}

- (void)configureImageView{
    
    self.leftImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(0, 0, self.scrollerViewWidth, self.scrollerViewHeight))];
    self.middleImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(self.scrollerViewWidth, 0, self.scrollerViewWidth, self.scrollerViewHeight))];
    self.rightImageView = [[UIImageView alloc]initWithFrame:(CGRectMake(2*self.scrollerViewWidth, 0, self.scrollerViewWidth, self.scrollerViewHeight))];
    self.scrollerView.showsHorizontalScrollIndicator = NO;
    if (self.dataSource.count != 0) {
        self.leftImageView.image = [UIImage imageNamed:self.dataSource.lastObject];
        self.middleImageView.image = [UIImage imageNamed:self.dataSource.firstObject];
        self.rightImageView.image = [UIImage imageNamed:self.dataSource[1]];
    }
    [self.scrollerView addSubview:self.leftImageView];
    [self.scrollerView addSubview:self.middleImageView];
    [self.scrollerView addSubview:self.rightImageView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat offset = scrollView.contentOffset.x;
    if (self.dataSource.count != 0) {
        if (offset >= 2*self.scrollerViewWidth) {
            scrollView.contentOffset = CGPointMake(self.scrollerViewWidth, 0);
            
            self.currentIndex++;
            
            if (self.currentIndex == self.dataSource.count -1) {
                self.leftImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex - 1]];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource.firstObject];
                self.pageControl.currentPage = self.currentIndex;
                self.currentIndex = -1;
            }
            else if (self.currentIndex == self.dataSource.count){
                
                self.leftImageView.image = [UIImage imageNamed:self.dataSource.lastObject];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource.firstObject];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource[1]];
                self.pageControl.currentPage = 0;
                self.currentIndex = 0;
            }
            else if(self.currentIndex == 0){
                self.leftImageView.image = [UIImage imageNamed:self.dataSource.lastObject];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex+1]];
                self.pageControl.currentPage = self.currentIndex;
            }else{
                self.leftImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex-1]];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex+1]];
                self.pageControl.currentPage = self.currentIndex;
            }
            
        }
        if (offset <= 0) {
            scrollView.contentOffset = CGPointMake(self.scrollerViewWidth, 0);
            self.currentIndex--;
            if (self.currentIndex == -2) {
                self.currentIndex = self.dataSource.count-2;
                self.leftImageView.image = [UIImage imageNamed:self.dataSource[self.dataSource.count-1]];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource.lastObject];
                self.pageControl.currentPage = self.currentIndex;
            }
            else if (self.currentIndex == -1) {
                self.currentIndex = self.dataSource.count-1;
                self.leftImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex-1]];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource.firstObject];
                self.pageControl.currentPage = self.currentIndex;
            }else if (self.currentIndex == 0){
                self.leftImageView.image = [UIImage imageNamed:self.dataSource.lastObject];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex+1]];
                self.pageControl.currentPage = self.currentIndex;
            }else{
                self.leftImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex-1]];
                self.middleImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex]];
                self.rightImageView.image = [UIImage imageNamed:self.dataSource[self.currentIndex+1]];
                self.pageControl.currentPage = self.currentIndex;
            }
            
        }
    }
    
    
    
}

- (void)configurePageController{
    
    _pageControl                               = [[UIPageControl alloc]initWithFrame:(CGRectMake(-30, _scrollerViewHeight-20, _scrollerViewWidth, 20))]; //po 20151203 后期需要用算法调整，不能直接使用数字固定
    _pageControl.numberOfPages                 = self.dataSource.count;
    _pageControl.pageIndicatorTintColor        = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.userInteractionEnabled        = NO;
    [self.view addSubview:_pageControl];
}

//返回当前展示的是第几张图片
- (NSInteger)backCurrentCilkPicture{
    
    return self.pageControl.currentPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end