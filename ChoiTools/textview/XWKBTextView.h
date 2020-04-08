//
//  XWKBTextView.h
//  FamilyPlatForm
//
//  Created by Mac on 17/3/6.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^TextViewBlock)(UIButton *btn);

@interface XWKBTextView : UITextView<UITextViewDelegate>

@property(nonatomic,copy) NSString* placeholder;

@property(nonatomic,retain) UIColor* placeholderColor;

@property(nonatomic,retain) UIFont* placeholderFont;

@property(nonatomic,strong)UILabel *placeholderLabel;

@property(nonatomic,strong)TextViewBlock btnBlock;

@property(nonatomic,strong)UIButton *button;


@end
