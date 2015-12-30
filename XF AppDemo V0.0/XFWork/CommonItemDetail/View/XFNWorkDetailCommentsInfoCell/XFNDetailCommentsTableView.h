//
//  XFNDetailCommentsTableView.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/4.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNDetailCommentsTableView_h
#define XFNDetailCommentsTableView_h

#import "XFNFrameTableViewController.h"
#import "XFNFrameTableViewControllerCell.h"

#import "XFNWorkDetailTableViewCellModel.h"

//Protocol CommentsInfoCell - > CommentsTableViewController  XFNComments
//-----------------------------------------------------------------------------------------
@protocol XFNSendCommentsDelegate

- (void)toSendCommentswithArray : (NSArray*) array;
- (CGRect)getTabelViewCGRect;

@end

//Controller
//-----------------------------------------------------------------------------------------
@interface XFNDetailCommentsTableViewController : XFNFrameTableViewController< UITableViewDataSource, UITableViewDelegate, XFNSendCommentsDelegate >
//{
//    NSArray* _commentsArray;
//}
@end

//View
//-----------------------------------------------------------------------------------------
@interface XFNDetailCommentsTableViewControllerCell : XFNFrameTableViewControllerCell
{
    UILabel     *_senderNameLabel;
    UILabel     *_sendTimeLabel;
    UILabel     *_commentTypeLabel;
    UILabel     *_commentContantLabel;
    UIImageView *_avatarImage;
}

- (void)setModel:(NSObject *)model;

@end

//Model
//-----------------------------------------------------------------------------------------
@interface XFNDetailCommentsTableViewControllerCellModel : XFNComments

@end

#endif /* XFNDetailCommentsTableView_h */
