//
//  XFNMeTableViewCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/27.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "UIView+XFNExtension.h"

#import "XFNMeTableViewController.h"
#import "XFNMeTableViewModel.h"
#import "XFNMeTableViewCell.h"

#import "XFNLoginViewController.h"

//-----------------------------------------------------------------------------------------
@implementation XFNMeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{

    _userName            = [[UILabel alloc] init];
    _userName.textColor  = [UIColor grayColor];
    _userName.font       = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview: _userName];

    _userPhone            = [[UILabel alloc] init];
    _userPhone.textColor  = [UIColor grayColor];
    _userPhone.font       = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview: _userPhone];
}

- (void) setModel:(XFNMeTableViewModel *)model
{
    if (nil == model)
    {
        DLog(@"ERROR: 设置CellModel失败，输入model为空");
        return;
    }
    
    _userName.text = [NSString stringWithFormat: @"用户名：%@", model.username];
    _userPhone.text= [NSString stringWithFormat: @"联系电话：%@", model.mobilePhoneNumber];
}

@end


//-----------------------------------------------------------------------------------------
@implementation XFNMeTableViewCellSection0Row0

- (void) initViewLayout
{
    CGFloat _userNameX     = XFNTableViewCellControlSpacing;
    CGFloat _userNameY     = XFNTableViewCellControlSpacing;
    CGSize  _userNameSize  = [_userName.text sizeWithAttributes : @{NSFontAttributeName : _userName.font}];
    CGRect  _userNameRect  = CGRectMake(_userNameX,
                                        _userNameY,
                                        _userNameSize.width,
                                        _userNameSize.height);
    _userName.frame    = _userNameRect;
    
    CGFloat cellHeight = (_userName.frame.origin.y + _userName.frame.size.height + XFNTableViewCellControlSpacing);
    
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
}

@end


//-----------------------------------------------------------------------------------------
@implementation XFNMeTableViewCellSection0Row1

- (void) initViewLayout
{
    CGFloat _userPhoneX     = XFNTableViewCellControlSpacing;
    CGFloat _userPhoneY     = XFNTableViewCellControlSpacing;
    CGSize  _userPhoneSize  = [_userPhone.text sizeWithAttributes : @{NSFontAttributeName : _userPhone.font}];
    CGRect  _userPhoneRect  = CGRectMake(_userPhoneX,
                                        _userPhoneY,
                                        _userPhoneSize.width,
                                        _userPhoneSize.height);
    _userPhone.frame    = _userPhoneRect;
    
    CGFloat cellHeight = (_userPhone.frame.origin.y + _userPhone.frame.size.height + XFNTableViewCellControlSpacing);

    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
}

@end


//-----------------------------------------------------------------------------------------
@implementation XFNMeTableViewCellSection1Row0

- (void) initViewLayout
{
    UILabel* logOutLabel      = [[UILabel alloc] init];
    logOutLabel.textColor     = [UIColor blackColor];
    logOutLabel.text          = @"退出登录";
    logOutLabel.textAlignment = NSTextAlignmentCenter;
    logOutLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    
    [self addSubview: logOutLabel];
    
    CGFloat logOutLabelX     = XFNTableViewCellControlSpacing;
    CGFloat logOutLabelY     = XFNTableViewCellControlSpacing;
    CGSize  logOutLabelSize  = [logOutLabel.text sizeWithAttributes : @{NSFontAttributeName : logOutLabel.font}];
    logOutLabelSize.width    = (_Macro_ScreenWidth - 2 * XFNTableViewCellControlSpacing);
    CGRect  logOutLabelRect  = CGRectMake(logOutLabelX,
                                        logOutLabelY,
                                        logOutLabelSize.width,
                                        logOutLabelSize.height);
    
    logOutLabel.frame        = logOutLabelRect;
    
    UIButton* logOutButton   = [UIButton buttonWithType: UIButtonTypeCustom];
    logOutButton.frame       = logOutLabel.frame;
    
    [self addSubview : logOutButton];
    [logOutButton addTarget : self action : @selector (toLogOut:) forControlEvents : UIControlEventTouchDown];
    
    
    CGFloat cellHeight = (logOutLabel.frame.origin.y + logOutLabel.frame.size.height + XFNTableViewCellControlSpacing);
    
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, cellHeight);
}

- (void) toLogOut: (id)sender
{
    [AVUser logOut];  //清除缓存用户对象
    DLog(@"已退出登录");
    self.window.rootViewController = [[XFNLoginViewController alloc] init];
}

@end









