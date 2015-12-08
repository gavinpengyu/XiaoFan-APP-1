//
//  XFNAssetEditViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/7.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNAssetEditViewController_h
#define XFNAssetEditViewController_h

#import "XFNWorkDetailTableViewController.h"

//po 20151207，addTarget的时候，selector无法传递参数。因此将该类封装，将参数作为该类的property写入，在selector里面通过id sender读取
//-----------------------------------------------------------------------------------------
@interface XFNTextField: UITextField

@property (nonatomic, copy) NSString* assetPropertyName; //这一个TextField的内容对应的AVObject中的Key值

- (void)setAssetPropertyName:(NSString *)assetPropertyName;

@end

//-----------------------------------------------------------------------------------------
@interface XFNButton: UIButton

@property (nonatomic, assign) XFNDetailViewCellIndexEnum cellIndex;
@property (nonatomic, copy)   UILabel*                   customizedLabel;
@property (nonatomic, copy)   NSString*                  assetPropertyName; //这一个TextField的内容对应的AVObject中的Key值

- (void)setAssetPropertyName:(NSString *)assetPropertyName;

- (void)setCustomizedLabel:(UILabel *)customizedLabel;

@end

//-----------------------------------------------------------------------------------------
@protocol  XFNEditViewToControllerDelegate

- (void)toBackAndSubmitObject : (XFNFrameAssetModel*) object withCellIndex: (XFNDetailViewCellIndexEnum) cellIndex;

- (void)toActivatePickViewWithXFNButton: (XFNButton*) button;

@end

//-----------------------------------------------------------------------------------------
@interface XFNAssetEditViewController : UIViewController <XFNSendAssetModelToDetailViewDelegate, XFNEditViewToControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource >
{
    XFNFrameAssetModel *_detailModel;
}
//po 20151207 从编辑界面返回detail view时，直接将编辑后的数据通过传回，不从服务器刷新
@property (nonatomic,strong) id <XFNSendAssetModelToDetailViewDelegate> delegate;

@end





#endif /* XFNAssetEditViewController_h */
