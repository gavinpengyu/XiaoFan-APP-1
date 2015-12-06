//
//  XFNWorkTableViewCell.m
//  XFN AppDemo V0.0
//
//  Created by po on 15/10/15.
//  Copyright © 2015年 po. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XFNFrame.h"

#import "XFNWorkTableViewController.h"
#import "XFNWorkTableViewCell.h"
#import "XFNWorkTableViewCellModel.h"
#import "XFNWorkTableViewHeader.h"

#import "XFNWorkDetailTableViewCell.h"

#import "XFNGridView.h"

//po,20151015，临时屏蔽，暂不添加Web
//#import "UIImageView+WebCache.h"

//-----------全局标签数组，在整个房源View使用--------------------------------------------------
static NSMutableArray * sXFNlabelsForAssetStatusGlobalArray;
static NSMutableArray * sXFNlabelsForTypeOfPayGlobalArray;
static NSMutableArray * sXFNlabelsForTaxInfoGlobalArray;
static NSMutableArray * sXFNlabelsForAssetLayoutInfoGlobalArray;
static NSMutableArray * sXFNlabelsForDecorationInfoGlobalArray;
static NSMutableArray * sXFNlabelsForAncillaryInfoGlobalArray;
//-----------------------------------------------------------------------------------------


@implementation XFNWorkTableViewCell
//-----------------------------------------------------------------------------------------
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self  = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
    if (self)
    {
        //XFNWorkTableViewCell *cell = [[[NSBundle mainBundle] loadNibNamed:@"XFNWorkTableViewCell" owner:nil options:nil] lastObject];
        //return cell;
        [self initSubView];
    }
    return self;
}

- (void) initSubView
{
    //头像－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _ownerheadImage               = [[UIImageView alloc] init];
    [self addSubview : _ownerheadImage];
    
    //归属人－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _ownernameLabel               = [[UILabel alloc] init];
    _ownernameLabel.textColor     = [UIColor blackColor];
    _ownernameLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 4)];
    [self addSubview : _ownernameLabel];
    
    //发送时间－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _sendtimeLabel               = [[UILabel alloc] init];
    _sendtimeLabel.textColor     = [UIColor grayColor];
    _sendtimeLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 4)];
    [self addSubview : _sendtimeLabel];
    
    //置顶状态－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _isOnTopLabel               = [[UILabel alloc] init];
    _isOnTopLabel.textColor     = [UIColor blackColor];
    _isOnTopLabel.textAlignment = NSTextAlignmentRight;
    _isOnTopLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 4)];
    [self addSubview : _isOnTopLabel];
    
    //name－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _nameLabel               = [[UILabel alloc] init];
    _nameLabel.textColor     = [UIColor blackColor];
    _nameLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _nameLabel];
    
    //价格－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _priceLabel               = [[UILabel alloc] init];
    _priceLabel.textColor     = [UIColor redColor];
    _priceLabel.font          = [UIFont boldSystemFontOfSize: (XFNDetailTableViewCellFontSizeL)];
    [self addSubview : _priceLabel];
    
    //detail－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _detailLabel               = [[UILabel alloc] init];
    _detailLabel.textColor     = [UIColor blackColor];
    _detailLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _detailLabel];
    
    //状态－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _statusLabel               = [[UILabel alloc] init];
    _statusLabel.textColor     = [UIColor blackColor];
    _statusLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault)];
    [self addSubview : _statusLabel];
    
    //跟进－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _commentsLabel               = [[UILabel alloc] init];
    _commentsLabel.textColor     = [UIColor blackColor];
    _commentsLabel.text          = @"跟进";
    _commentsLabel.textAlignment = NSTextAlignmentCenter;
    _commentsLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)];
//    _commentsLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    _commentsLabel.layer.borderWidth = 1;
    [self addSubview : _commentsLabel];

    //关注－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _isFollowedLabel               = [[UILabel alloc] init];
    _isFollowedLabel.textColor     = [UIColor blackColor];
    _isFollowedLabel.textAlignment = NSTextAlignmentCenter;
    _isFollowedLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)];
