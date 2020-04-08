//
//  WQCustomTextField.h
//  FamilyPlatForm
//
//  Created by cai on 17/5/12.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQCustomTextField : UITextField

/** 光标颜色*/
@property(nonatomic,strong)UIColor* tintColor;
/** 占位符颜色*/
@property(nonatomic,strong)UIColor* placeholderColor;
/** 占位符字体大小*/
@property(nonatomic,assign)  CGFloat placeholderFontSize;

@end
