//
//  UILabel+WJEstablish.m
//  wjGovernment
//
//  Created by 蔡伟强 on 2018/5/16.
//  Copyright © 2018年 Choi. All rights reserved.
//

#import "UILabel+WJEstablish.h"
#import <CoreText/CoreText.h>


@implementation UILabel (WJEstablish)

+(UILabel *)labelFontSize:(CGFloat)fontSize textColor:(NSString *)textColor{
    
    UILabel *lb = [[UILabel alloc]init];
    lb.font = DTFont(fontSize);//[UIFont systemFontOfSize:fontSize];
    lb.textColor = DTHexColor(textColor);
    
    return lb;
}

+(UILabel *)labelBlodFontSize:(CGFloat)fontSize textColor:(NSString *)textColor{
    
    UILabel *lb = [[UILabel alloc]init];
    lb.font = [UIFont boldSystemFontOfSize:fontSize];
    lb.textColor = DTHexColor(textColor);
    
    return lb;
}

- (CGSize)caculatedSize{
    CGSize size = CGSizeMake(self.frame.size.width, MAXFLOAT);
    
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:self.font.pointSize] forKey:NSFontAttributeName];
    
    CGRect rect = [self.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil];
    
    return rect.size;
}

+(NSMutableAttributedString *)attributeSourceStr:(NSString *)sourceStr aimAttributedStr:(NSString *)aimAttributedStr attributes:(NSDictionary <NSAttributedStringKey,id> *)attributes{
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:sourceStr];
    
    NSRange range = [sourceStr rangeOfString:aimAttributedStr];
    
    [attributedString addAttributes:attributes range:range];
    
    return attributedString;
    
}

+(NSMutableAttributedString *)sourceStr:(NSString *)sourceStr aimAttributedStr:(NSString *)aimAttributedStr font:(UIFont *)font color:(UIColor *)color{

    NSRange range = [sourceStr rangeOfString:aimAttributedStr];

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:sourceStr];
    if (font) {
        [attrStr addAttribute:NSFontAttributeName value:font range:range];
    }
    if (color) {
        [attrStr addAttribute:NSForegroundColorAttributeName value:color range:range];
    }

    return attrStr;
}

- (void)setColumnSpace:(CGFloat)columnSpace {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    
    [attributedString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(columnSpace) range:NSMakeRange(0, [attributedString length])]; self.attributedText = attributedString;
    
}
    
- (void)setRowSpace:(CGFloat)rowSpace {
    self.numberOfLines = 0; NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整行距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = rowSpace; paragraphStyle.baseWritingDirection = NSWritingDirectionLeftToRight;
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.text length])];
    self.attributedText = attributedString;
    
}
    


@end
