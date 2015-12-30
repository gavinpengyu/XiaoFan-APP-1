//
//  XFNWorkTableViewCell.h
//  XFN AppDemo V0.0XFNFrameTableViewControllerCell
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNWorkTableViewCell_h
#define XFNWorkTableViewCell_h

#import "XFNFrameTableViewControllerCell.h"

@protocol XFNCellToControllerDelegate;

@interface XFNWorkTableViewCell : XFNFrameTableViewControllerCell
{
    NSArray*  _labelsArray;
    
    Boolean   _bIsOnTop;
    Boolean   _bIsFollowed;
    
    UILabel  *_isOnTopLabel;

    UILabel  *_ownernameLabel;
    UILabel  *_sendtimeLabel;
    UIImageView *_ownerheadImage;
    
    UILabel  *_nameLabel;
    UILabel  *_detailLabel;
    UILabel  *_priceLabel;
    UILabel  *_statusLabel;
    
    UILabel  *_commentsLabel;
    UILabel  *_isFollowedLabel;
    UILabel  *_moreActionLabel;
}

+ (UIColor *)getTheColorOfLabel: (NSString*) label;

+ (NSString *)getThePropertyNameOfLabel: (NSString*) label;

@property (nonatomic,strong) id <XFNCellToControllerDelegate> delegate;

@end

#endif /* XFNWorkTableViewCell_h */