//    _isFollowedLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    _isFollowedLabel.layer.borderWidth = 1;
    [self addSubview : _isFollowedLabel];

    //更多－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    _moreActionLabel               = [[UILabel alloc] init];
    _moreActionLabel.textColor     = [UIColor blackColor];
    _moreActionLabel.text          = @"更多";
    _moreActionLabel.textAlignment = NSTextAlignmentCenter;
    _moreActionLabel.font          = [UIFont systemFontOfSize: (XFNDetailTableViewCellFontSizeDefault - 2)];
//    _moreActionLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    _moreActionLabel.layer.borderWidth = 1;
    [self addSubview : _moreActionLabel];
}

- (void) initViewLayout
{
    //头像－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_ownerheadImage
    CGFloat ownerheadImageX     = XFNTableViewCellControlSpacing;
    CGFloat ownerheadImageY     = XFNTableViewCellControlSpacing;
    CGSize  ownerheadImageSize  = CGSizeMake(XFNCommentItemAvatarDefaultSize, XFNCommentItemAvatarDefaultSize);
    CGRect  ownerHeadImageRect  = CGRectMake(ownerheadImageX,
                                             ownerheadImageY,
                                             ownerheadImageSize.width,
                                             ownerheadImageSize.height);
    _ownerheadImage.frame   = ownerHeadImageRect;
    
    //归属人－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_ownernameLabel
    CGFloat ownernameLabelX     = ownerheadImageX + ownerheadImageSize.width + XFNTableViewCellControlSpacing;
    CGFloat ownernameLabelY     = ownerheadImageY; //与头像Y对齐
    CGSize  ownernameLabelSize  = [_ownernameLabel.text sizeWithAttributes : @{NSFontAttributeName : _ownernameLabel.font}];
    CGRect  ownernameLabelRect  = CGRectMake(ownernameLabelX,
                                             ownernameLabelY,
                                             ownernameLabelSize.width,
                                             ownernameLabelSize.height);
    _ownernameLabel.frame   = ownernameLabelRect;
    
    //发送时间－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_sendtimeLabel
    CGFloat sendtimeLabelX      = ownernameLabelX; //与归属人X对齐
    CGSize  sendtimeLabelSize   = [_sendtimeLabel.text sizeWithAttributes : @{NSFontAttributeName : _sendtimeLabel.font}];
    CGFloat sendtimeLabelY      = ownerheadImageY + ownerheadImageSize.height - sendtimeLabelSize.height;
    CGRect  sendtimeLabelRect   = CGRectMake(sendtimeLabelX,
                                             sendtimeLabelY,
                                             sendtimeLabelSize.width,
                                             sendtimeLabelSize.height);
    _sendtimeLabel.frame    = sendtimeLabelRect;
    
    //置顶状态－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_isOnTopLabel
    CGFloat isOnTopLabelY      = ownernameLabelY;
    CGSize  isOnTopLabelSize   = [_isOnTopLabel.text sizeWithAttributes : @{NSFontAttributeName : _isOnTopLabel.font}];
    CGFloat isOnTopLabelX      = _Macro_ScreenWidth - isOnTopLabelSize.width - XFNTableViewCellControlSpacing; //靠屏幕最右上角
    CGRect  isOnTopLabelRect   = CGRectMake(isOnTopLabelX,
                                            isOnTopLabelY,
                                            isOnTopLabelSize.width,
                                            isOnTopLabelSize.height);
    _isOnTopLabel.frame        = isOnTopLabelRect;
    
    //name－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_nameLabel
    CGFloat nameLabelX         = ownerheadImageX; //与头像X对齐
    CGFloat nameLabelY         = ownerheadImageY + ownerheadImageSize.height + XFNTableViewCellControlSpacing;
    CGSize  nameLabelSize      = [_nameLabel.text sizeWithAttributes : @{NSFontAttributeName : _nameLabel.font}];
    CGRect  nameLabelRect      = CGRectMake(nameLabelX,
                                            nameLabelY,
                                            nameLabelSize.width,
                                            nameLabelSize.height);
    _nameLabel.frame       = nameLabelRect;
    
    //价格－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_priceLabel
    CGSize  priceLabelSize     = [_priceLabel.text sizeWithAttributes : @{NSFontAttributeName : _priceLabel.font}];
    CGFloat priceLabelX        = _Macro_ScreenWidth - priceLabelSize.width - XFNTableViewCellControlSpacing; //靠屏幕右侧，在置顶状态下方
    CGFloat priceLabelY        = nameLabelY + nameLabelSize.height - priceLabelSize.height; //与nameLabel底部对齐
    CGRect  priceLabelRect     = CGRectMake(priceLabelX,
                                            priceLabelY,
                                            priceLabelSize.width,
                                            priceLabelSize.height);
    _priceLabel.frame       = priceLabelRect;
    
    //detail－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_detailLabel
    CGFloat detailLabelX        = nameLabelX; //与头像X对齐
    CGFloat detailLabelY        = nameLabelY + nameLabelSize.height + XFNTableViewCellControlSpacing;
    CGSize  detailLabelSize     = [_detailLabel.text sizeWithAttributes : @{NSFontAttributeName : _detailLabel.font}];
    CGRect  detailLabelRect     = CGRectMake(detailLabelX,
                                             detailLabelY,
                                             detailLabelSize.width,
                                             detailLabelSize.height);
    _detailLabel.frame      = detailLabelRect;
    
    //状态－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_statusLabel
    CGSize  statusLabelSize     = [_statusLabel.text sizeWithAttributes : @{NSFontAttributeName : _statusLabel.font}];
    CGFloat statusLabelX        = _Macro_ScreenWidth - statusLabelSize.width - XFNTableViewCellControlSpacing; //靠屏幕右侧，在priceLabelX下方
    CGFloat statusLabelY        = detailLabelY + detailLabelSize.height - statusLabelSize.height; //与detailLabel底部对齐
    CGRect  statusLabelRect     = CGRectMake(statusLabelX,
                                             statusLabelY,
                                             statusLabelSize.width,
                                             statusLabelSize.height);
    _statusLabel.frame      = statusLabelRect;
    
    //房源标签－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

    CGPoint tempPoint = CGPointMake (0, (_detailLabel.frame.origin.y + _detailLabel.frame.size.height + XFNTableViewCellControlSpacing));
    
    UIView * labelView= [XFNWorkDetailTableViewCell initLabelUIViewWithArray: _labelsArray andOriginPoint: tempPoint];
    
    [self addSubview : labelView];
    
    
    //在“跟进”的上方添加一条分割横线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    //    UIView * gridHorizontalLine = [[UIView alloc] initWithFrame: CGRectMake (0,
    //                                                                             assetLabelAY + _Macro_XFNWorTableViewCellAssetLabelHeight + XFNTableViewCellControlSpacing/2,
    //                                                                             _Macro_ScreenWidth,
    //                                                                             _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    UIView * gridHorizontalLine = [[UIView alloc] initWithFrame: CGRectMake (0,
                                                                             labelView.frame.origin.y + labelView.frame.size.height + XFNTableViewCellControlSpacing/2,
                                                                             _Macro_ScreenWidth,
                                                                             _Macro_XFNWorTableViewCellHorizontalSeperatorHeight)];
    gridHorizontalLine.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridHorizontalLine];
    
    //跟进－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    //CGFloat commentsLabelY      = assetLabelAY + _Macro_XFNWorTableViewCellAssetLabelHeight + XFNTableViewCellControlSpacing; //在Label下方
    CGFloat commentsLabelY      = labelView.frame.origin.y + labelView.frame.size.height + XFNTableViewCellControlSpacing; //在Label下方
    CGFloat commentsLabelX      = detailLabelX; //与detailLabel X对齐；
    CGSize  commentsLabelSize   = [_commentsLabel.text sizeWithAttributes : @{NSFontAttributeName : _commentsLabel.font}];
    commentsLabelSize.width     = (_Macro_ScreenWidth - XFNTableViewCellControlSpacing*2) / 3; //底部分为3个按钮，跟进在最左侧
    commentsLabelSize.height    = commentsLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  commentsLabelRect   = CGRectMake(commentsLabelX,
                                             commentsLabelY,
                                             commentsLabelSize.width,
                                             commentsLabelSize.height);
    _commentsLabel.frame        = commentsLabelRect;
    
    //关注－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_isFollowedLabel
    CGFloat isFollowedLabelY    = commentsLabelY; //与跟进Y对齐
    CGFloat isFollowedLabelX    = commentsLabelX + commentsLabelSize.width; //在跟进X的后面
    CGSize  isFollowedLabelSize = [_isFollowedLabel.text sizeWithAttributes : @{NSFontAttributeName : _isFollowedLabel.font}];
    isFollowedLabelSize.width   = commentsLabelSize.width;//底部分为3个按钮，关注在最中间
    isFollowedLabelSize.height  = isFollowedLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  isFollowedLabelRect = CGRectMake(isFollowedLabelX,
                                             isFollowedLabelY,
                                             isFollowedLabelSize.width,
                                             isFollowedLabelSize.height);
    _isFollowedLabel.frame      = isFollowedLabelRect;
    
    //在“关注”的前方添加一条分割竖线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UIView * gridVerticalLineOne = [[UIView alloc] initWithFrame: CGRectMake (isFollowedLabelX,
                                                                              isFollowedLabelY + 2,
                                                                              _Macro_XFNWorTableViewCellVerticalSeperatorWidth,
                                                                              isFollowedLabelSize.height - 4)];
    gridVerticalLineOne.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridVerticalLineOne];
    
    //更多－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－_moreActionLabel
    CGFloat moreActionLabelY    = commentsLabelY; //与跟进Y对齐
    CGFloat moreActionLabelX    = isFollowedLabelX + isFollowedLabelSize.width; //在关注X的后面
    CGSize  moreActionLabelSize = [_moreActionLabel.text sizeWithAttributes : @{NSFontAttributeName : _moreActionLabel.font}];
    moreActionLabelSize.width   = commentsLabelSize.width;//底部分为3个按钮，更多在最右侧
    moreActionLabelSize.height  = moreActionLabelSize.height + XFNTableViewCellControlSpacing;
    CGRect  moreActionLabelRect = CGRectMake(moreActionLabelX,
                                             moreActionLabelY,
                                             moreActionLabelSize.width,
                                             moreActionLabelSize.height);
    _moreActionLabel.frame      = moreActionLabelRect;
    
    //在“更多”的前方添加一条分割竖线－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
    UIView * gridVerticalLineTwo = [[UIView alloc] initWithFrame: CGRectMake (moreActionLabelX,
                                                                              moreActionLabelY + 2,
                                                                              _Macro_XFNWorTableViewCellVerticalSeperatorWidth,
                                                                              moreActionLabelSize.height - 4)];
    gridVerticalLineTwo.backgroundColor = [UIColor lightGrayColor];
    [self addSubview: gridVerticalLineTwo];
}

