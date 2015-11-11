//
//  XFNWorkTableViewController.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkTableViewController_h
#define XFNWorkTableViewController_h

#import <UIKit/UIKit.h>
#import "XFNFrameTableViewController.h"

typedef enum{
    XFNGetTypeDefault = 0,
    XFNGetTypeAsset   = 1,
    XFNGetTypeAccount = 2,
    XFNGetTypeOther = 3
}XFNCellModelDataGetType;

@interface XFNWorkTableViewController : XFNFrameTableViewController

@property XFNCellModelDataGetType cellModelDataType;

//- (void) reloadModelData; 

@end

#endif /* XFNWorkTableViewController_h */
