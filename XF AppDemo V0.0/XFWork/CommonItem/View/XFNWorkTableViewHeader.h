//
//  XFNWorkTableViewHeader.h
//  XFN AppDemo V0.0
//
//  Created by po on 10/17/15.
//  Copyright © 2015 po. All rights reserved.
//

#ifndef XFNWorkTableViewHeader_h
#define XFNWorkTableViewHeader_h

#import <UIKit/UIKit.h>

@interface XFNWorkTableViewHeader : UIView

@property (nonatomic, strong) NSArray *headerItemModelsArray;

@property (nonatomic, copy) void (^buttonClickedOperationBlock)(NSInteger index);

@end

// --------------------------XFNWorkTableViewHeaderItemModel-----------

@interface XFNWorkTableViewHeaderItemModel : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) Class destinationControllerClass;

+ (instancetype)modelWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end

#endif /* XFNWorkTableViewHeader_h */
