//
//  XFNLoginViewController.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/23.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import "XFNFrame.h"
#import "XFNFrameTabBarController.h"
#import "XFNLoginViewController.h"

#define _Macro_TEXTWidth_  (160)
#define _Macro_TEXTHeight_ (20)

//-----------------------------------------------------------------------------------------
@implementation XFNLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XFNLoginView * view = [[XFNLoginView alloc] initWithFrame: CGRectMake(0, 0, _Macro_ScreenWidth, _Macro_ScreenHeight)];
    
    view.delegate = self; 
    
    [view layoutViews];
    
    self.view = view;
}

- (void) toLoginWithUser: (NSString*) name andPassWord: (NSString*) password
{
    if ((nil == name) || (0 == name.length))
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"错误"
                                                                                 message: @"用户名为空"
                                                                          preferredStyle: UIAlertControllerStyleAlert];
        NSString *cancelButtonTitle = NSLocalizedString(@"返回", nil);
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            //NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController: alertController animated:YES completion:nil];
        
        return;
    }
    if ((nil == password) || (0 == password.length))
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"错误"
                                                                                 message: @"密码为空"
                                                                          preferredStyle: UIAlertControllerStyleAlert];
        NSString *cancelButtonTitle = NSLocalizedString(@"返回", nil);
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            //NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
        }];
        
        [alertController addAction:cancelAction];
        
        [self presentViewController: alertController animated:YES completion:nil];
        
        return;
    }
    
    [AVUser logInWithUsernameInBackground: name
                                 password: password
                                    block: ^(AVUser *user , NSError *error)
                                            {
                                                if (user != nil)
                                                {
                                                    XFNFrameTabBarController *vc = [[XFNFrameTabBarController alloc] init];
                                                    // 切换控制器
                                                    UIWindow *window = [UIApplication sharedApplication].keyWindow;
                                                    window.rootViewController = vc;
                                                    DLog(@"登陆成功");
                                                }
                                                else
                                                {
                                                    NSString *errMsg = [error userInfo][@"error"];
                                                    
                                                    DLog(@"%@", errMsg);

                                                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle: @"登陆失败"
                                                                                                                             message: @"用户名或密码错误"
                                                                                                                      preferredStyle: UIAlertControllerStyleAlert];
                                                    NSString *cancelButtonTitle = NSLocalizedString(@"返回", nil);
                                                    
                                                    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                                                        //NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
                                                    }];
                                                    
                                                    [alertController addAction:cancelAction];
                                                    
                                                    [self presentViewController: alertController animated:YES completion:nil];
                                                    
                                                }}];
    
    return;
}

@end


//-----------------------------------------------------------------------------------------
@implementation XFNLoginView
{
    UITextField*     _accountText;
    UITextField*     _passwordText;
    
    UILabel*         _loginLabel;
    UILabel*         _signUpLabel;
    
    UIButton*        _loginButton;
    UIButton*        _signUpButton;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void)initSubViews
{
    _accountText               = [[UITextField alloc] init];
    _accountText.textColor     = [UIColor blackColor];
    _accountText.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    _accountText.textAlignment = NSTextAlignmentLeft;
    _accountText.placeholder   = @"用户名";
    _accountText.keyboardType  = UIKeyboardTypeDefault;
    //_accountText.layer.borderWidth = 1;

    
    [self addSubview: _accountText];
    
    _passwordText               = [[UITextField alloc] init];
    _passwordText.textColor     = [UIColor blackColor];
    _passwordText.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    _passwordText.textAlignment = NSTextAlignmentLeft;
    _passwordText.placeholder   = @"密码";
    _passwordText.keyboardType  = UIKeyboardTypeDefault;
    
    _passwordText.secureTextEntry   = YES;
    //_passwordText.layer.borderWidth = 1;

    
    [self addSubview: _passwordText];
    
    _loginLabel                 = [[UILabel alloc] init];
    _loginLabel.textColor       = [UIColor blackColor];
    _loginLabel.font            = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    _loginLabel.textAlignment   = NSTextAlignmentCenter;
    _loginLabel.text            = @"登陆";
    _loginLabel.layer.borderWidth = 1;
    
    [self addSubview: _loginLabel];
    
    _signUpLabel                = [[UILabel alloc] init];
    _signUpLabel.textColor      = [UIColor blackColor];
    _signUpLabel.font           = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    _signUpLabel.textAlignment  = NSTextAlignmentCenter;
    _signUpLabel.text           = @"注册";
    _signUpLabel.layer.borderWidth = 1;
    
    [self addSubview: _signUpLabel];
    
    _loginButton  = [[UIButton alloc] init];
    
    [self addSubview: _loginButton];
    
    _signUpButton = [[UIButton alloc] init];
    
    [self addSubview: _signUpButton];
}

