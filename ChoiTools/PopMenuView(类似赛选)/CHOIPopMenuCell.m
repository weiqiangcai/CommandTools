//
//  CHOIPopMenuCell.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIPopMenuCell.h"
#import "CHOIPopMenuItem.h"

@interface CHOIPopMenuCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;

@end

@implementation CHOIPopMenuCell

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *cellID = @"CHOIPopMenuCell";
    
    CHOIPopMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]firstObject];
        
    }
    return cell;
    
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    self.bgImage.hidden = YES;
    
}
-(void)setMenu:(CHOIPopMenuItem *)Menu{
    
    _Menu = Menu;
    
//    self.bgImage.image = [UIImage imageNamed:Menu.image];
    
    _titleLb.text = Menu.title;
    
}
-(void)setIsSelected:(BOOL)isSelected{
    
    _isSelected = isSelected;
    if (isSelected == YES) {
        self.bgImage.hidden = NO;
    } else {
        self.bgImage.hidden = YES;
    }
    
}
-(void)setTabCellBgColor:(UIColor *)tabCellBgColor{
    
    _tabCellBgColor = tabCellBgColor;
    
    self.contentView.backgroundColor = tabCellBgColor;
}
-(void)setSelectedImage:(UIImage *)selectedImage{
    
    _selectedImage = selectedImage;
    
    self.bgImage.image = selectedImage;
}
-(void)setTitleNormalColor:(UIColor *)titleNormalColor{
    
    _titleNormalColor = titleNormalColor;
    
    self.titleLb.textColor = titleNormalColor;
    
}
-(void)setTitleSelectedColr:(UIColor *)titleSelectedColr{
    
    _titleSelectedColr = titleSelectedColr;
    
    if (_isSelected == YES) {
        self.titleLb.textColor = titleSelectedColr;
    } else {
        self.titleLb.textColor = _titleNormalColor;
    }
}

@end
