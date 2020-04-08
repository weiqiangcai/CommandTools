//
//  CHOIDSearchHistoryCell.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIDSearchHistoryCell.h"

@implementation CHOIDSearchHistoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.mb_label = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, self.frame.size.width-100,self.frame.size.height)];
        self.mb_label.backgroundColor = [UIColor clearColor];
        self.mb_label.textColor = [UIColor blackColor];
        self.mb_label.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.mb_label];
        
        
        self.mb_deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.mb_deleteButton setImage:[UIImage imageNamed:@"delete_history"] forState:UIControlStateNormal];// docremove  delete_history
        self.mb_deleteButton.backgroundColor = [UIColor clearColor];
        [self addSubview: self.mb_deleteButton];
        
    }
    return self;
}



- (void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat imageWH = 50;
    
    self.mb_label.frame = CGRectMake(20, 0, self.frame.size.width-self.frame.size.height-30, self.frame.size.height);
    self.mb_deleteButton.frame = CGRectMake(self.frame.size.width-imageWH-10, 0, imageWH, imageWH);

//    self.mb_deleteButton.frame = CGRectMake(self.frame.size.width-self.frame.size.height-10, 0, self.frame.size.height, self.frame.size.height);
}
@end
