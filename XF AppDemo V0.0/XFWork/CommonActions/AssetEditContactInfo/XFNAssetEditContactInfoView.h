//
//  XFNAssetEditContactInfoView.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNAssetEditContactInfoView_h
#define XFNAssetEditContactInfoView_h

#import <UIKit/UIKit.h>
#import "XFNFrameTableViewControllerCell.h"
#import "XFNFrameAssetModel.h"
#import "XFNAssetEditView.h"

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditContactInfoView : XFNAssetEditView//UIScrollView//XFNAssetEditView

@end

//-----------------------------------------------------------------------------------
@interface XFNAssetContactTableViewCell : XFNFrameTableViewControllerCell
{
    NSString        *_contactName;
    NSString        *_contactIdentity;
    NSMutableArray  *_phoneNumber;
    NSMutableArray  *_contactLabel;
}
@property (nonatomic,strong) id <XFNEditViewToControllerDelegate> delegate;

- (void)setModel:(NSObject *)model;

@end

#endif /* XFNAssetEditContactInfoView_h */
