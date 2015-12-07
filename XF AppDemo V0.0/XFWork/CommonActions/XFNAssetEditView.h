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

//po 20151207，addTarget的时候，selector无法传递参数。因此将该类封装，将参数作为该类的property写入，在selector里面通过id sender读取
//-----------------------------------------------------------------------------------------
@interface XFNTextField: UITextField

@property (nonatomic, copy) NSString* assetPropertyName;

@end

@interface XFNButton: UIButton

@property (nonatomic, assign) XFNDetailViewCellIndexEnum cellIndex;
@property (nonatomic, copy)   UILabel*                   customizedLabel;

- (void)setCustomizedLabel:(UILabel *)customizedLabel;

@end

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditView : UIView
{
    NSMutableDictionary* _assetPropertyAndTagDict;
}
@property (nonatomic, copy) XFNFrameAssetModel *cellModel;
@property (nonatomic,strong) id <XFNEditViewToControllerDelegate> delegate;

- (void)layoutView;

- (void)setModel: (XFNFrameAssetModel*) model;

- (CGRect)initTitleWithName: (NSString*) titleName andOriginY: (CGFloat) originY;

- (CGRect)initContentWithName: (NSString*) name andValue: (NSString*) value andOriginY: (CGFloat) originY andKeyboardType: (UIKeyboardType) keyboardType;

- (CGRect)initLabelViewWithArray: (NSArray*) array andOriginY: (CGFloat) originY;

- (void)initFooterWithOriginY: (CGFloat) originY andCellIndex: (XFNDetailViewCellIndexEnum)cellIndex;

@end

#endif /* XFNAssetEditView_h */
