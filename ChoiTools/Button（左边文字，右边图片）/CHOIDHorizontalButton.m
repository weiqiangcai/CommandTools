//
//  CHOIDHorizontalButton.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/9.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIDHorizontalButton.h"

@implementation CHOIDHorizontalButton

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (self.imageView.mj_x < self.titleLabel.mj_x) {
        self.titleLabel.mj_x = self.imageView.mj_x;
        self.imageView.mj_x = CGRectGetMaxX(self.titleLabel.frame);
    }
    
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    
    [super setTitle:title forState:state];
    
    [self sizeToFit];
    
}
-(void)setImage:(UIImage *)image forState:(UIControlState)state{
    
    [super setImage:image forState:state];
    
    [self sizeToFit];
    
}
@end
