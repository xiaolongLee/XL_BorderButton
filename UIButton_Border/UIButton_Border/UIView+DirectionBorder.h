//
//  UIView+DirectionBorder.h
//  CQ001
//
//  Created by yuanshi on 2020/5/28.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};
@interface UIView (DirectionBorder)
- (void)setDirectionBorderWithTop:(BOOL)hasTopBorder left:(BOOL)hasLeftBorder bottom:(BOOL)hasBottomBorder right:(BOOL)hasRightBorder borderColor:(UIColor *)borderColor withBorderWidth:(CGFloat)borderWidth;

- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;
@end

NS_ASSUME_NONNULL_END
