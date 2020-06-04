//
//  UIButton+SmsVerification.m
//  OneHome
//
//  Created by yuanshi on 2020/1/13.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "UIButton+SmsVerification.h"

@implementation UIButton (SmsVerification)

 

/**
 设置view指定位置的边框
 @param originalView   原view
 @param color          边框颜色
 @param borderWidth    边框宽度
 @param borderType     边框类型 例子: UIBorderSideTypeTop|UIBorderSideTypeBottom
 @return  view
 */
- (UIView *)borderForView:(UIView *)originalView color:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIButtonBorderSideType)borderType {
    
    if (borderType == UIButtonBorderSideTypeAll) {
        originalView.layer.borderWidth = borderWidth;
        originalView.layer.borderColor = color.CGColor;
        return originalView;
    }
    
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    
    /// 左侧
    if (borderType & UIButtonBorderSideTypeLeft) {
        /// 左侧线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, originalView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake(0.0f, 0.0f)];
    }
    
    /// 右侧
    if (borderType & UIButtonBorderSideTypeRight) {
        /// 右侧线路径
        [bezierPath moveToPoint:CGPointMake(originalView.frame.size.width, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake( originalView.frame.size.width, originalView.frame.size.height)];
    }
    
    /// top
    if (borderType & UIButtonBorderSideTypeTop) {
        /// top线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, 0.0f)];
        [bezierPath addLineToPoint:CGPointMake(originalView.frame.size.width, 0.0f)];
    }
    
    /// bottom
    if (borderType & UIButtonBorderSideTypeBottom) {
        /// bottom线路径
        [bezierPath moveToPoint:CGPointMake(0.0f, originalView.frame.size.height)];
        [bezierPath addLineToPoint:CGPointMake( originalView.frame.size.width, originalView.frame.size.height)];
    }
  
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    
    [originalView.layer addSublayer:shapeLayer];
    
    return originalView;
}

 

@end
