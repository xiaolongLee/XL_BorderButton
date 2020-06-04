//
//  UIView+Size.h
//  CQ001
//
//  Created by yuanshi on 2020/4/25.
//  Copyright © 2020 yuanshi. All rights reserved.
//
 


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Size)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize  size;

@property (nonatomic, readonly) CGPoint innerCenter;
@end

NS_ASSUME_NONNULL_END
