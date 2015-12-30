//
//  XFNAssetCommentView.h
//  XF AppDemo V0.0
//
//  Created by po on 15/12/13.
//  Copyright © 2015年 po. All rights reserved.
//

#ifndef XFNAssetCommentView_h
#define XFNAssetCommentView_h

#import <UIKit/UIKit.h>
#import "XFNFrameAssetModel.h"
#import "XFNAssetEditView.h"

//-----------------------------------------------------------------------------------------
@interface XFNAssetCommentView : XFNAssetEditView

@property (nonatomic,strong) id <XFNPushEditViewDelegate> delegate;

@end

#endif /* XFNAssetCommentView_h */
