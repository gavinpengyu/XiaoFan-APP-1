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

#define _Macro_CONTACT_NAME_string     (@"_contactName_")
#define _Macro_CONTACT_IDENTITY_string (@"_contactIdentity_")
#define _Macro_CONTACT_PHONE_string    (@"_contactPhone_")
#define _Macro_CUSTOMIZED_LABEL_string (@"_customizedLabel_")
#define _Macro_ASSET_UNIT_PRICE_string (@"assetUnitPrice")

//-----------------------------------------------------------------------------------------
//@interface XFNAssetEditView : UIView <UITextFieldDelegate>
//{
//    NSMutableDictionary* _assetPropertyAndTagDict;
//}
//@property (nonatomic, copy) XFNFrameAssetModel *cellModel;
//@property (nonatomic,strong) id <XFNEditViewToControllerDelegate> delegate;

@interface XFNAssetEditView : UIView <UITextFieldDelegate>
{
    NSMutableDictionary* _assetPropertyAndTagDict;
}
@property (nonatomic, copy) XFNFrameAssetModel *cellModel;
@property (nonatomic,strong) id <XFNEditViewToControllerDelegate> editDelegate;

- (void)setCellModel:(XFNFrameAssetModel *)cellModel;

- (void)layoutViews;

- (void)setModel: (XFNFrameAssetModel*) model;

- (CGRect)initTitleWithName: (NSString*) titleName andOriginY: (CGFloat) originY;

- (CGRect)initContentTextFieldWithName: (NSString*) name
                              andValue: (NSString*) value
                            andOriginY: (CGFloat) originY
                       andKeyboardType: (UIKeyboardType) keyboardType;

- (CGRect)initContentPickerButtonWithName: (NSString*) name
                                 andValue: (NSString*) value
                               andOriginY: (CGFloat) originY;

- (CGRect)initCustomizeTextFieldWithName: (NSString*) name
                              andOriginY: (CGFloat) originY;

- (CGRect)initLabelViewWithArray: (NSArray*) array
                      andOriginY: (CGFloat) originY
                 andPropertyName: (NSString*) name;

- (void)initFooterWithOriginY: (CGFloat) originY andCellIndex: (XFNDetailViewCellIndexEnum)cellIndex;

- (NSString*) getContentNameFromAssetPropertyName: (NSString*) propertyName;

#pragma mark selector
//-----------------------------------------------------------------------------------
-(void) valueChanged:(id)sender;

@end

#endif /* XFNAssetEditView_h */
