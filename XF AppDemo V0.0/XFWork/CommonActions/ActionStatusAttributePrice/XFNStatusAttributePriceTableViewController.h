//
//  XFNXFNStatusAttributePriceTableViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/11/9.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNStatusAttributePriceTableViewController_h
#define XFNStatusAttributePriceTableViewController_h

#import "XFNFrameTableViewController.h"
#import "XFNFrameTableViewControllerCell.h"
#import "XFNFrameCommonItemDetailModel.h"

@protocol XFNStatusAttributePriceDelegate

- (void) toModify : (NSString*) contant with : (NSString*) value;

@end

//-----------------------------------------------------------------------------------------
@interface XFNStatusAttributePriceTableViewController : XFNFrameTableViewController < UITableViewDataSource, UITableViewDelegate, XFNStatusAttributePriceDelegate, UIPickerViewDelegate, UIPickerViewDataSource >
{
    @private
    UITableView      *_tableView;
    NSMutableArray   *_tableViewModel;
    
    UIPickerView     *_statusPicker;
    NSMutableArray   *_pickViewList;
    
    UIButton         *_statusSelectButton;
}

@end


#endif /* XFNStatusAttributePriceTableViewController_h */
