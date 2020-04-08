//
//  HJCamerPrivayCloseView.m
//  妙居上架
//
//  Created by 程杰 on 2019/7/24.
//  Copyright © 2019 程杰. All rights reserved.
//

#import "HJCamerPrivayCloseView.h"
#import "UIColor+DKExtended.h"
#import "UIButton+touch.h"

@interface HJCamerPrivayCloseView ()

@property(nonatomic,strong) UIView* bgView;

@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *contentLb;
@property (nonatomic,strong) UIButton *cancleBtn;
@property (nonatomic,strong) UIButton *setBtn;
@property (nonatomic,strong) UIView *line1;
@property (nonatomic,strong) UIView *line2;

@end

static NSString *titleText = @"隐私 保护已开启";
static NSString *titleColor = @"333637";
static NSString *contentStr = @"无法观看视频，请至设置关闭隐私模式";
static NSString *contentColor = @"9CA1A2";

#define CHOIKeyWindow  [UIApplication sharedApplication].delegate.window

@implementation HJCamerPrivayCloseView

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
    
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.titleLb];
    [self.bgView addSubview:self.contentLb];
    [self.bgView addSubview:self.line1];
    [self.bgView addSubview:self.line2];
    [self.bgView addSubview:self.cancleBtn];
    [self.bgView addSubview:self.setBtn];
    
}

-(void)layoutSubviews {
    
    [super layoutSubviews];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(KAUTOSCALE(122));
        make.centerX.equalTo(self);
        make.width.mas_equalTo(KAUTOSCALE(300));
        make.height.mas_equalTo(KAUTOSCALE(200));
    }];
    
    [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bgView);
        make.top.equalTo(self.bgView).offset(KAUTOSCALE(55));
        make.height.mas_equalTo(KAUTOSCALE(15));
    }];
    
    
    [self.contentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleLb);
        make.top.equalTo(self.titleLb.mas_bottom).offset(KAUTOSCALE(11));
    }];

    [self.line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView);
        make.width.mas_equalTo(KAUTOSCALE(300));
//        make.top.equalTo(self.contentLb).offset(KAUTOSCALE(44));
        make.bottom.equalTo(self.bgView).offset(KAUTOSCALE(-60));
        make.height.mas_equalTo(KAUTOSCALE(1));
    }];

    [self.line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line1);
        make.centerX.equalTo(self.bgView);
        make.bottom.equalTo(self.bgView);
        make.width.mas_equalTo(KAUTOSCALE(1));
    }];

    [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView);
        make.right.equalTo(self.line2);
        make.bottom.equalTo(self.bgView);
        make.top.equalTo(self.line1);
    }];

    [self.setBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line1);
        make.left.equalTo(self.line2);
        make.right.bottom.equalTo(self.bgView);
    }];
    
}
//+(void)showWithFrame:(CGRect)frame{
//    
//    HJCamerPrivayCloseView *view = [[HJCamerPrivayCloseView alloc]initWithFrame:frame];
//
//    [CHOIKeyWindow addSubview:view];
//}
//
//+(void)heide {
//    
//    for (HJCamerPrivayCloseView *cover in CHOIKeyWindow.subviews) {
//        if ([cover isKindOfClass:self]) {
//            [cover removeFromSuperview];
//            [UIView animateWithDuration:0.2 animations:^{
//                cover.alpha = 0;
//            } completion:^(BOOL finished) {
//                [cover removeFromSuperview];
//                 cover.bgView = nil;
//            }];
//        }
//    }
//}

-(void)show {
    
    [self shakeToShow:self.bgView];
    [CHOIKeyWindow addSubview:self];
}
-(void)hide {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        self.bgView = nil;
    }];
}

#pragma mark --evnet response


-(void)setBtnClick:(UIButton *)button{

    if ([_delegate respondsToSelector:@selector(hjCamerView:btn:)]) {
        [self.delegate hjCamerView:self btn:button];
    }

}

-(void)cancleBtnClick{
    
    [self hide];
}

#pragma mark --getter and setter

-(UIView *)bgView{
    
    if (!_bgView) {
        _bgView = [[UIView alloc]init];
        _bgView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithHexString:@"FFFFFF" alpha:1.0];
        _bgView.layer.cornerRadius = KAUTOSCALE(5);
    }
    return _bgView;
}

- (UIView *)line1 {
    
    if (_line1 == nil) {
        _line1 = [UIView new];
        _line1.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
    }
    return _line1;
}

- (UIView *)line2 {
    
    if (_line2 == nil) {
        _line2 = [UIView new];
        _line2.backgroundColor = [UIColor colorWithHexString:@"D8D8D8"];
    }
    return _line2;
}
- (UILabel *)titleLb {
    
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc]init];
        _titleLb.textColor = [UIColor colorWithHexString:titleColor];
        _titleLb.text = NSLocalizedString(titleText, @"");
        _titleLb.font = DTFont(15);
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}


- (UILabel *)contentLb {
    
    if (_contentLb == nil) {
        _contentLb = [UILabel new];
        _contentLb.textColor = [UIColor colorWithHexString:contentColor];
        _contentLb.text = NSLocalizedString(contentStr, @"");
        _contentLb.font = DTFont(15);
        _contentLb.textAlignment = NSTextAlignmentCenter;
    }
    return _contentLb;
}
- (UIButton *)cancleBtn {
    
    if (_cancleBtn == nil) {
        _cancleBtn = [UIButton buttonWithBgColor:nil withTitleColor:[UIColor colorWithHexString:@"333637"] withTitleFont:15 withTitle:NSLocalizedString(@"取消", @"") withTarget:self withAction:@selector(cancleBtnClick)];
    }
    return _cancleBtn;
}

- (UIButton *)setBtn {
    
    if (_setBtn == nil) {
        _setBtn = [UIButton buttonWithBgColor:nil withTitleColor:[UIColor colorWithHexString:@"333637"] withTitleFont:15 withTitle:NSLocalizedString(@"去设置", @"") withTarget:self withAction:@selector(setBtnClick:)];
    }
    return _setBtn;
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
