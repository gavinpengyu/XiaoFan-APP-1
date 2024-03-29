//
//  XFNWorkDetailTableViewCell.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "XFNFrame.h"
#import "XFNWorkTableViewCell.h" //需要使用类方法获取标签颜色
#import "XFNWorkDetailTableViewCell.h"
#import "XFNWorkDetailTableViewCellModel.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkDetailTableViewCell

+ (UILabel*)initLabelWithTextColor: (UIColor*) color andFont: (UIFont*) font
{
    UILabel* label    = [[UILabel alloc] init];
    label.textColor   = color;
    label.font        = font;
    return label;
}

+ (UIView*) initLabelUIViewWithArray: (NSArray*) array andOriginPoint: (CGPoint) origin;
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    
    if (nil == array)
    {
        return view;
    }
    
    CGFloat tempLabelOriginX = origin.x;
    CGFloat tempLabelOriginY = origin.y;
    
    CGRect tempRect = CGRectMake(0,0,0,0);
    
    CGFloat tempLabelX            = tempLabelOriginX + XFNTableViewCellControlSpacing;
    CGFloat tempLabelY            = 0; //UIView是从origin.y开始布局，但是label在UIview的内部，应该是从0开始
    
    for (int iIndex=0; iIndex < array.count; iIndex++)
    {
        UILabel * tempLabel           = [[UILabel alloc] init];
        tempLabel.text                = array[iIndex];
        tempLabel.textColor           = [XFNWorkTableViewCell getTheColorOfLabel: tempLabel.text];//_Macro_XFNWorTableViewCell_AssetLayout_Label_Color;
        tempLabel.layer.borderColor   = [XFNWorkTableViewCell getTheColorOfLabel: tempLabel.text].CGColor;
        tempLabel.layer.borderWidth   = 1;
        tempLabel.layer.cornerRadius  = 3;
        tempLabel.textAlignment       = NSTextAlignmentCenter;
        tempLabel.font                = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)];
        
        tempLabelX                    = tempLabelOriginX + XFNTableViewCellControlSpacing;
        CGSize  tempLabelSize         = [tempLabel.text sizeWithAttributes : @{NSFontAttributeName : tempLabel.font}];
        
        tempLabelSize.width           = tempLabelSize.width + XFNTableViewCellControlSpacing/2; //边框两边各留半个spacing，总宽度根据标签字数的多少自适应
        tempLabelSize.height          = _Macro_XFNWorTableViewCellAssetLabelHeight; //固定高度
        
        //若放置本label之后离屏幕最右侧不足一个XFNTableViewCellControlSpacing，则新起一行，从最左侧开始放置。
        if ((tempLabelX + tempLabelSize.width) > (_Macro_ScreenWidth - XFNTableViewCellControlSpacing))
        {
            tempLabelY                = tempLabelOriginY + tempLabelSize.height + XFNTableViewCellControlSpacing;
            tempLabelX                = origin.x + XFNTableViewCellControlSpacing;
        }
        
        CGRect  tempLabelRect         = CGRectMake(tempLabelX,
                                                   tempLabelY,
                                                   tempLabelSize.width,
                                                   tempLabelSize.height);
        
        tempLabel.frame               = tempLabelRect;
        
        [view addSubview : tempLabel];
        
        tempLabelOriginX = tempLabelX + tempLabelSize.width;
        tempLabelOriginY = tempLabelY;
        tempRect         = CGRectMake(origin.x, origin.y, (_Macro_ScreenWidth - origin.x), (tempLabelOriginY + tempLabelSize.height));
    }
    view.frame = tempRect;
    
    //DLog(@"%@, x = %f, y = %f", array, origin.x, origin.y);
    
    return view;
}

