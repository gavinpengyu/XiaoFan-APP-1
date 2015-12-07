//
//  XFNAssetEditTradeInfoView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditTradeInfoView.h"

@implementation XFNAssetEditTradeInfoView


- (void)layoutView
{
    CGRect temp;

    NSString* tempUnitPrice= [[NSString alloc] initWithFormat: @"%ld", ([[self.cellModel objectForKey: @"assetTotalPrice"] integerValue] * 10000/ [[self.cellModel objectForKey: @"assetTotalArea"] integerValue])];
    
    
    temp = [self initTitleWithName: @"交易信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    temp = [self initContentWithName: @"assetTotalPrice"
                            andValue: [self.cellModel objectForKey: @"assetTotalPrice"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"assetUnitPrice"
                            andValue: tempUnitPrice
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"assetStatus"
                            andValue: [self.cellModel objectForKey: @"assetStatus"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"attributeTo"
                            andValue: [self.cellModel objectForKey: @"attributeTo"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"reserveMode"
                            andValue: [self.cellModel objectForKey: @"reserveMode"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"deliveryMode"
                            andValue: [self.cellModel objectForKey: @"deliveryMode"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initTitleWithName: @"标签"
                        andOriginY: (temp.origin.y + temp.size.height + XFNTableViewCellControlSpacing)];
    
    [self layoutLabelView];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailBasicInfoCellIndexEnum];
}

- (void)layoutLabelView
{
    
}


@end
