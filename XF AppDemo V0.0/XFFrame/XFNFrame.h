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

//颜色宏定义
#define XFNColor(r,g,b)                   [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1]
#define XFNTableViewCellBackgroundColor   XFNColor(251,251,251)
#define XFNGrayColor                      XFNColor(50,50,50)
#define XFNRedColor                      XFNColor(255,0,0)
#define XFNLightGrayColor                 XFNColor(120,120,120)
//控件间距
#define XFNTableViewCellControlSpacing 10

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
