//
//  CHOIDSearchHistoryCell.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHOIDSearchHistoryCell : UITableViewCell

@property(nonatomic,strong)UIButton             *mb_deleteButton;
@property(nonatomic,assign)NSIndexPath          *mb_indexPath;
@property(nonatomic,strong)UILabel              *mb_label;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
