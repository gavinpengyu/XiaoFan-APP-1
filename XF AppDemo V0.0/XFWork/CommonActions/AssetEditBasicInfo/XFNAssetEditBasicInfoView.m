//
//  XFNAssetEditBasicInfoView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditBasicInfoView.h"

@implementation XFNAssetEditBasicInfoView


- (void)layoutView
{
    CGRect temp;
    
    temp = [self initTitleWithName: @"基本信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    temp = [self initContentWithName: @"assetTotalArea"
                            andValue: [self.cellModel objectForKey: @"assetTotalArea"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"assetSharedArea"
                            andValue: [self.cellModel objectForKey: @"assetSharedArea"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"quantityOfRoom"
                            andValue: [self.cellModel objectForKey: @"quantityOfRoom"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"quantityOfToilet"
                            andValue: [self.cellModel objectForKey: @"quantityOfToilet"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"assetStorey"
                            andValue: [self.cellModel objectForKey: @"assetStorey"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initContentWithName: @"storeyOfAll"
                            andValue: [self.cellModel objectForKey: @"storeyOfAll"]
                          andOriginY: (temp.origin.y + temp.size.height)
                     andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    
    temp = [self initTitleWithName: @"标签"
                        andOriginY: (temp.origin.y + temp.size.height + XFNTableViewCellControlSpacing)];
    
    NSArray * labelArray = [NSArray array];
    labelArray = [[self.cellModel objectForKey: @"basicInfoLabelsOfAsset"] componentsSeparatedByString: _Macro_XFN_String_Seperator];
    
    temp = [self initLabelViewWithArray: labelArray
                             andOriginY: (temp.origin.y + temp.size.height)];
    
    
    [self layoutLabelView];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailBasicInfoCellIndexEnum];
}

- (void)layoutLabelView
{

}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [self resignFirstResponder];
//    return YES;
//}
//
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    if ([self isFirstResponder])
//    {
//        [self resignFirstResponder]; //输入完毕后，关闭键盘空间控件
//    }
//}

@end