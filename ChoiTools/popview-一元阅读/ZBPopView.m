//
//  ZBPopView.m
//  FamilyPlatForm
//
//  Created by cai on 17/5/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "ZBPopView.h"

@interface ZBPopView ()


@property(nonatomic,strong) UIView *alertView;
/** 背景图片 */
@property(nonatomic,strong) UIView* bgView;
/** textView背景 */
@property(nonatomic,strong) UIView* textBgView;
/** button-view */
@property(nonatomic,strong)UIView* buttonBgView;
/** 取消按钮 */
@property(nonatomic,strong)UIButton* cancleButton;
@end

@implementation ZBPopView

-(instancetype)init{
    
    if (self = [super init]) {
        
        [self setupView];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    return self;
}

/**
 * 子视图
 */
-(void)setupView{
    
   self.backgroundColor = [UIColor  colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:0.45];
    
    CGFloat width = kScreenWidth - 60;
    
    CGFloat height = kScreenHeight /2;
    
    [self addSubview:self.bgView];
    
    self.bgView.sd_layout.centerXEqualToView(self).centerYEqualToView(self).widthIs(width).heightIs(height+50);
    // 1 textBgView
    [self.bgView addSubview:self.textBgView];
    self.textBgView.sd_layout.leftSpaceToView(self.bgView,0).topSpaceToView(self.bgView,0).rightSpaceToView(self.bgView,0).bottomSpaceToView(self.bgView,50);
    
    [self.textBgView addSubview:self.textView];
    self.textView.sd_layout.leftSpaceToView(self.textBgView,5).topSpaceToView(self.textBgView,0).rightSpaceToView(self.textBgView,5).bottomSpaceToView(self.textBgView,5);
    
    // 2. cancleBgView
    [self.bgView addSubview:self.buttonBgView];
    self.buttonBgView.sd_layout.topSpaceToView(self.textBgView,0).leftSpaceToView(self.bgView,0).rightSpaceToView(self.bgView,0).heightIs(50);
    
    [self.buttonBgView addSubview:self.cancleButton];
    self.cancleButton.sd_layout.topSpaceToView(self.buttonBgView,10).centerXEqualToView(self.buttonBgView).widthIs(30).heightIs(30);
    
    [self shakeToShow:self.bgView];
    
}
#pragma mark --evnet response

/**
 * 取消按钮点击事件
 */
-(void)buttonClick:(UIButton *)button{
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.bgView = nil;
    }];
}
#pragma mark --getter and setter
-(UIView *)alertView{
    
    if (!_alertView ) {
        
        _alertView = [[UIView alloc]init];
    }
    return _alertView;
}
-(UIView *)bgView{
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
//        _bgView = [JMFoundation CommonViewWithbgColor:UIColorFromRGB(0xf7fcff)];
//        _bgView.sd_cornerRadius = @5;
    }
    return _bgView;
}
-(UIView *)textBgView{
    
    if (!_textBgView) {
        
        _textBgView = [JMFoundation CommonViewWithbgColor:UIColorFromRGB(0xf7fcff)];
        _textBgView.sd_cornerRadius = @5;
    }
    return _textBgView;
}
-(UITextView *)textView{
    
    if (!_textView) {
        _textView = [UITextView  new];
        _textView.backgroundColor = [UIColor clearColor];
        _textView.textColor =  UIColorFromRGB(0x333333);
        _textView.font = [UIFont  systemFontOfSize:14];
        _textView.editable = NO;
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.showsVerticalScrollIndicator = YES;
//        _textView.text = @"5月17日，内蒙古呼伦贝尔市陈巴尔虎旗那吉林场发生森林大火。截至昨天上午，经3天3夜、9000多名人员的全力扑救，目前，整个火场的外线明火已全部扑灭，实现了全线合围，扑火取得决定性胜利。火场面积及起火原因正在核查中。5月17日12时许，陈巴尔虎旗那吉林场发生森林火灾。截至昨天，火场过火面积超过8400公顷，国家森防指还调集12架森林消防飞机进行扑救。5月17日至18日，内蒙古共34个气象站高温破5月中旬极值纪录，主要分布在赤峰市、兴安盟、锡林郭勒盟和呼伦贝尔市等地，其中，13个气象站最高温超过40℃。";
    }
    return _textView;
}
-(UIButton *)cancleButton{
    
    if (!_cancleButton) {

        _cancleButton = [JMFoundation CommonButtonWihImage:@"deleteWord" withTarget:self withAction:@selector(buttonClick:)];
        
    }
    return _cancleButton;
}
-(UIView *)buttonBgView{
    if (!_buttonBgView) {
        _buttonBgView = [[UIView alloc]init];
    }
    return _buttonBgView;
}
#pragma mark---弹性动画
- (void)shakeToShow:(UIView *)aView
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.35;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.01f, 0.01f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.1f, 1.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9f, 0.9f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DIdentity]];
    popAnimation.keyTimes = @[@0.0f, @0.5f, @0.75f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [aView.layer addAnimation:popAnimation forKey:nil];
}

@end
