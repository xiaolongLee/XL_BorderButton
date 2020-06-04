//
//  UIButton+SmsVerification.h
//  OneHome
//
//  Created by yuanshi on 2020/1/13.
//  Copyright © 2020 yuanshi. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 边框类型(位移枚举)
typedef NS_ENUM(NSInteger, UIButtonBorderSideType) {
    UIButtonBorderSideTypeAll    = 0,
    UIButtonBorderSideTypeTop    = 1 << 0,
    UIButtonBorderSideTypeBottom = 1 << 1,
    UIButtonBorderSideTypeLeft   = 1 << 2,
    UIButtonBorderSideTypeRight  = 1 << 3,
};
 
@interface UIButton (SmsVerification)
 

/**
 设置view指定位置的边框
 @param originalView   原view
 @param color          边框颜色
 @param borderWidth    边框宽度
 @param borderType     边框类型 例子: UIBorderSideTypeTop|UIBorderSideTypeBottom
 @return  view
 */
- (UIView *)borderForView:(UIView *)originalView color:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIButtonBorderSideType)borderType;
 
@end

NS_ASSUME_NONNULL_END
