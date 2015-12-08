//
//  XFNAssetEditContactInfoView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditContactInfoView.h"

@implementation XFNAssetEditContactInfoView

- (void)layoutViews
{
    CGRect temp;
    
    temp = [self initTitleWithName: @"联系人信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    temp = [self initTitleWithName: @"标签"
                        andOriginY: (temp.origin.y + temp.size.height + XFNTableViewCellControlSpacing)];
    
    NSString* labelStringOne = [self.cellModel objectForKey: @"decorationInfo"];
    NSString* labelStringTwo = [self.cellModel objectForKey: @"ancillaryInfo"];
    
    NSArray * labelArrayOne  = [XFNFrameAssetModel initArrayByAssetString: labelStringOne];
    NSArray * labelArrayTwo  = [XFNFrameAssetModel initArrayByAssetString: labelStringTwo];
    
    NSArray * labelArray     = [labelArrayOne arrayByAddingObjectsFromArray: labelArrayTwo];
    
    temp = [self initLabelViewWithArray: labelArray
                             andOriginY: (temp.origin.y + temp.size.height)];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailContactInfoCellIndexEnum];
}

@end
