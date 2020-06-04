//
//  UIButton+EdgeInsets.h
//  CQ001
//
//  Created by yuanshi on 2020/5/18.
//  Copyright © 2020 yuanshi. All rights reserved.
//

 


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ButtonEdgeInsetsStyle) {
    ButtonEdgeInsetsImageLeft = 0,              //图片在左，文字在右，默认
    ButtonEdgeInsetsImageRight = 1,             //图片在右，文字在左
    ButtonEdgeInsetsImageTop = 2,               //图片在上，文字在下
    ButtonEdgeInsetsImageBottom = 3,            //图片在下，文字在上
};

@interface UIButton (EdgeInsets)


 

/**
 *  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
 *  注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+space
 *
 *  @param space 图片和文字的间隔
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space;

/**
 设置按钮普通/高亮时图片

 @param image 普通状态图片
 @param imageHL 高亮状态图片
 */
- (void)setImage:(UIImage *)image imageHL:(UIImage *)imageHL;

/**
 快速创建Btn

 @param title 标题
 @return Btn
 */
+ (UIButton *)buttonWithTitle:(NSString *)title;

/**
 自定义Btn

 @param title 标题
 @param selectTitle 选中状态标题
 @param image 图片
 @param selectImage 选中状态图片
 @param color 标题颜色
 @param selectColor 选中状态标题颜色
 @param bgImage 背景图片
 @param selectBgImage 选中状态背景图片
 @return Btn
 */
+ (UIButton *)buttonWithTitle:(NSString *)title selectTitle:(NSString *)selectTitle image:(NSString *)image selectImage:(NSString *)selectImage titleColor:(UIColor *)color selectTitleColor:(UIColor *)selectColor bgImage:(UIImage *)bgImage selectBgImage:(UIImage *)selectBgImage;

/**
自定义Btn

@param title 标题
@param image 图片
@param selectImage 选中状态图片
@param color 标题颜色
@param titleFont 字体大小
@param backgroundColor 文字背景颜色
 
@return Btn
*/
+ (UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage titleColor:(UIColor *)color font:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor;
@end

NS_ASSUME_NONNULL_END
