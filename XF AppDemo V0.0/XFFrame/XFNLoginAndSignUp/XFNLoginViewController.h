//
//  XFNLoginViewController.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/23.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNLoginViewController_h
#define XFNLoginViewController_h

#import <UIKit/UIKit.h>
//-----------------------------------------------------------------------------------------
@protocol XFNLoginDelegate

- (void) toLoginWithUser: (NSString*) name andPassWord: (NSString*) password;

@end

//-----------------------------------------------------------------------------------------
@interface XFNLoginViewController : UIViewController <XFNLoginDelegate>

@end

//-----------------------------------------------------------------------------------------
@interface XFNLoginView : UIView

@property (nonatomic,strong) id <XFNLoginDelegate> delegate;

- (void)layoutViews;

@end

#endif /* XFNLoginViewController_h */