//po 20151205，添加一个UIView统一布局labels，
//- (void)setAssetLabelsWithArray: (NSArray*) array
//{
//    if (nil == array)
//    {
//        DLog(@"ERROR: input array is nil");
//    }
//    
//    NSUInteger tempCount = [array count];
//    NSUInteger tempIndex = 0;
//    
//    if ( (_Macro_ScreenWidth - XFNTableViewCellControlSpacing) / (XFNTableViewCellControlSpacing + _Macro_XFNWorTableViewCellAssetLabelWidth) > 6)
//    {
//        tempIndex = 6; //label宽度为50，space宽度10，iphone6刚好可以放下6个标签
//    }
//    else
//    {
//        tempIndex = 5; //4寸屏只能放5个标签
//    }
//    
//    if (tempCount < tempIndex)
//    {
//        tempIndex = tempCount; //若标签不足5个or6个，则以实际标签数目为准
//    }
//    
//    for (int ii; ii < tempIndex; ii++)
//    {
//        if (0 == ii)
//        {
//            _assetLabelA.text = array[ii];
//            //DLog(@"_assetLabelA=%@", _assetLabelA.text);
//        }
//        else if (1 == ii)
//        {
//            _assetLabelB.text = array[ii];
//            //DLog(@"_assetLabelB=%@", _assetLabelB.text);
//        }
//        else if (2 == ii)
//        {
//            _assetLabelC.text = array[ii];
//            //DLog(@"_assetLabelC=%@", _assetLabelC.text);
//        }
//        else if (3 == ii)
//        {
//            _assetLabelD.text = array[ii];
//            //DLog(@"_assetLabelD=%@", _assetLabelD.text);
//        }
//        else if (4 == ii)
//        {
//            _assetLabelE.text = array[ii];
//            //DLog(@"_assetLabelE=%@", _assetLabelE.text);
//        }
//        else if (5 == ii)
//        {
//            _assetLabelF.text = array[ii];
//            //DLog(@"_assetLabelF=%@", _assetLabelF.text);
//        }
//        else
//        {
//            DLog(@"ERROR: array error, ii=%d, tempIndex=%lu, tempCount=%lu", ii, (unsigned long)tempIndex, (unsigned long)tempCount);
//        }
//    }
//}

