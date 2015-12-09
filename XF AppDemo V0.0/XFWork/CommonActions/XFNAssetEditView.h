//
//  XFNAssetEditView.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNAssetEditView_h
#define XFNAssetEditView_h

#import <UIKit/UIKit.h>
#import "XFNFrameAssetModel.h"
#import "XFNAssetEditViewController.h"

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditView : UIView
{
    NSMutableDictionary* _assetPropertyAndTagDict;
}
@property (nonatomic, copy) XFNFrameAssetModel *cellModel;
@property (nonatomic,strong) id <XFNEditViewToControllerDelegate> delegate;

- (void)setCellModel:(XFNFrameAssetModel *)cellModel;

- (void)layoutViews;

- (void)setModel: (XFNFrameAssetModel*) model;

- (CGRect)initTitleWithName: (NSString*) titleName andOriginY: (CGFloat) originY;

- (CGRect)initContentTextFieldWithName: (NSString*) name andValue: (NSString*) value andOriginY: (CGFloat) originY andKeyboardType: (UIKeyboardType) keyboardType;

- (CGRect)initContentPickerButtonWithName: (NSString*) name
                                 andValue: (NSString*) value
                               andOriginY: (CGFloat) originY;

- (CGRect)initLabelViewWithArray: (NSArray*) array andOriginY: (CGFloat) originY;

- (void)initFooterWithOriginY: (CGFloat) originY andCellIndex: (XFNDetailViewCellIndexEnum)cellIndex;

- (NSString*) getContentNameFromAssetPropertyName: (NSString*) propertyName;

#pragma mark selector
//-----------------------------------------------------------------------------------
-(void) valueChanged:(id)sender;

@end

#endif /* XFNAssetEditView_h */