- (void)layoutViews
{
    [self initSubViews];
    
    CGSize _accountTextSize;
    
    _accountTextSize.width = _Macro_TEXTWidth_;
    _accountTextSize.height= _Macro_TEXTHeight_;
    
    CGFloat _accountTextX  =  (_Macro_ScreenWidth - _Macro_TEXTWidth_) / 2;
    CGFloat _accountTextY  =  _Macro_TEXTHeight_ * 10;
    
    _accountText.frame     = CGRectMake( _accountTextX, _accountTextY, _accountTextSize.width, _accountTextSize.height);
    
    CGSize _passwordTextSize;
    
    _passwordTextSize.width = _Macro_TEXTWidth_;
    _passwordTextSize.height= _Macro_TEXTHeight_;
    
    CGFloat _passwordTextX  =  _accountTextX;
    CGFloat _passwordTextY  =  _accountTextY + _accountTextSize.height + XFNTableViewCellControlSpacing * 3;
    
    _passwordText.frame     = CGRectMake( _passwordTextX, _passwordTextY, _passwordTextSize.width, _passwordTextSize.height);
    
    CGSize _loginLabelSize;
    
    _loginLabelSize.width = (_Macro_TEXTWidth_ - XFNTableViewCellControlSpacing * 2) / 2;
    _loginLabelSize.height= _Macro_TEXTHeight_;
    
    CGFloat _loginLabelX  =  _passwordTextX;
    CGFloat _loginLabelY  =  _passwordTextY + _passwordTextSize.height + XFNTableViewCellControlSpacing * 3;
    
    _loginLabel.frame     = CGRectMake( _loginLabelX, _loginLabelY, _loginLabelSize.width, _loginLabelSize.height);
    _loginButton.frame    = _loginLabel.frame;
    
    [_loginButton addTarget : self action : @selector (loginButtonPressed:) forControlEvents : UIControlEventTouchDown];
    
    CGSize _signUpLabelSize;
    
    _signUpLabelSize.width = (_Macro_TEXTWidth_ - XFNTableViewCellControlSpacing * 2) / 2;
    _signUpLabelSize.height= _Macro_TEXTHeight_;
    
    CGFloat _signUpLabelX  =  _loginLabelX +  _loginLabelSize.width + XFNTableViewCellControlSpacing * 2;
    CGFloat _signUpLabelY  =  _loginLabelY;
    
    _signUpLabel.frame     = CGRectMake( _signUpLabelX, _signUpLabelY, _signUpLabelSize.width, _signUpLabelSize.height);
    _signUpButton.frame    = _signUpLabel.frame;
    
    [_signUpButton addTarget : self action : @selector (signUpButtonPressed:) forControlEvents : UIControlEventTouchDown];
}

- (void) loginButtonPressed: (id) sender
{
    [self.delegate toLoginWithUser: _accountText.text andPassWord: _passwordText.text];
}

- (void) signUpButtonPressed: (id) sender
{
    DLog(@"signUpButton pressed");
}

@end