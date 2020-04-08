//
//  UILabel+WJEstablish.h
//  wjGovernment
//
//  Created by 蔡伟强 on 2018/5/16.
//  Copyright © 2018年 Choi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WJEstablish)
/** 正常的lb */
+(UILabel *)labelFontSize:(CGFloat)fontSize textColor:(NSString *)textColor;
/** 加粗的lb */
+(UILabel *)labelBlodFontSize:(CGFloat)fontSize textColor:(NSString *)textColor;


/**
 * 计算文字的大小

 @return label 
 */
- (CGSize)caculatedSize;

/**
 * 富文本自定义样式的方法

 @param sourceStr 源字符串
 @param aimAttributedStr 需要富文本属性的字符串
 @param attributes 富文本样式
 @return 富文本对象
 */
+(NSMutableAttributedString *)attributeSourceStr:(NSString *)sourceStr
                                aimAttributedStr:(NSString *)aimAttributedStr
                                attributes:(NSDictionary <NSAttributedStringKey,id> *)attributes;

/**
 * 富文本 固定传 字体或者颜色

 @param sourceStr 源字符串
 @param aimAttributedStr 目标富文本
 @param font 字体大小
 @param color 颜色
 @return 富文本对象
 */
+(NSMutableAttributedString *)sourceStr:(NSString *)sourceStr
                       aimAttributedStr:(NSString *)aimAttributedStr
                                   font:(UIFont *)font
                                  color:(UIColor *)color;

/**
 *  设置字间距
 */
- (void)setColumnSpace:(CGFloat)columnSpace;
/**
 *  设置行距
 */
- (void)setRowSpace:(CGFloat)rowSpace;
@end
