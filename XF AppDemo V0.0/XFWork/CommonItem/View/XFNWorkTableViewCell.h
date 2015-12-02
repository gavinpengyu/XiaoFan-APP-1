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
    Boolean _bIsOnTop;
    Boolean _bIsFollowed;
    
    UILabel  *_isOnTopLabel;
    UILabel  *_isFollowedLabel;
    UILabel  *_moreActionLabel;
    UILabel  *_commentsLabel;
    
    UILabel  *_nameLabel;
    UILabel  *_detailLabel;
    UILabel  *_priceLabel;
    UILabel  *_statusLabel;
    UILabel  *_ownernameLabel;
    UILabel  *_sendtimeLabel;
    UIImageView *_ownerheadImage;
}

//@property (nonatomic, copy) UILabel     *nameLabel;
//@property (nonatomic, copy) UILabel     *detailLabel;
//@property (nonatomic, copy) UILabel     *priceLabel;
//@property (nonatomic, copy) UILabel     *statusLabel;
//@property (nonatomic, copy) UILabel     *ownernameLabel;
//@property (nonatomic, copy) UILabel     *sendtimeLabel;
//@property (nonatomic, copy) UIImageView *ownerheadImage;

//@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
//@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
//@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
//@property (weak, nonatomic) IBOutlet UILabel *ownernameLabel;
//@property (weak, nonatomic) IBOutlet UILabel *sendtimeLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *ownerheadImage;
//po,20151015,需在此处link buttoms

@end

#endif /* XFNWorkTableViewCell_h */
