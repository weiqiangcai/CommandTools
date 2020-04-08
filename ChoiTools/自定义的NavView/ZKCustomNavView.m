//
//  ZKCustomNavView.m
//  FamilyPlatForm
//
//  Created by cai on 17/8/4.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "ZKCustomNavView.h"

@interface ZKCustomNavView ()

/** 中间label */
@property(nonatomic,strong)UILabel *titleLb;

/** 左边返回按钮 */
@property(nonatomic,strong)UIButton *leftBtn;

/** 右侧按钮 */
@property(nonatomic,strong)UIButton *rightBtn;
@end

@implementation ZKCustomNavView


+(instancetype)zkCustomNavView{
    
    return [[self alloc]init];
}
-(instancetype)init{
    
    if (self = [super init]) {
      
        [self setupView];
    }
    return  self;
}
-(void)awakeFromNib{
    
    [super awakeFromNib];
    
    [self setupView];
    
}
#pragma mark -action

/**
 *button 右侧 和 左侧

 @param button button
 */
-(void)navBtnClicl:(UIButton *)button{
    
    if ([self.delegate respondsToSelector:@selector(zkCustomNavView:navButton:)]) {
        
        [self.delegate zkCustomNavView:self navButton:button];
    }
    
}
#pragma mark - set

/**
 * 设置右侧图片

 @param rightImage right
 */
-(void)setRightImage:(UIImage *)rightImage{
    
    _rightImage = rightImage;
    
    [_rightBtn setImage:rightImage forState:UIControlStateNormal];
}

/**
 * 设置右侧文字

 @param rightTitle right
 */
-(void)setRightTitle:(NSString *)rightTitle{
    
    _rightTitle = rightTitle;
    
    [_rightBtn setTitle:rightTitle forState:UIControlStateNormal];
    
}

/**
 * 设置中间title文字

 @param titleStr title
 */
-(void)setTitleStr:(NSString *)titleStr{
    
    _titleStr = titleStr;
    
    _titleLb.text = titleStr;
}
#pragma mark -setupUI
-(void)setupView{
    
    self.backgroundColor = [UIColor redColor];
    
    UIView *topView = [UIView new];
    
    UIImageView *leftImage = [JMFoundation CommonImageViewWithImage:@"zk_return"];
    
    
    UIButton *leftBtn = [JMFoundation CommonButtonWihImage:@"" withTarget:self withAction:@selector(navBtnClicl:)];
    leftBtn.tag = 331;
//    leftBtn.backgroundColor = [UIColor grayColor];
    
    
    self.titleLb = [JMFoundation CommonLabelWithFont:17 textColor:threeColor];
    self.titleLb.textAlignment = NSTextAlignmentCenter;
//    self.titleLb.backgroundColor = [UIColor grayColor];
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [_rightBtn setTitleColor:threeColor forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(navBtnClicl:) forControlEvents:UIControlEventTouchUpInside];
    _rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
//    _rightBtn.backgroundColor = [UIColor grayColor];
    _rightBtn.tag = 332;

    
    NSArray *subArray = @[topView,leftImage,leftBtn,self.titleLb,_rightBtn];
    
    [self sd_addSubviews:subArray];
    
    topView.sd_layout
    .topSpaceToView(self,0)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(20);

    
    leftImage.sd_layout
    .leftSpaceToView(self,15)
    .widthIs(8)
    .heightIs(14)
    .bottomSpaceToView(self,10);
    
    leftBtn.sd_layout
    .leftSpaceToView(self,0)
    .widthIs(100)
    .heightIs(44)
    .bottomSpaceToView(self,0);
    
    self.titleLb.sd_layout
    .centerYEqualToView(leftBtn)
    .centerXEqualToView(self)
    .widthIs(200)
    .autoHeightRatio(0);
    
    _rightBtn.sd_layout
    .centerYEqualToView(leftBtn)
    .rightSpaceToView(self,15)
    .widthIs(100)
    .heightIs(35);
    
    [self setupAutoHeightWithBottomViewsArray:subArray bottomMargin:0];
    
}
@end