- (void)setModel:(NSObject *)model
{
    [super setModel:model];
    
    XFNWorkTableViewCellModel *cellModel = (XFNWorkTableViewCellModel *)model;
    _nameLabel.text       = cellModel.nameString;
    _detailLabel.text     = cellModel.detailString;
    _priceLabel.text      = cellModel.priceString;
    _statusLabel.text     = cellModel.statusString;
    _ownernameLabel.text  = cellModel.ownernameString;
    _sendtimeLabel.text   = cellModel.sendtimeString;
    _ownerheadImage.image = cellModel.ownerImage;
    
    _bIsFollowed          = cellModel.bThisItemIsFollowed;
    _bIsOnTop             = cellModel.bThisItemIsOnTop;
    
    _labelsArray          = cellModel.labelsArray;
    
    if (_bIsFollowed)
    {
        _isFollowedLabel.text = @"取消关注";
    }
    else
    {
        _isFollowedLabel.text = @"关注";
    }
    
    if (_bIsOnTop)
    {
        _isOnTopLabel.text    = @"取消置顶";
    }
    else
    {
        _isOnTopLabel.text    = @"置顶";
    }

    //po,20151015，临时屏蔽，暂不添加Web
    //[_iconView setImageWithURL:[NSURL URLWithString:cellModel.iconImageURLString] placeholderImage:nil];
    
    [self initViewLayout];
}

