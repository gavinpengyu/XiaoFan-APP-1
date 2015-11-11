//
//  XFNFrameTableViewController.h
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/14.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNFrameTableViewController_h
#define XFNFrameTableViewController_h

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
               XFNFrameTableViewControllerRefeshModeNone                    = 0,
               XFNFrameTableViewControllerRefeshModeHeaderRefresh           = (1 << 0),
               XFNFrameTableViewControllerRefeshModeFooterRefresh           = (1 << 1)
} XFNFrameTableViewControllerRefeshMode;

@interface XFNFrameTableViewController : UITableViewController

@property (nonatomic, assign) NSInteger sectionsNumber;
@property (nonatomic, strong) NSArray   *dataArray;
@property (nonatomic, copy)   Class     cellClass;
@property (nonatomic, copy)   Class     cellModelClass;
@property (nonatomic, assign) XFNFrameTableViewControllerRefeshMode refreshMode;

- (void)pullDownRefreshOperation; //Subclass should override this method if refresh is needed

@end

#endif /* XFNFrameTableViewController_h */
