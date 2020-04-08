//
//  CHOIDPopMenuViewSingleton.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class CHOIPopMenuItem;

@interface CHOIDPopMenuViewSingleton : NSObject

/**
 *  创建单例
 *
 *
 */
+ (CHOIDPopMenuViewSingleton *)shareManager;

/**
 *  创建一个弹出框菜单
 *
 *  @param startPoint 弹出框左上角起点位置
 *  @param width      弹出框的宽度
 *  @param items      模型数组
 *  @param action     点击回调方法
 */
- (void)creatPopMenuWithFrame:(CGPoint)startPoint
                 popMenuWidth:(CGFloat)width
                 popMenuItems:(NSArray *)items
                       offSet:(CGFloat)offSet
                       action:(void(^)(NSInteger index,CHOIPopMenuItem *model))action;

/**
 *  隐藏菜单
 */
- (void)menuHide;



/** PopMenuTableView的背景图片 */
@property(nonatomic,strong)UIImage *tabBgImage;
/** cell的背景颜色 */
@property(nonatomic,strong)UIColor *tabCellBgColor;
/** cell选中时背景图片 */
@property(nonatomic,strong)UIImage *selectedImage;
/** label正常颜色 */
@property(nonatomic,strong)UIColor *titleNormalColor;
/** label选中颜色 */
@property(nonatomic,strong)UIColor *titleSelectedColr;


@end