+ (UIColor *)getTheColorOfLabel: (NSString*) label
{
    //NSArray* tempArrayAssetStatus = [XFNWorkTableViewController getlabelsForAssetStatusGlobalArray];
    NSArray* tempArrayTypeOfPay   = [XFNWorkTableViewController getlabelsForTypeOfPayGlobalArray];
    NSArray* tempArrayTaxInfo     = [XFNWorkTableViewController getlabelsForTaxInfoGlobalArray];
    NSArray* tempArrayAssetLayout = [XFNWorkTableViewController getlabelsForAssetLayoutInfoGlobalArray];
    NSArray* tempArrayDecoration  = [XFNWorkTableViewController getlabelsForDecorationInfoGlobalArray];
    NSArray* tempArrayAncillary   = [XFNWorkTableViewController getlabelsForAncillaryInfoGlobalArray];
    
    if ([tempArrayTypeOfPay containsObject : label])
    {
        return _Macro_XFNWorTableViewCell_TypeOfPay_Label_Color;
    }
    else if ([tempArrayTaxInfo containsObject : label])
    {
        return _Macro_XFNWorTableViewCell_TaxInfo_Label_Color;
    }
    else if ([tempArrayAssetLayout containsObject : label])
    {
        return _Macro_XFNWorTableViewCell_AssetLayout_Label_Color;
    }
    else if ([tempArrayDecoration containsObject : label])
    {
        return _Macro_XFNWorTableViewCell_Decoration_Label_Color;
    }
    else if ([tempArrayAncillary containsObject : label])
    {
        return _Macro_XFNWorTableViewCell_Ancillary_Label_Color;
    }
    else
    {
        return [UIColor blackColor];
    }
}

@end

















