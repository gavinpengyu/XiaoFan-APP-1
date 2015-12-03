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
        tempLabel.textAlignment       = NSTextAlignmentCenter;
        tempLabel.font                = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)];
        
        tempLabelX            = tempLabelOriginX + XFNTableViewCellControlSpacing;
//        CGFloat tempLabelY            = 0; //UIView是从origin.y开始布局，但是label在UIview的内部，应该是从0开始
        CGSize  tempLabelSize         = [tempLabel.text sizeWithAttributes : @{NSFontAttributeName : tempLabel.font}];
        
        tempLabelSize.width           = tempLabelSize.width + XFNTableViewCellControlSpacing/2; //边框两边各留半个spacing，总宽度根据标签字数的多少自适应
        tempLabelSize.height          = _Macro_XFNWorTableViewCellAssetLabelHeight; //固定高度
        
        //若放置本label之后离屏幕最右侧不足一个XFNTableViewCellControlSpacing，则新起一行，从最左侧开始放置
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
    return view;
}

@end

