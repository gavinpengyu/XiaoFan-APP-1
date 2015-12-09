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
/*
 重要！po 20151209:
 在action中selector无法传递参数，而uiview中没有合适的reload方式可以刷新页面。
 因此我使用这个id属性保存view中需要修改的元素，label或者textfield。在selector方法中，移除该元素，并重绘
 */
@property (nonatomic, copy)   id                         parameter;

- (void)setAssetPropertyName:(NSString *)assetPropertyName;

- (void)setParameter:(id)parameter;

@end

//-----------------------------------------------------------------------------------------
@interface XFNButton: UIButton

@property (nonatomic, assign) XFNDetailViewCellIndexEnum cellIndex;
@property (nonatomic, copy)   UILabel*                   customizedLabel;
@property (nonatomic, copy)   NSString*                  assetPropertyName; //这一个UIButton的内容对应的AVObject中的Key值

/*
 重要！po 20151209:
 在action中selector无法传递参数，而uiview中没有合适的reload方式可以刷新页面。
 因此我使用这个id属性保存view中需要修改的元素，label或者textfield。在selector方法中，移除该元素，并重绘
 */
@property (nonatomic, copy)   id                         parameter;

- (void)setAssetPropertyName:(NSString *)assetPropertyName;

- (void)setCustomizedLabel:(UILabel *)customizedLabel;

- (void)setParameter:(id)parameter;

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
