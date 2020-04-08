//
//  NSJSONSerialization+JudgeJsonSersion.m
//  Runtime-MethodExchange
//
//  Created by 蔡伟强 on 2019/7/31.
//  Copyright © 2019 蔡伟强. All rights reserved.
//

#import "NSJSONSerialization+JudgeJsonSersion.h"
#import <objc/runtime.h>


@implementation NSJSONSerialization (JudgeJsonSersion)

+(void)load{
    
    Method oldMethod = class_getClassMethod(self, @selector(JSONObjectWithData:options:error:));
    
    Method MyMethod = class_getClassMethod(self, @selector(JudgeJSONObjectWithData:options:error:));
    
    method_exchangeImplementations(oldMethod, MyMethod);
    
    
    Method oldMethod1 = class_getClassMethod(self, @selector(dataWithJSONObject:options:error:));
    
    Method MyMethod1 = class_getClassMethod(self, @selector(JudgeDataWithJSONObject:options:error:));
    
    method_exchangeImplementations(oldMethod1, MyMethod1);
    
}

+ (nullable id)JudgeJSONObjectWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError **)error{
    
    if ([NSJSONSerialization isValidJSONObject:data]) {
        
        id objc = [NSJSONSerialization JudgeJSONObjectWithData:data options:opt error:error];
        return objc;
    }
    
    return @"data is nil";
}

+ (nullable NSData *)JudgeDataWithJSONObject:(id)obj options:(NSJSONWritingOptions)opt error:(NSError **)error {
    
    if ([NSJSONSerialization isValidJSONObject:obj]) {
       
        NSData *data = [NSJSONSerialization JudgeDataWithJSONObject:obj options:opt error:error];
        
        return data;
    }
    NSData *data = [NSData data];
    return data;
}


@end
