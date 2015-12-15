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

#define _Macro_AssetLabel_Height 30
#define _Macro_AssetLabel_Width  60
#define _Macro_AssetLabel_Space  14

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditView : UIView <UITextFieldDelegate>
{
    NSString* _assetCustomizedComments;//po 20151215 在跟进页面，对textField的修改不直接更新到_cellModel, 而是先保存在这个字符串中。在响应“提交”按钮的时候再插入到syslog数组里面。这是为了有更好的交互体验，例如：在提交前多次修改跟进内容；
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

- (void) addUniqueObjectToArray: (NSMutableArray*) targetArray byArray: (NSArray*) souceArray;

- (NSString*) getContentNameFromAssetPropertyName: (NSString*) propertyName;



#pragma mark selector
//-----------------------------------------------------------------------------------
-(void)labelChanged:(id)sender;

-(void)valueChanged:(id)sender;

@end

#endif /* XFNAssetEditView_h */
