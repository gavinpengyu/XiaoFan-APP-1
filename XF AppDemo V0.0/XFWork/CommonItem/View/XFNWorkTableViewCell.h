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

    UILabel  *_assetLabelA;
    UILabel  *_assetLabelB;
    UILabel  *_assetLabelC;
    UILabel  *_assetLabelD;
    UILabel  *_assetLabelE;
    UILabel  *_assetLabelF; //reserved
    
    UILabel  *_commentsLabel;
    UILabel  *_isFollowedLabel;
    UILabel  *_moreActionLabel;
}

@end

#endif /* XFNWorkTableViewCell_h */
