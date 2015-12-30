//
//  XFNDetailCommentsTableView.m
//  XF AppDemo V0.0
//
//  Created by po on 15/12/4.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XFNFrame.h"
#import "XFNDetailCommentsTableView.h"
#import "XFNWorkTableViewCell.h" //需要使用类方法获取标签颜色
#import "XFNWorkDetailTableViewCell.h"


#pragma mark Controller
//-----------------------------------------------------------------------------------------
@implementation XFNDetailCommentsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.cellClass = [XFNFrameTableViewControllerCell class];
    
    //self.tableView.rowHeight = 60;
    
}

#pragma mark Protocol
//Protocol CommentsInfoCell - > CommentsTableViewController  XFNComments
//-----------------------------------------------------------------------------------------
- (void)toSendCommentswithArray : (NSArray*) array
{
    self.dataArray = [array copy];
}

- (CGRect)getTabelViewCGRect
{
    return self.view.frame;
}

#pragma mark DataSource
//-----------------------------------------------------------------------------------------

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

//-----------------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XFNComments *tempCellModel = self.dataArray[indexPath.row];
    
    XFNDetailCommentsTableViewControllerCell *cell = [[XFNDetailCommentsTableViewControllerCell alloc] initWithStyle : UITableViewCellStyleDefault reuseIdentifier : nil];
    
    [cell setModel : tempCellModel];
    
    return cell;
}

#pragma mark TableView Delegate
//-----------------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView: tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

@end

#pragma mark View
//-----------------------------------------------------------------------------------------
@implementation XFNDetailCommentsTableViewControllerCell

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
    //头像－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _avatarImage              = [[UIImageView alloc] init];
    [self addSubview : _avatarImage];

    _senderNameLabel          = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                           andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]];
    [self addSubview : _senderNameLabel];
    
    _sendTimeLabel            = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                           andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]];
    [self addSubview : _sendTimeLabel];
    
    _commentTypeLabel         = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                           andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]];
    [self addSubview : _commentTypeLabel];
    
    _commentContantLabel      = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                           andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]];
    [self addSubview : _commentContantLabel];
}

