//
//  XFFrameTableViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/10/14.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFFrameTableViewController_h
#define XFFrameTableViewController_h

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
               XFFrameTableViewControllerRefeshModeNone                    = 0,
               XFFrameTableViewControllerRefeshModeHeaderRefresh           = (1 << 0),
               XFFrameTableViewControllerRefeshModeFooterRefresh           = (1 << 1)
} XFFrameTableViewControllerRefeshMode;

@interface XFFrameTableViewController : UITableViewController

@property (nonatomic, assign) NSInteger sectionsNumber;
@property (nonatomic, strong) NSArray   *dataArray;
@property (nonatomic, copy)   Class     cellClass;
@property (nonatomic, copy)   Class     cellModelClass;
@property (nonatomic, assign) XFFrameTableViewControllerRefeshMode refreshMode;

- (void)pullDownRefreshOperation; //Subclass should override this method if refresh is needed

@end

#endif /* XFFrameTableViewController_h */
