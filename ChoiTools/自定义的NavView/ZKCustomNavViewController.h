//
//  ZKCustomNavViewController.h
//  FamilyPlatForm
//
//  Created by cai on 17/8/4.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+SDAutoTableViewCellHeight.h"
//#import "BaseViewController.h"

@interface ZKCustomNavViewController : UIViewController

/** 中间title */
@property(nonatomic,strong)NSString *titleStr;

/** 右侧文字 */
@property(nonatomic,strong)NSString *rightTitle;

/** 右侧图片 */
@property(nonatomic,strong)UIImage *rightImage;

/** 右侧按钮点击事件（button.tag == 332） */
@property(nonatomic,copy) void(^rightBtn)();

/** 左侧按钮点击事件（button.tag == 331） */
@property(nonatomic,copy) void(^leftBtn)();

// 如果继承了 这个VC 那么高度 要从64 后面算起 （就是平常的 0 == 64）
// setupView 父类没有写 不能写

/**
 *重写 左侧返回按钮事件 和 右侧提交事件
  左侧button.tag == 331  右侧button.tag == 332
 @param zkCustomNavView 自定义view
 @param button button
 */
-(void)zkCustomNavView:(UIView *)zkCustomNavView navButton:(UIButton *)button;

- (CGFloat)cellContentViewWith;

@end
