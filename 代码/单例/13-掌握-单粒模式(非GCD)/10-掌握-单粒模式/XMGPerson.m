//
//  XMGPerson.m
//  10-掌握-单粒模式
//
//  Created by xiaomage on 15/7/8.
//  Copyright (c) 2015年 小码哥. All rights reserved.
//

#import "XMGPerson.h"

@interface XMGPerson()

@end

@implementation XMGPerson

static id _instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}

+ (instancetype)sharedInstance
{
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
@end
