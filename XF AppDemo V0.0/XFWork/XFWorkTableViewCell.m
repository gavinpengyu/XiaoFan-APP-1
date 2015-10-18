//
//  XFWorkTableViewCell.m
//  XF AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFWorkTableViewCell.h"
#import "XFWorkTableViewCellModel.h"
//po,20151015，临时屏蔽，暂不添加Web
//#import "UIImageView+WebCache.h"

@implementation XFWorkTableViewCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    XFWorkTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"XFWorkTableViewCell" owner:nil options:nil] lastObject];
    //cell.iconView.layer.cornerRadius = 4;
    //cell.iconView.clipsToBounds = YES;
    
    return cell;
}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFWorkTableViewCellModel *cellModel = (XFWorkTableViewCellModel *)model;
    self.followedLabel.text = cellModel.followedString;
    self.ownerLabel.text = cellModel.ownerString;
    self.details0Label.text = cellModel.details0String;
    self.details1Label.text = cellModel.details1String;
    self.priceLabel.text = cellModel.priceString;
    //po,20151015，临时屏蔽，暂不添加Web
    //[self.iconView setImageWithURL:[NSURL URLWithString:cellModel.iconImageURLString] placeholderImage:nil];
}

@end