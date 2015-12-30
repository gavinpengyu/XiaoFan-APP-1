//
//  XFNWorkDetailCommentsInfoCell.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/3.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkDetailCommentsInfoCell_h
#define XFNWorkDetailCommentsInfoCell_h

#import "XFNWorkDetailTableViewCell.h"
#import "XFNDetailCommentsTableView.h"

//Protocol CommentsInfoCell - > CommentsTableViewController  XFNComments
//-----------------------------------------------------------------------------------------
@protocol XFNSendCommentsDelegate;

//-----------------------------------------------------------------------------------------
@interface XFNWorkDetailCommentsInfoCell : XFNWorkDetailTableViewCell
{
    NSArray * _commentsArray;
}

@property (nonatomic, strong) id <XFNSendCommentsDelegate>          delegate;
@property (nonatomic, strong) XFNDetailCommentsTableViewController *commentsTableVC;

- (void)setModel:(NSObject *)model;


@end

#endif /* XFNWorkDetailCommentsInfoCell_h */
