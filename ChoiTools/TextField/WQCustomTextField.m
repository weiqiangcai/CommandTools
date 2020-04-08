//
//  WQCustomTextField.m
//  FamilyPlatForm
//
//  Created by cai on 17/5/12.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "WQCustomTextField.h"

@implementation WQCustomTextField

/*
 
 -(UITextField*)AllocTextFieldWith:(NSString *)holderText{
 UITextField  *nameTextField =  [UITextField new];
 nameTextField.delegate = self;
 nameTextField.backgroundColor = [UIColor  whiteColor];
 nameTextField.textColor = UIColorFromRGB(0x333333);
 nameTextField.font = [UIFont systemFontOfSize:14];
 nameTextField.textAlignment = NSTextAlignmentCenter;
 NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:holderText];
 [placeholder addAttribute:NSForegroundColorAttributeName
 value:UIColorFromRGB(0x999999)// (0x999999)
 range:NSMakeRange(0, holderText.length)];
 [placeholder addAttribute:NSFontAttributeName
 value:[UIFont systemFontOfSize:14]
 range:NSMakeRange(0, holderText.length)];
 nameTextField.attributedPlaceholder = placeholder;
 
 return nameTextField;
 }
 
 */


//通过代码创建
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
//通过xib创建
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setUpUI];
}

- (void)setUpUI
{
    //字体大小
    self.font = [UIFont systemFontOfSize:15];
    //字体颜色
//    self.textColor = self.textColor;
    //光标颜色
    self.tintColor= self.tintColor;
    //占位符的颜色和大小
    [self setValue:self.placeholderColor forKeyPath:@"_placeholderLabel.textColor"];
    [self setValue:[UIFont boldSystemFontOfSize:self.placeholderFontSize] forKeyPath:@"_placeholderLabel.font"];
    // 不成为第一响应者
    [self resignFirstResponder];
    // 
//    self.clearButtonMode=UITextFieldViewModeWhileEditing;
}
/**
 * 当前文本框聚焦时就会调用
 */
- (BOOL)becomeFirstResponder
{
    // 修改占位文字颜色
    [self setValue:self.textColor forKeyPath:@"_placeholderLabel.textColor"];
    return [super becomeFirstResponder];
}

/**
 * 当前文本框失去焦点时就会调用
 */
- (BOOL)resignFirstResponder
{
    // 修改占位文字颜色
    [self setValue:[UIColor grayColor] forKeyPath:@"_placeholderLabel.textColor"];
    return [super resignFirstResponder];
}
//控制placeHolder的位置
-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    return inset;
}

//控制显示文本的位置
-(CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x+15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    return inset;
}

//控制编辑文本的位置
-(CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect inset = CGRectMake(bounds.origin.x +15, bounds.origin.y, bounds.size.width -15, bounds.size.height);
    return inset;
}
//#pragma mark - 代理
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    [kdefaultCenter postNotificationName:@"loginTextFieldDidEndEditing" object:nil];
//}
//
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    [kdefaultCenter postNotificationName:@"loginTextFieldDidEndEditing" object:nil];
//    
//    
//}
@end