- (void) initViewLayout
{
    CGFloat avatarImageX         = XFNTableViewCellControlSpacing * 2;
    CGFloat avatarImageY         = XFNTableViewCellControlSpacing;
    CGSize  avatarImageSize      = CGSizeMake(XFNCommentItemAvatarDefaultSize, XFNCommentItemAvatarDefaultSize);
    CGRect  avatarImageRect      = CGRectMake(avatarImageX,
                                              avatarImageY,
                                              avatarImageSize.width,
                                              avatarImageSize.height);
    _avatarImage.frame           = avatarImageRect;
    
    CGFloat senderNameLabelX     = avatarImageX + avatarImageSize.width + XFNTableViewCellControlSpacing;
    CGFloat senderNameLabelY     = avatarImageY;
    CGSize  senderNameLabelSize  = [_senderNameLabel.text sizeWithAttributes : @{NSFontAttributeName : _senderNameLabel.font}];
    CGRect  senderNameLabelRect  = CGRectMake(senderNameLabelX,
                                               senderNameLabelY,
                                               senderNameLabelSize.width,
                                               senderNameLabelSize.height);
    _senderNameLabel.frame       = senderNameLabelRect;
    
    CGFloat sendTimeLabelX       = senderNameLabelX + senderNameLabelSize.width + XFNTableViewCellControlSpacing;
    CGFloat sendTimeLabelY       = senderNameLabelY;
    CGSize  sendTimeLabelSize    = [_sendTimeLabel.text sizeWithAttributes : @{NSFontAttributeName : _sendTimeLabel.font}];
    CGRect  sendTimeLabelRect    = CGRectMake(sendTimeLabelX,
                                              sendTimeLabelY,
                                              sendTimeLabelSize.width,
                                              sendTimeLabelSize.height);
    _sendTimeLabel.frame         = sendTimeLabelRect;
    
    //两侧各留2个space，减去头像宽度＋头像与label之间的间隔
    CGFloat tempWidth = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing * 4 - (avatarImageRect.size.width + XFNTableViewCellControlSpacing));
    
    //+ (NSArray*)arrayFromString: (NSString*) string  withFont: (UIFont*) font splitedByLimitedScreenWidth: (CGFloat) width;
    //大于1行时需要拆分
    
    NSArray* commentsArray = [XFNWorkDetailTableViewCell arrayFromString: _commentContantLabel.text
                                                                withFont: _commentContantLabel.font
                                             splitedByLimitedScreenWidth: tempWidth];
    _commentContantLabel.text = [commentsArray firstObject];
    CGFloat commentContantLabelX       = senderNameLabelX;
    CGFloat commentContantLabelY       = senderNameLabelY + senderNameLabelSize.height + XFNTableViewCellControlSpacing;
    CGSize  commentContantLabelSize    = [_commentContantLabel.text sizeWithAttributes : @{NSFontAttributeName : _commentContantLabel.font}];
    CGRect  commentContantLabelRect    = CGRectMake(commentContantLabelX,
                                                    commentContantLabelY,
                                                    (commentContantLabelSize.width + XFNTableViewCellControlSpacing * 2),
                                                    commentContantLabelSize.height);
    _commentContantLabel.frame         = commentContantLabelRect;
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, (_commentContantLabel.frame.origin.y + _commentContantLabel.frame.size.height));
    
    //大于一行时，分别添加
    for (int iIndex = 1; iIndex < commentsArray.count; iIndex++)
    {
        UILabel* tempLabel     = [XFNWorkDetailTableViewCell initLabelWithTextColor: [UIColor blackColor]
                                                                            andFont: [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault-2)]];
        
        tempLabel.text         = commentsArray[iIndex];
        
        CGFloat tempLabelX     = commentContantLabelX;
        CGFloat tempLabelY     = commentContantLabelY + (commentContantLabelSize.height + XFNTableViewCellControlSpacing) * iIndex;
        CGSize  tempLabelSize  = [tempLabel.text sizeWithAttributes : @{NSFontAttributeName : tempLabel.font}];
        CGRect  tempLabelRect  = CGRectMake(tempLabelX,
                                            tempLabelY,
                                            (tempLabelSize.width + XFNTableViewCellControlSpacing * 2),
                                            tempLabelSize.height);
        tempLabel.frame        = tempLabelRect;
        
        
        [self addSubview : tempLabel];
        //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
        self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, (tempLabel.frame.origin.y + tempLabel.frame.size.height));
    }
    
    //分割线-----------------------------------------------------------------------------------
    UIView * gridHorizontalLineTwo = [[UIView alloc] initWithFrame: CGRectMake (XFNTableViewCellControlSpacing * 2,
                                                                                self.frame.origin.y + self.frame.size.height + XFNTableViewCellControlSpacing,
                                                                                _Macro_ScreenWidth - XFNTableViewCellControlSpacing * 4,
                                                                                _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLineTwo.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLineTwo];
    
    //在Init的最后必须给self.frame赋值，否则在delegate中无法自适应cell高度
    self.frame  = CGRectMake(0,0, _Macro_ScreenWidth, (gridHorizontalLineTwo.frame.origin.y + gridHorizontalLineTwo.frame.size.height));
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNComments *cellModel = (XFNComments *)model;
    
    _senderNameLabel.text      = cellModel.name;
    _sendTimeLabel.text        = cellModel.sendtime;
    _commentTypeLabel.text     = cellModel.type;
    _commentContantLabel.text  = cellModel.contant;
    
    _avatarImage.image         = [UIImage imageNamed:@"TestOwnerImage"];
    
    [self initViewLayout];
}

@end

#pragma mark Model
//-----------------------------------------------------------------------------------------
@implementation XFNDetailCommentsTableViewControllerCellModel


@end