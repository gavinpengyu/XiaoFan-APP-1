//
//  XFNAssetEditContactInfoView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/8.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"

#import "XFNAssetEditContactInfoViewController.h"
#import "XFNAssetEditContactInfoView.h"

@implementation XFNAssetEditContactInfoView
{
    XFNAssetContactTableViewController *_contactTableVC;
}
//-----------------------------------------------------------------------------------
- (void)layoutViews
{
    CGRect temp;
    
    temp = [self initTitleWithName: @"联系人信息"
                        andOriginY: _Macro_XFNAssetEditView_TitleHeight];
    
    
    _contactTableVC = [[XFNAssetContactTableViewController alloc] init];
    
    _contactTableVC.dataArray = [self.cellModel objectForKey: @"contactInfo"];
    
    _contactTableVC.view.frame = CGRectMake(temp.origin.x,
                                            temp.origin.y + temp.size.height,
                                            _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 2,
                                            _Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight - (temp.origin.y + temp.size.height));
    
    _contactTableVC.delegate = self.delegate;
    
    temp = _contactTableVC.view.frame;
    DLog(@"x=%f, y=%f, width=%f, height=%f", temp.origin.x, temp.origin.y, temp.size.width, temp.size.height);
    
    [self addSubview: _contactTableVC.view];
    
    [self initFooterWithOriginY: (_Macro_ScreenHeight - _Macro_XFNAssetEditView_FooterHeight) andCellIndex: XFNWorkDetailContactInfoCellIndexEnum];
}

@end


@implementation XFNAssetContactTableViewCell
//-----------------------------------------------------------------------------------
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void) initSubView
{

}

- (void)initViewLayout
{
    //在函数返回前，根据内容的高度重新给view的frame.size.height赋值
    XFNAssetEditView * contactCellView = [[XFNAssetEditView alloc] initWithFrame: CGRectMake(0,0,_Macro_ScreenWidth,0)];
    
    CGRect temp;
    
    temp = [contactCellView initContentTextFieldWithName: @"_contactName_"
                                                andValue: _contactName
                                              andOriginY: 0   //在cell中的布局，都是从0开始，这一点和uiview不一样
                                         andKeyboardType: UIKeyboardTypeDefault];
    
    temp = [contactCellView initContentPickerButtonWithName: @"_contactIdentity_"
                                                   andValue: _contactIdentity
                                                 andOriginY: (temp.origin.y + temp.size.height)];
    
    for (int iIndex=0; iIndex < _phoneNumber.count; iIndex++)
    {
        temp = [contactCellView initContentTextFieldWithName: @"_contactPhone_"
                                                    andValue: _phoneNumber[iIndex]
                                                  andOriginY: (temp.origin.y + temp.size.height)
                                             andKeyboardType: UIKeyboardTypeNumbersAndPunctuation];
    }
    
    temp = [contactCellView initLabelViewWithArray: _contactLabel
                                        andOriginY: (temp.origin.y + temp.size.height)
                                   andPropertyName: _Macro_CUSTOMIZED_LABEL_string];
    
    contactCellView.delegate = self.delegate;
    
    [self addSubview: contactCellView];
    
    //在函数返回前，根据内容的高度重新给view的frame.size.height赋值。同时给self.frame赋值，否则在controller的delegate中无法自动计算高度
    CGFloat cellHeight = (temp.origin.y + temp.size.height);
    
    contactCellView.frame = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
    
    self.frame  = contactCellView.frame;
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    //联系人信息在server中以字符串形式存放，各字段间用_Macro_XFN_String_Seperator隔开
    NSString* contactString = (NSString*) model;
    NSArray*  contactArray  = [NSArray array];
    contactArray            = [contactString componentsSeparatedByString: _Macro_XFN_String_Seperator];
    
    
    if(nil == contactArray)
    {
        DLog(@"ERROR: 无法解析联系人信息，数组为空");
        return;
    }
    //联系人应该至少包含3个字段，即称呼、身份、联系方式
    if(contactArray.count < 3)
    {
        DLog(@"ERROR: 无法解析联系人信息，只有%ld个字段", contactArray.count);
        return;
    }
    
    if (nil == _phoneNumber)
    {
        _phoneNumber = [NSMutableArray array];
    }
    
    if (nil == _contactLabel)
    {
        _contactLabel = [NSMutableArray array];
    }
    
    for (int iIndex=0; iIndex < contactArray.count; iIndex++)
    {
        //第一个元素是联系人称呼
        if (0 == iIndex)
        {
            _contactName = contactArray[iIndex];
        }
        //第二个元素是联系人身份
        else if (1 == iIndex)
        {
            _contactIdentity = contactArray[iIndex];
        }
        //第三个元素是联系人号码
        else if (2 == iIndex)
        {
            [_phoneNumber addObject: contactArray[iIndex]];
        }
        //当有多个电话号码时，可能第4、5、6等均为联系人号码
        else if ([XFNFrameAssetModel isPhoneNumber: contactArray[iIndex]])
        {
            [_phoneNumber addObject: contactArray[iIndex]];
        }
        //不是前三个元素，且不是号码，则认为是联系人标签
        else
        {
            [_contactLabel addObject: contactArray[iIndex]];
        }
    }
    
    [self initViewLayout];
}

@end

