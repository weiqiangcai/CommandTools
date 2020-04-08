//
//  ZBPopView.h
//  FamilyPlatForm
//
//  Created by cai on 17/5/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//  一元阅读 弹出的PopView

#import <UIKit/UIKit.h> 

@interface ZBPopView : UIView

/** textView */
@property(nonatomic,strong)UITextView* textView;

@end

/**
 ZBPopView *popView = [[ZBPopView alloc]init];
 popView.frame = [[UIScreen mainScreen]bounds];
 
 popView.textView.text = circleEntity.maincontent;
 
 UIView * keywindow = [[UIApplication sharedApplication] keyWindow];
 [keywindow addSubview: popView];
 */
