//
//  XFNWorkTableViewCell.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNWorkTableViewCell.h"
#import "XFNWorkTableViewCellModel.h"
//po,20151015，临时屏蔽，暂不添加Web
//#import "UIImageView+WebCache.h"

@implementation XFNWorkTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        XFNWorkTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"XFNWorkTableViewCell" owner:nil options:nil] lastObject];
        return cell;
    }
    return self;
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNWorkTableViewCellModel *cellModel = (XFNWorkTableViewCellModel *)model;
    self.nameLabel.text = cellModel.nameString;
    self.detailLabel.text = cellModel.detailString;
    self.priceLabel.text = cellModel.priceString;
    self.statusLabel.text = cellModel.statusString;
    self.ownernameLabel.text = cellModel.ownernameString;
    self.sendtimeLabel.text = cellModel.sendtimeString;
    self.ownerheadImage.image = cellModel.ownerImage;
    //po,20151015，临时屏蔽，暂不添加Web
    //[self.iconView setImageWithURL:[NSURL URLWithString:cellModel.iconImageURLString] placeholderImage:nil];
}

@end