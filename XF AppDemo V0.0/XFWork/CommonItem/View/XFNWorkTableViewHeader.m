//
//  XFNWorkTableViewHeader.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/1.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"

#import "XFNWorkTableViewHeader.h"
#import "XFNWorkTableViewController.h"

//-----------------------------------------------------------------------------------------
@implementation XFNWorkTableViewHeader

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor lightGrayColor];
        [self layoutSubviews];
    }
    return self;
}

- (void)initSubviews
{
    _headLabelA               = [[UILabel alloc] init];
    _headLabelA.textColor     = [UIColor blackColor];
    _headLabelA.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _headLabelA];

    _headLabelB               = [[UILabel alloc] init];
    _headLabelB.textColor     = [UIColor blackColor];
    _headLabelB.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _headLabelB];
    
    _headLabelC               = [[UILabel alloc] init];
    _headLabelC.textColor     = [UIColor blackColor];
    _headLabelC.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _headLabelC];
    
    _headLabelD               = [[UILabel alloc] init];
    _headLabelD.textColor     = [UIColor blackColor];
    _headLabelD.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _headLabelD];
    
    _configHeadLabel               = [[UILabel alloc] init];
    _configHeadLabel.text          = @"更多";
    _configHeadLabel.textColor     = [UIColor blackColor];
    _configHeadLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _configHeadLabel];
}

- (void)initLabel: (NSString*) label withName: (NSString*) name
{
    if ([label isEqualToString: @"headLabelA"])
    {
        _headLabelA.text = name;
        return;
    }
    else if([label isEqualToString: @"headLabelB"])
    {
        _headLabelB.text = name;
        return;
    }
    else if([label isEqualToString: @"headLabelC"])
    {
        _headLabelC.text = name;
        return;
    }
    else if([label isEqualToString: @"headLabelD"])
    {
        _headLabelD.text = name;
        return;
    }
    else
    {
        DLog(@"ERROR: 错误的输入参数label＝%@", label);
        return;
    }
}

