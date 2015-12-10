//
//  XFNAssetEditAuxiliaryInfoView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditAuxiliaryInfoView.h"

@implementation XFNAssetEditAuxiliaryInfoView

- (void)layoutViews
{
    CGRect temp;
    
    temp = [self initTitleWithName: @"配套信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    temp = [self initTitleWithName: @"标签"
                        andOriginY: (temp.origin.y + temp.size.height + XFNTableViewCellControlSpacing)];
    
    NSString* labelStringdecorationInfo = [self.cellModel objectForKey: @"decorationInfo"];
    NSString* labelStringancillaryInfo  = [self.cellModel objectForKey: @"ancillaryInfo"];
    
    NSArray * labelArraydecorationInfo  = [XFNFrameAssetModel initArrayByAssetString: labelStringdecorationInfo];
    NSArray * labelArrayancillaryInfo   = [XFNFrameAssetModel initArrayByAssetString: labelStringancillaryInfo];
    
    temp = [self initLabelViewWithArray: labelArraydecorationInfo
                             andOriginY: (temp.origin.y + temp.size.height)
                        andPropertyName: @"decorationInfo"];
    
    temp = [self initLabelViewWithArray: labelArrayancillaryInfo
                             andOriginY: (temp.origin.y + temp.size.height - 10)
                        andPropertyName: @"ancillaryInfo"];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailAuxiliaryInfoCellIndexEnum];
}

@end
