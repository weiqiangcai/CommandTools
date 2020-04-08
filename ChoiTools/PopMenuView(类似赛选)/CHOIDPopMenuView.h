//
//  CHOIDPopMenuView.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CHOIPopMenuItem;
@interface CHOIDPopMenuView : UIView


@property (nonatomic, strong) UITableView *popMenuTableView;

/**
 *  创建tableView
 *
 *  @param frame
 *  @param satrtPoint  整个弹框左上角坐标
 *  @param menuWidth  弹出框的宽度
 *  @param items     模型数组
 *  @param action    cell选中标识
 *
 *  @return 返回所点击的cell
 */
- (instancetype)initWithFrame:(CGRect)frame
               menuStartPoint:(CGPoint)startPoint
                    menuWidth:(CGFloat)menuWidth
                    menuItems:(NSArray *)items
                       offSet:(CGFloat)offSet
                       action:(void (^)(NSInteger index,CHOIPopMenuItem *model))action;


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
