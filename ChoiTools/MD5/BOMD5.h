//
//  BOMD5.h
//  WasherCar
//
//  Created by BeiOu202 on 16/9/26.
//  Copyright © 2016年 BeiOu202. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BOMD5 : NSObject
//md5加密方法
+ (NSString *)md5EncryptWithString:(NSString *)string;

@end
