//
//  XFWorkTableViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFWorkTableViewController_h
#define XFWorkTableViewController_h

#import <UIKit/UIKit.h>
#import "XFFrameTableViewController.h"

typedef enum{
    XFGetTypeDefault = 0,
    XFGetTypeAsset   = 1,
    XFGetTypeAccount = 2,
    XFGetTypeOther = 3
}XFCellModelDataGetType;

@interface XFWorkTableViewController : XFFrameTableViewController

@property XFCellModelDataGetType cellModelDataType;

//- (void) reloadModelData;

@end

#endif /* XFWorkTableViewController_h */
