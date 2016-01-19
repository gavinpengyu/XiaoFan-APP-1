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

@protocol XFNSendAssetModelToDetailViewDelegate;

//Protocol Cell - > Controller, 这里是receiver
//-----------------------------------------------------------------------------------------
@protocol XFNCellToControllerDelegate

- (void)toPushViewForCommentWithCellIndex: (NSInteger) index;

- (void)toChangeFollowStatusWithCellIndex: (NSInteger) index;

- (void)toChangeOnTopStatusWithCellIndex: (NSInteger) index;

@end

//Protocol Header - > Controller, 这里是receiver
//-----------------------------------------------------------------------------------------
@protocol XFNHeaderToControllerDelegate

- (void) toShowAllItems;

- (void) toShowFollowedItems;

- (void) toShowOnRentingItems;

- (void) toShowOnSaleItems;

- (void) toConfigHead;

@end

//-----------------------------------------------------------------------------------------
@interface XFNWorkTableViewController : XFNFrameTableViewController <XFNCellToControllerDelegate, XFNHeaderToControllerDelegate>
{
    NSMutableArray *_detailedAssetArray;
}

@property (nonatomic,strong) id <XFNSendAssetModelToDetailViewDelegate> delegate;

//-----------------------------------------------------------------------------------------
+ (NSArray *)getlabelsForAssetStatusGlobalArray;
+ (NSArray *)getlabelsForTypeOfPayGlobalArray;
+ (NSArray *)getlabelsForTaxInfoGlobalArray;
+ (NSArray *)getlabelsForAssetLayoutInfoGlobalArray;
+ (NSArray *)getlabelsForDecorationInfoGlobalArray;
+ (NSArray *)getlabelsForAncillaryInfoGlobalArray;
//-----------------------------------------------------------------------------------------
@end

#endif /* XFNWorkTableViewController_h */
