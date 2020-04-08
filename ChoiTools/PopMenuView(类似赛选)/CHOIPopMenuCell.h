//
//  CHOIPopMenuCell.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHOIPopMenuItem;
@interface CHOIPopMenuCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong)CHOIPopMenuItem *Menu;

@property(nonatomic,assign)BOOL isSelected;

/** cell的背景颜色 */
@property(nonatomic,strong)UIColor *tabCellBgColor;
/** cell选中时背景图片 */
@property(nonatomic,strong)UIImage *selectedImage;
/** label正常颜色 */
@property(nonatomic,strong)UIColor *titleNormalColor;
/** label选中颜色 */
@property(nonatomic,strong)UIColor *titleSelectedColr;

@end
