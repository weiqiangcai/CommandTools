//
//  WQCustomTextView.h
//  FamilyPlatForm
//
//  Created by cai on 17/5/16.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQCustomTextView : UITextView

/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;

@end
