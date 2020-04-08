//
//  ZKCustomNavView.h
//  FamilyPlatForm
//
//  Created by cai on 17/8/4.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol ZKCustomNavViewDelegate <NSObject>
@optional

-(void)zkCustomNavView:(UIView *)zkCustomNavView navButton:(UIButton *)button;

@end

@interface ZKCustomNavView : UIView

@property(nonatomic,weak)id <ZKCustomNavViewDelegate>delegate;

+(instancetype)zkCustomNavView;



/** 中间title */
@property(nonatomic,copy)NSString *titleStr;

/** 右侧文字 */
@property(nonatomic,copy)NSString *rightTitle;

/** 右侧图片 */
@property(nonatomic,strong)UIImage *rightImage;

@end
