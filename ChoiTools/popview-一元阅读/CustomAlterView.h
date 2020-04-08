//
//  CustomAlterView.h
//  FamilyPlatForm
//
//  Created by Mac on 17/2/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CustomAlterViewDelegate <NSObject>
@optional

-(void)didClickButtonAtIndex:(NSUInteger)index ;

@end

@interface CustomAlterView : UIView
@property (nonatomic,strong)UIView *blackView;
@property (strong,nonatomic)UIView * alertview;
@property(nonatomic,strong)UIButton *canceButton;
@property(nonatomic,strong)UIButton *sureButton;


@property(nonatomic,weak) id<CustomAlterViewDelegate> delegate;
@end
