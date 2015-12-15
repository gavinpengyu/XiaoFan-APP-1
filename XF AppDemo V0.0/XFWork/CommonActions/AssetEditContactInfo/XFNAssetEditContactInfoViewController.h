//
//  XFNAssetEditContactInfoViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNAssetEditContactInfoViewController_h
#define XFNAssetEditContactInfoViewController_h

#import "XFNAssetEditViewController.h"

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditContactInfoViewController : XFNAssetEditViewController <XFNEditViewToControllerDelegate>


@end


//-----------------------------------------------------------------------------------
@interface XFNAssetContactTableViewController : XFNFrameTableViewController< UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) id <XFNEditViewToControllerDelegate> delegate;

@end

#endif /* XFNAssetEditContactInfoViewController_h */
