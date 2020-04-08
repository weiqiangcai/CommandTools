//
//  CustomAlterView.m
//  FamilyPlatForm
//
//  Created by Mac on 17/2/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CustomAlterView.h"

@implementation CustomAlterView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // 创建遮罩
        _blackView = [UIView new];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha= 0.5;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(blickClick)];
        [self.blackView addGestureRecognizer:tap];
        [self addSubview:_blackView];
        
        // 创建alert
        _alertview = [UIView new];
        _alertview.center = self.center;
        _alertview.layer.cornerRadius = 8;
        _alertview.clipsToBounds = YES;
        _alertview.backgroundColor = RGB(245, 251, 255);
        [self addSubview:_alertview];
        [self exChangeOut:self.alertview dur:0.6];
        
        
    
        UILabel *bangdingLb = [UILabel new];
        bangdingLb.text = @"发送后无法撤回，确认发送该随访记录给您的患者吗？";
        bangdingLb.textColor = UIColorFromRGB(0x333333);
        bangdingLb.font = [UIFont systemFontOfSize:14];
        [_alertview addSubview:bangdingLb];
        
        self.canceButton = [JMFoundation CommonButtonWihImage:@"no" withTarget:self withAction:@selector(clickButton:)];
        self.canceButton.tag = 201;
        [_alertview addSubview:self.canceButton];
        
//        self.sureButton = [JMFoundation CommonButtonWihImage:@"yes" withTarget:self withAction:@selector(clickButton:)];
        self.sureButton = [JMFoundation CommonButtonWithTitle:@"确定" withCornerRadius:5 withBorderWidth:1 withBorderColor:RGB(42, 141, 240) withTitleColor:RGB(42, 141, 240) withFont:14 withTarget:self withAction:@selector(clickButton:)];
        self.sureButton.tag = 202;
        [_alertview addSubview:self.sureButton];
        
        
        CGFloat height = 160;
        CGFloat width = 200;
        
        _blackView.sd_layout.leftSpaceToView(self,0).topSpaceToView(self,0).widthIs(kScreenWidth).heightIs(kScreenHeight);
        _alertview.sd_layout.heightIs(height).widthIs(width).centerXEqualToView(self).centerYEqualToView(self);
        bangdingLb.sd_layout.topSpaceToView(_alertview,20).leftSpaceToView(_alertview,20).rightSpaceToView(_alertview,20).autoHeightRatio(0);
        self.canceButton.sd_layout.topSpaceToView(bangdingLb,20).leftSpaceToView(_alertview,30).widthIs(60).heightIs(30);
        self.sureButton.sd_layout.topEqualToView(self.canceButton).rightSpaceToView(_alertview,30).widthIs(60).heightIs(30);
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.alertview.center = CGPointMake(self.center.x, self.center.y);
}
#pragma mark --action--
-(void)blickClick
{
    
    [self cancleView];
}
- (void)cancleView
{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.alertview = nil;
    }];
    
}
-(void)clickButton:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(didClickButtonAtIndex:)]) {
        
        [self.delegate didClickButtonAtIndex:btn.tag];
    }
    
    [self cancleView];
    
}
-(void)exChangeOut:(UIView *)changeOutView dur:(CFTimeInterval)dur{
    
    CAKeyframeAnimation * animation;
    
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    
    animation.duration = dur;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    [changeOutView.layer addAnimation:animation forKey:nil];
}
@end
