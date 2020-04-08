//
//  HJCamerPrivayCloseView.h
//  妙居上架
//
//  Created by 程杰 on 2019/7/24.
//  Copyright © 2019 程杰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class HJCamerPrivayCloseView;
@protocol HJCamerPrivayCloseViewDelegate <NSObject>

-(void)hjCamerView:(HJCamerPrivayCloseView *)view btn:(UIButton *)btn;

@end

@interface HJCamerPrivayCloseView : UIView

@property (nonatomic,weak) id <HJCamerPrivayCloseViewDelegate> delegate;

-(void)show;

-(void)hide;




@end

NS_ASSUME_NONNULL_END
