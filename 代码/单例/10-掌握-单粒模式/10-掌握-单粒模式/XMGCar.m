//
//  XMGCar.m
//  10-掌握-单粒模式
//
//  Created by xiaomage on 15/7/8.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGCar.h"

@interface XMGCar() // <NSCopying>

@end

@implementation XMGCar

static XMGCar *_car;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _car = [super allocWithZone:zone];
    });
    return _car;
}

+ (instancetype)sharedCar
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _car = [[self alloc] init];
    });
    return _car;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _car;
}
@end