+ (UIView*) initCommentBarUIViewWithFont: (UIFont*) font andOriginPoint: (CGPoint) origin andIsFollowedFlag: (BOOL) flag
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,0)];
    
    //跟进－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UILabel* commentsLabel      = [[UILabel alloc] init];
    commentsLabel.textColor     = [UIColor blackColor];
    commentsLabel.text          = @"跟进";
    commentsLabel.textAlignment = NSTextAlignmentCenter;
    commentsLabel.font          = font;
    [view addSubview : commentsLabel];
    
    //关注－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UILabel* isFollowedLabel      = [[UILabel alloc] init];
    isFollowedLabel.textColor     = [UIColor blackColor];
    if (flag)
    {
        isFollowedLabel.text          = @"取消关注";//已关注，则显示“取消关注”
    }
    else
    {
        isFollowedLabel.text          = @"关注";//未关注，则显示“关注”
    }
    isFollowedLabel.textAlignment = NSTextAlignmentCenter;
    isFollowedLabel.font          = font;
    [view addSubview : isFollowedLabel];
    
    //更多－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UILabel* moreActionLabel      = [[UILabel alloc] init];
    moreActionLabel.textColor     = [UIColor blackColor];
    moreActionLabel.text          = @"更多";
    moreActionLabel.textAlignment = NSTextAlignmentCenter;
    moreActionLabel.font          = font;
    [view addSubview : moreActionLabel];
    
    //Layout－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    
    //跟进－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    CGFloat commentsLabelY      = origin.y + XFNTableViewCellControlSpacing; //在Label下方
    CGFloat commentsLabelX      = origin.x + XFNTableViewCellControlSpacing; //与detailLabel X对齐；
    CGSize  commentsLabelSize   = [commentsLabel.text sizeWithAttributes : @{NSFontAttributeName : commentsLabel.font}];
    commentsLabelSize.width     = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing*2) / 3; //底部分为3个按钮，跟进在最左侧
    commentsLabelSize.height    = commentsLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  commentsLabelRect   = CGRectMake(commentsLabelX,
                                             commentsLabelY,
                                             commentsLabelSize.width,
                                             commentsLabelSize.height);
    commentsLabel.frame         = commentsLabelRect;
    
    //关注－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_isFollowedLabel
    CGFloat isFollowedLabelY    = commentsLabelY; //与跟进Y对齐
    CGFloat isFollowedLabelX    = commentsLabelX + commentsLabelSize.width; //在跟进X的后面
    CGSize  isFollowedLabelSize = [isFollowedLabel.text sizeWithAttributes : @{NSFontAttributeName : isFollowedLabel.font}];
    isFollowedLabelSize.width   = commentsLabelSize.width;//底部分为3个按钮，关注在最中间
    isFollowedLabelSize.height  = isFollowedLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  isFollowedLabelRect = CGRectMake(isFollowedLabelX,
                                             isFollowedLabelY,
                                             isFollowedLabelSize.width,
                                             isFollowedLabelSize.height);
    isFollowedLabel.frame      = isFollowedLabelRect;
    
    //在“关注”的前方添加一条分割竖线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UIView * gridVerticalLineOne = [[UIView alloc] initWithFrame: CGRectMake (isFollowedLabelX,
                                                                              isFollowedLabelY + 2,
                                                                              _Macro_XFNWorTableViewCellVerticalSeperatorWidth,
                                                                              isFollowedLabelSize.height - 4)];
    gridVerticalLineOne.backgroundColor = [UIColor lightGrayColor];
    [view addSubview: gridVerticalLineOne];
    
    //更多－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_moreActionLabel
    CGFloat moreActionLabelY    = commentsLabelY; //与跟进Y对齐
    CGFloat moreActionLabelX    = isFollowedLabelX + isFollowedLabelSize.width; //在关注X的后面
    CGSize  moreActionLabelSize = [moreActionLabel.text sizeWithAttributes : @{NSFontAttributeName : moreActionLabel.font}];
    moreActionLabelSize.width   = commentsLabelSize.width;//底部分为3个按钮，更多在最右侧
    moreActionLabelSize.height  = moreActionLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  moreActionLabelRect = CGRectMake(moreActionLabelX,
                                             moreActionLabelY,
                                             moreActionLabelSize.width,
                                             moreActionLabelSize.height);
    moreActionLabel.frame      = moreActionLabelRect;
    
    //在“更多”的前方添加一条分割竖线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UIView * gridVerticalLineTwo = [[UIView alloc] initWithFrame: CGRectMake (moreActionLabelX,
                                                                              moreActionLabelY + 2,
                                                                              _Macro_XFNWorTableViewCellVerticalSeperatorWidth,
                                                                              moreActionLabelSize.height - 4)];
    gridVerticalLineTwo.backgroundColor = [UIColor lightGrayColor];
    [view addSubview: gridVerticalLineTwo];

    view.frame = CGRectMake(origin.x,
                            origin.y,
                            _Macro_ScreenWidth,
                            (gridVerticalLineTwo.frame.origin.y + gridVerticalLineTwo.frame.size.height));
    
    return view;
}

+ (NSArray*)arrayFromString: (NSString*) string  withFont: (UIFont*) font splitedByLimitedScreenWidth: (CGFloat) width
{
    NSMutableArray *tempArray = [NSMutableArray array];
    
    if ((nil == string) || (nil == font) || (0 == width))
    {
        DLog(@"ERROR: 分隔String失败，入参错误，%@%@%f", string, font, width);
        return nil;
    }
    
    //string的长度未越界
    CGSize  tempSize         = [string sizeWithAttributes : @{NSFontAttributeName : font}];
    
    if (tempSize.width < width)
    {
        [tempArray addObject: string];
        return tempArray;
    }
    
    //string长度越界，用X的个数来判断当前宽度和字体情况下最多可以放置多少个字符
    NSInteger iMaximumLength = 0;
    NSString* tempString     = [[NSString alloc] initWithFormat: @"测"];
    NSString* tempAddString  = [[NSString alloc] initWithFormat: @"测"];
    
    while (1)
    {
        iMaximumLength++;
        tempString      = [tempString stringByAppendingString: tempAddString];
        CGSize  tmpSize = [tempString sizeWithAttributes : @{NSFontAttributeName : font}];
        if (tmpSize.width > width)
        {
            break;
        }
    
    }

    //根据subString长度分隔原始string，并依次存入数组
    NSString* tempString2 = [[NSString alloc] initWithString: string];
    while (1)
    {
        if (tempString2.length > iMaximumLength)
        {
            tempAddString = [tempString2 substringToIndex: iMaximumLength];
            tempString2    = [tempString2 substringFromIndex: iMaximumLength];
            
            [tempArray addObject: tempAddString];
            
            CGSize  tmpSize = [tempString2 sizeWithAttributes : @{NSFontAttributeName : font}];
            if (tmpSize.width < width)
            {
                [tempArray addObject: tempString2];
                break;
            }
        }
        else
        {
            CGSize  tmpSize = [tempString2 sizeWithAttributes : @{NSFontAttributeName : font}];
            if (tmpSize.width < width)
            {
                [tempArray addObject: tempString2];
                break;
            }
            else
            {
                DLog(@"ERROR: 分隔String失败，逻辑错误，string＝%@, iMaximumLength=%ld, tmpSize.width=%f", tempString2, iMaximumLength, tmpSize.width);
                break;
            }
        }
    }

    return tempArray;
}

@end






















































