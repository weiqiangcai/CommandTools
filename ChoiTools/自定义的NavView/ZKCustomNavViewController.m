//
//  ZKCustomNavViewController.m
//  FamilyPlatForm
//
//  Created by cai on 17/8/4.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "ZKCustomNavViewController.h"
#import "ZKCustomNavView.h"
@interface ZKCustomNavViewController ()<ZKCustomNavViewDelegate>

/** nav */
@property(nonatomic,strong)ZKCustomNavView *nav;


@end

@implementation ZKCustomNavViewController

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.navigationController.navigationBarHidden = NO;
}
#pragma mark -<>nav 代理
-(void)zkCustomNavView:(UIView *)zkCustomNavView navButton:(UIButton *)button{
    
    if (button.tag == 331 ) { // 左边返回
        
        !self.leftBtn ? :self.leftBtn();
        
        [self.navigationController popViewControllerAnimated:YES];
        
    } else { // 右边点击事件
        
        // 装逼block
        !self.rightBtn ? :self.rightBtn();
    }
    
}
#pragma mark -懒加载
-(ZKCustomNavView *)nav{
    
    if (!_nav) {
        
        _nav = [ZKCustomNavView zkCustomNavView];
       
        _nav.delegate = self;
        
    }
    return _nav;
}
#pragma mark -set
-(void)setTitleStr:(NSString *)titleStr{
    
    _titleStr = titleStr;
    
    _nav.titleStr = titleStr;
    
}
-(void)setRightImage:(UIImage *)rightImage{
    
    _rightImage = rightImage;
    
    _nav.rightImage = rightImage;
}
-(void)setRightTitle:(NSString *)rightTitle{
    
    _rightTitle = rightTitle;
    
    _nav.rightTitle = rightTitle;

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBarHidden = YES;
    [self.view addSubview:self.nav];
    self.nav.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0).heightIs(64);

}
- (CGFloat)cellContentViewWith
{
    CGFloat width = kScreenWidth;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
