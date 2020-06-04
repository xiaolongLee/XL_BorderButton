//
//  UIButton+EdgeInsets.m
//  CQ001
//
//  Created by yuanshi on 2020/5/18.
//  Copyright © 2020 yuanshi. All rights reserved.
//

#import "UIButton+EdgeInsets.h"


@implementation UIButton (EdgeInsets)

- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetsStyle)style imageTitlespace:(CGFloat)space
{
    [self setTitle:self.currentTitle forState:UIControlStateNormal];
    [self setImage:self.currentImage forState:UIControlStateNormal];
    self.titleLabel.textColor = [UIColor blackColor];
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    //使用计算出来的文本长度做为label宽度如果出现文本长度超出btn时，可能造成image偏移量过大，image显示有误
//    CGFloat labelWidth = [self.titleLabel.text sizeWithFont:self.titleLabel.font].width;
//    CGFloat labelHeight = [self.titleLabel.text sizeWithFont:self.titleLabel.font].height;
    CGFloat labelWidth = self.titleLabel.bounds.size.width;
    CGFloat labelHeight = self.titleLabel.bounds.size.height;
#pragma clang diagnostic pop
    
    CGFloat imageOffsetX = (imageWidth + labelWidth) / 2 - imageWidth / 2;//image中心移动的x距离
    CGFloat imageOffsetY = imageHeight / 2 + space / 2;//image中心移动的y距离
    CGFloat labelOffsetX = (imageWidth + labelWidth / 2) - (imageWidth + labelWidth) / 2;//label中心移动的x距离
    CGFloat labelOffsetY = labelHeight / 2 + space / 2;//label中心移动的y距离
    
    CGFloat tempWidth = MAX(labelWidth, imageWidth);
    CGFloat changedWidth = labelWidth + imageWidth - tempWidth;
    CGFloat tempHeight = MAX(labelHeight, imageHeight);
    CGFloat changedHeight = labelHeight + imageHeight + space - tempHeight;
    
    switch (style) {
        case ButtonEdgeInsetsImageLeft:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space/2, 0, space/2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, -space/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, space/2);
            break;
            
        case ButtonEdgeInsetsImageRight:
            self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space/2, 0, -(labelWidth + space/2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth + space/2), 0, imageWidth + space/2);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, space/2, 0, space/2);
            break;
            
        case ButtonEdgeInsetsImageTop:
            self.imageEdgeInsets = UIEdgeInsetsMake(-imageOffsetY, imageOffsetX, imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(labelOffsetY, -labelOffsetX, -labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageOffsetY, -changedWidth/2, changedHeight-imageOffsetY, -changedWidth/2);
            break;
            
        case ButtonEdgeInsetsImageBottom:
            self.imageEdgeInsets = UIEdgeInsetsMake(imageOffsetY, imageOffsetX, -imageOffsetY, -imageOffsetX);
            self.titleEdgeInsets = UIEdgeInsetsMake(-labelOffsetY, -labelOffsetX, labelOffsetY, labelOffsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(changedHeight-imageOffsetY, -changedWidth/2, imageOffsetY, -changedWidth/2);
            break;
            
        default:
            break;
    }
}

///设置按钮正常，高亮时图片
- (void)setImage:(UIImage *)image imageHL:(UIImage *)imageHL
{
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:imageHL forState:UIControlStateHighlighted];
}

//快速创建Btn
+ (UIButton *)buttonWithTitle:(NSString *)title{
    return [UIButton buttonWithTitle:title selectTitle:nil image:nil selectImage:nil titleColor:nil selectTitleColor:nil bgImage:nil selectBgImage:nil];
}

//自定义Btn
+ (UIButton *)buttonWithTitle:(NSString *)title selectTitle:(NSString *)selectTitle image:(NSString *)image selectImage:(NSString *)selectImage titleColor:(UIColor *)color selectTitleColor:(UIColor *)selectColor bgImage:(UIImage *)bgImage selectBgImage:(UIImage *)selectBgImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    // 标题
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (selectTitle) {
        [button setTitle:selectTitle forState:UIControlStateSelected];
    }
    // 图片
    if (image) {
        [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    }
    if (selectImage) {
        [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    }
    // 标题颜色
    if (color) {
        [button setTitleColor:color forState:UIControlStateNormal];
    }else{
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (selectColor) {
        [button setTitleColor:selectColor forState:UIControlStateSelected];
    }
    // 背景图片
    if (bgImage) {
        [button setBackgroundImage:bgImage forState:UIControlStateNormal];
    }
    if (selectBgImage) {
        [button setBackgroundImage:selectBgImage forState:UIControlStateSelected];
    }
    
    return button;
}


+ (UIButton *)buttonWithTitle:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage titleColor:(UIColor *)color font:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
     // 标题
        if (title) {
            [button setTitle:title forState:UIControlStateNormal];
        }
   // 图片
            if (image) {
                [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
            }
    if (selectImage) {
          [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
      }
    if (color) {
       [button setTitleColor:color forState:UIControlStateNormal];
    }
    
    if (titleFont) {
        button.titleLabel.font = titleFont;
    }
    if (title) {
         NSMutableAttributedString * mutableAttriStr = [[NSMutableAttributedString alloc] initWithString:title];
        NSDictionary * attris = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSBackgroundColorAttributeName:backgroundColor,NSFontAttributeName:titleFont};
        [mutableAttriStr setAttributes:attris range:NSMakeRange(0,mutableAttriStr.length)];
        button.titleLabel.attributedText = mutableAttriStr;
    }
        
      
       
    return button;
}

@end
