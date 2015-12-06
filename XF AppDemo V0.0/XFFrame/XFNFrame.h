//
//  XFNFrame.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/11/2.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrame_h
#define XFNFrame_h

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define _Macro_XFN_ASSET_MODEL_ @"XFNFrameAssetModelNew"
#define _Macro_XFN_ASSET_LABEL_MODEL_ @"XFNLabelsForAsset"

#define _Macro_XFN_String_Seperator @"|*|"

#define _Macro_XFN_Comment_Auto     @"|SYS_LOG|"
#define _Macro_XFN_Comment_Manual   @"|USR_COMMENT|"
#define _Macro_XFN_Comment_Key      @"|KEY_REMARK|"

#define _Macro_ScreenWidth [UIScreen mainScreen].bounds.size.width

#define _Macro_XFNWorTableViewCellHorizontalSeperatorHeight 1
#define _Macro_XFNWorTableViewCellVerticalSeperatorWidth 1

#define _Macro_XFNWorTableViewCellAssetLabelWidth 50
#define _Macro_XFNWorTableViewCellAssetLabelHeight 20
#define _Macro_XFNWorTableViewCellAssetLabelFont (XFNDetailTableViewCellFontSizeDefault - 2)

#define _Macro_XFNWorkDetailTableView_Accessory_Width 20
#define _Macro_XFNWorkDetailTableView_Accessory_Height 20

#define _Macro_XFNWorTableViewCell_TypeOfPay_Label_Color   [UIColor redColor]
#define _Macro_XFNWorTableViewCell_TaxInfo_Label_Color     [UIColor greenColor]
#define _Macro_XFNWorTableViewCell_AssetLayout_Label_Color [UIColor blueColor]
#define _Macro_XFNWorTableViewCell_Decoration_Label_Color  [UIColor brownColor]
#define _Macro_XFNWorTableViewCell_Ancillary_Label_Color   [UIColor orangeColor]

//控件间距
#define XFNTableViewCellControlSpacing 10
#define XFNCommentItemAvatarDefaultSize 28

//-----------------------------------------------------------------------------------------
#define XFNDetailTableViewCellCoordinateDefaultX 10
#define XFNDetailTableViewCellCoordinateDefaultY 10




typedef NS_ENUM(NSInteger, XFNDetailTableViewCellFontSize) {
    XFNDetailTableViewCellFontSizeDefault = 14,
    XFNDetailTableViewCellFontSizeL       = XFNDetailTableViewCellFontSizeDefault + 2,
    XFNDetailTableViewCellFontSizeXL      = XFNDetailTableViewCellFontSizeL + 2,
    XFNDetailTableViewCellFontSizeXXL     = XFNDetailTableViewCellFontSizeXL + 2,
};

#endif /* XFNFrame_h */
