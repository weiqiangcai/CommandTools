//
//  XMGPerson.m
//  10-掌握-单粒模式
//
//  Created by xiaomage on 15/7/8.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGPerson.h"

@interface XMGPerson() <NSCopying>

@end

@implementation XMGPerson

static XMGPerson *_person;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [super allocWithZone:zone];
    });
    return _person;
}

+ (instancetype)sharedPerson
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _person = [[self alloc] init];
    });
    return _person;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _person;
}
@end