- (void)initLabelModel
{
    [self initLabel: @"headLabelA" withName: @"全部"];
    [self initLabel: @"headLabelB" withName: @"关注"];
    [self initLabel: @"headLabelC" withName: @"出租"];
    [self initLabel: @"headLabelD" withName: @"出售"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self initSubviews];
    
    [self initLabelModel];
    
    //Header 布局---------------------------------------------------------------------------------

    //headLabelA－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    CGFloat headLabelAX     = XFNTableViewCellControlSpacing, headLabelAY = XFNTableViewCellControlSpacing;
    CGSize  headLabelASize  = [_headLabelA.text sizeWithAttributes : @{NSFontAttributeName : _headLabelA.font}];
    CGRect  headLabelARect  = CGRectMake(headLabelAX,
                                         headLabelAY,
                                         headLabelASize.width,
                                         headLabelASize.height);
    _headLabelA.frame   = headLabelARect;
    
    UIButton* headLabelAButton     = [UIButton buttonWithType: UIButtonTypeCustom];
    headLabelAButton.frame         = _headLabelA.frame;
    
    [headLabelAButton addTarget : self action : @selector (headATouched:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : headLabelAButton];
    
    //headLabelB－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    CGFloat headLabelBY     = headLabelAY;
    CGFloat headLabelBX     = headLabelAX + headLabelASize.width + XFNTableViewCellControlSpacing * 4;
    CGSize  headLabelBSize  = [_headLabelB.text sizeWithAttributes : @{NSFontAttributeName : _headLabelB.font}];
    CGRect  headLabelBRect  = CGRectMake(headLabelBX,
                                         headLabelBY,
                                         headLabelBSize.width,
                                         headLabelBSize.height);
    _headLabelB.frame   = headLabelBRect;
    
    UIButton* headLabelBButton     = [UIButton buttonWithType: UIButtonTypeCustom];
    headLabelBButton.frame         = _headLabelB.frame;
    
    [headLabelBButton addTarget : self action : @selector (headBTouched:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : headLabelBButton];
    
    //headLabelC－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    CGFloat headLabelCY     = headLabelAY;
    CGFloat headLabelCX     = headLabelBX + headLabelBSize.width + XFNTableViewCellControlSpacing * 4;
    CGSize  headLabelCSize  = [_headLabelC.text sizeWithAttributes : @{NSFontAttributeName : _headLabelC.font}];
    CGRect  headLabelCRect  = CGRectMake(headLabelCX,
                                         headLabelCY,
                                         headLabelCSize.width,
                                         headLabelCSize.height);
    _headLabelC.frame   = headLabelCRect;
    
    UIButton* headLabelCButton     = [UIButton buttonWithType: UIButtonTypeCustom];
    headLabelCButton.frame         = _headLabelC.frame;
    
    [headLabelCButton addTarget : self action : @selector (headCTouched:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : headLabelCButton];
    
    //headLabelD－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    CGFloat headLabelDY     = headLabelAY;
    CGFloat headLabelDX     = headLabelCX + headLabelCSize.width + XFNTableViewCellControlSpacing * 4;
    CGSize  headLabelDSize  = [_headLabelB.text sizeWithAttributes : @{NSFontAttributeName : _headLabelB.font}];
    CGRect  headLabelDRect  = CGRectMake(headLabelDX,
                                         headLabelDY,
                                         headLabelDSize.width,
                                         headLabelDSize.height);
    _headLabelD.frame   = headLabelDRect;
    
    UIButton* headLabelDButton     = [UIButton buttonWithType: UIButtonTypeCustom];
    headLabelDButton.frame         = _headLabelD.frame;
    
    [headLabelDButton addTarget : self action : @selector (headDTouched:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : headLabelDButton];
    
    //configHeadLabel－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    
    CGRect mainScreenRect       = [[UIScreen mainScreen] bounds];
    CGSize mainScreenSize       = mainScreenRect.size;
    
    CGFloat configHeadLabelY      = headLabelAY;
    CGSize  configHeadLabelDSize  = [_configHeadLabel.text sizeWithAttributes : @{NSFontAttributeName : _configHeadLabel.font}];
    
    CGFloat configHeadLabelX      = mainScreenSize.width - XFNTableViewCellControlSpacing - configHeadLabelDSize.width; //屏幕最右侧
    
    CGRect  configHeadLabelDRect  = CGRectMake(configHeadLabelX,
                                               configHeadLabelY,
                                               configHeadLabelDSize.width,
                                               configHeadLabelDSize.height);
    _configHeadLabel.frame    = configHeadLabelDRect;
    
    UIButton* configHeadButton     = [UIButton buttonWithType: UIButtonTypeCustom];
    configHeadButton.frame         = _configHeadLabel.frame;
    
    [configHeadButton addTarget : self action : @selector (toConfigHead:) forControlEvents : UIControlEventTouchDown];
    [self addSubview : configHeadButton];
}

//-----------------------------------------------------------------------------------------
- (void) toConfigHead: (id)sender
{
    [self.delegate toConfigHead];
}

- (void) headATouched: (id)sender
{
    _headLabelA.textColor = [UIColor whiteColor];
    [self performSelector: @selector(toResumeNormalColor:) withObject: _headLabelA afterDelay: 0.5f];
    [self.delegate toShowAllItems];
}

- (void) headBTouched: (id)sender
{
    _headLabelB.textColor = [UIColor whiteColor];
    [self performSelector: @selector(toResumeNormalColor:) withObject: _headLabelB afterDelay: 0.5f];
    [self.delegate toShowFollowedItems];
}

- (void) headCTouched: (id)sender
{
    _headLabelC.textColor = [UIColor whiteColor];
    [self performSelector: @selector(toResumeNormalColor:) withObject: _headLabelC afterDelay: 0.5f];
    [self.delegate toShowOnRentingItems];
}

- (void) headDTouched: (id)sender
{
    _headLabelD.textColor = [UIColor whiteColor];
    [self performSelector: @selector(toResumeNormalColor:) withObject: _headLabelD afterDelay: 0.5f];
    [self.delegate toShowOnSaleItems];
}

- (void) toResumeNormalColor:(UILabel *)label
{
    label.textColor = [UIColor grayColor];
    DLog(@"toResumeNormalColor");
}

@end














































