//
//  CHOIDPopMenuViewSingleton.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIDPopMenuViewSingleton.h"
#import "CHOIDPopMenuView.h"


@interface CHOIDPopMenuViewSingleton ()

@property (nonatomic, strong) CHOIDPopMenuView *popmenuView;

@end
@implementation CHOIDPopMenuViewSingleton

+(CHOIDPopMenuViewSingleton *)shareManager{
    
    static CHOIDPopMenuViewSingleton *_popMenuViewSingleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _popMenuViewSingleton = [[CHOIDPopMenuViewSingleton alloc]init];
    });
    return _popMenuViewSingleton;
}
-(void)creatPopMenuWithFrame:(CGPoint)startPoint
                popMenuWidth:(CGFloat)width
                popMenuItems:(NSArray *)items
                      offSet:(CGFloat)offSet
                      action:(void (^)(NSInteger, CHOIPopMenuItem *model))action
{
    __weak __typeof(&*self)weakSelf = self;
    if (self.popmenuView != nil)
    {
        [weakSelf menuHide];
    }
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] firstObject];
    self.popmenuView = [[CHOIDPopMenuView alloc] initWithFrame:window.bounds
                                             menuStartPoint:startPoint
                                                  menuWidth:width
                                                  menuItems:items
                                                        offSet:offSet
                                                     action:^(NSInteger index,CHOIPopMenuItem *model) {
                                                         action(index,model);
                                                         [weakSelf menuHide];
                                                     }];
//    self.popmenuView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [window addSubview:self.popmenuView];
    

    [UIView animateWithDuration:0.3 animations:^{
        
        self.popmenuView.popMenuTableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        
    }];
    
}
- (void)menuHide
{
    [UIView animateWithDuration:0.3 animations:^{
        self.popmenuView.popMenuTableView.transform = CGAffineTransformMakeScale(0.01, 0.01);
        
    } completion:^(BOOL finished) {
        [self.popmenuView.popMenuTableView removeFromSuperview];
        [self.popmenuView removeFromSuperview];
        self.popmenuView.popMenuTableView = nil;
        self.popmenuView = nil;
    }];
}
-(void)setTabBgImage:(UIImage *)tabBgImage{
    
    _tabBgImage = tabBgImage;
    self.popmenuView.tabBgImage = tabBgImage;
    
}
-(void)setTabCellBgColor:(UIColor *)tabCellBgColor{
    
    _tabCellBgColor = tabCellBgColor;
    self.popmenuView.tabCellBgColor = tabCellBgColor;
    
}
-(void)setSelectedImage:(UIImage *)selectedImage{
    
    _selectedImage = selectedImage;
    self.popmenuView.selectedImage = selectedImage;
    
}
-(void)setTitleNormalColor:(UIColor *)titleNormalColor{
    
    _titleNormalColor = titleNormalColor;
    self.popmenuView.titleNormalColor = titleNormalColor;
}
-(void)setTitleSelectedColr:(UIColor *)titleSelectedColr{
    
    _titleSelectedColr = titleSelectedColr;
    self.popmenuView.titleSelectedColr = titleSelectedColr;
}
@end
