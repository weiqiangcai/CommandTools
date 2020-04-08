//
//  macrosHeader.h
//  nnGovernment
//
//  Created by zhn on 2017/4/20.
//  Copyright © 2017年 zhn. All rights reserved.
//

#ifndef macrosHeader_h
#define macrosHeader_h
// weakself strongself
#define DTWEAKSELF  __weak __typeof__(self) weakSelf = self;
#define DTSTRONGSELF __strong __typeof(self) strongSelf = weakSelf;
// 判断字符串是否为空
#define kStringIsEmpty(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 ? YES : NO )
// 判断数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
// 判断字典是否为空
#define kDictIsEmpty(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
// 判断是否为 iPhone 5/SE
#define iPhone5_SE ([[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f)
// 判断是否为iPhone 6/6s/7
#define iPhone6_6s_7 ([[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f)
// 判断是否为iPhone 6Plus/6sPlus/7Plus
#define iPhone6Plus_6sPlus_7plus ([[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f)
// 判断是否为4s
#define iPhone4S ([[UIScreen mainScreen] bounds].size.height < 500.0f)
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
// 系统版本 >= 9
#define IOS9orLayter ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9)

// 屏幕宽高
#define SCREEN_WIDTH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
// 颜色
#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBCOLORALPHA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define DTRandomColor     [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
// 常用的一些缩写
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].keyWindow
#define kAppDelegate        [UIApplication sharedApplication].delegate
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]
// DEBUG模式下打印
#ifdef DEBUG
#define NSLog(...) NSLog(@"%@",[NSString stringWithFormat:__VA_ARGS__])
#else
#define NSLog(...)
#endif
// 计算适配的值
#define KAUTOSCALE(num) ((SCREEN_WIDTH/375)*num)
// 当前的tabbarcontroller
#define selectedNavigationController (UINavigationController *)[(UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController selectedViewController]
// 设置颜色
#define DTFont(font) [UIFont systemFontOfSize:KAUTOSCALE(font)]
// 设置字体
#define DTHexColor(str) [UIColor colorWithHexString:str]
// APP的版本号
#define KAPPVerSion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// APPbuild号
#define KAPPBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
// BoundleId
#define KAPPBoundleID [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]

#define kDevice_Is_iPhoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f)
#define K_NaviBar_height   (kDevice_Is_iPhoneX ? 88 : 64)
#define K_Navibar_extraheight (kDevice_Is_iPhoneX ? 24 : 0)
#define K_StatusBar_height ([UIApplication sharedApplication].statusBarFrame.size.height)
#define K_tabbar_extraheight (kDevice_Is_iPhoneX ? 34 : 0)
#define K_tabbar_height (kDevice_Is_iPhoneX ? 83 : 49)
//导航栏的高
#define dd_zj_Nav_Height                (kDevice_Is_iPhoneX ? 88.0 : 64.0)

// custome
#define KMainW [UIScreen mainScreen].bounds.size.width
#define KMainH [UIScreen mainScreen].bounds.size.height

#define KScreenRate (750 / KMainW)
#define KSuitFloat(float) (float / KScreenRate)
#define KSuitSize(width, height) CGSizeMake(width / KScreenRate, height / KScreenRate)

#define KSuitFloatNavX(float) ((float) / KScreenRate + K_Navibar_extraheight)
#define KSuitFloatTabX(float) ((float) / KScreenRate + K_tabbar_extraheight)

#define KSuitPoint(x, y) CGPointMake(x / KScreenRate, y / KScreenRate)
#define KSuitRect(x, y, width, heigth) CGRectMake(x / KScreenRate, y / KScreenRate, width / KScreenRate, heigth / KScreenRate)

//字体颜色
#define G_S_3_COLOR @"#333333"
#define G_S_3e_COLOR @"#3e3e3e"
//略黑
#define G_S_6_COLOR @"666666"
//浅黑zjGovernment Group
#define G_S_9_COLOR @"999999"




#endif
