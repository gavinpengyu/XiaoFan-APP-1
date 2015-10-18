//
//  XFWorkTableViewHeader.h
//  XF AppDemo V0.0
//
//  Created by po on 10/17/15.
//  Copyright © 2015 po. All rights reserved.
//

#ifndef XFWorkTableViewHeader_h
#define XFWorkTableViewHeader_h

#import <UIKit/UIKit.h>

@interface XFWorkTableViewHeader : UIView

@property (nonatomic, strong) NSArray *headerItemModelsArray;

@property (nonatomic, copy) void (^buttonClickedOperationBlock)(NSInteger index);

@end

// --------------------------XFWorkTableViewHeaderItemModel-----------

@interface XFWorkTableViewHeaderItemModel : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) Class destinationControllerClass;

+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName destinationControllerClass:(Class)destinationControllerClass;

@end

#endif /* XFWorkTableViewHeader_h */
