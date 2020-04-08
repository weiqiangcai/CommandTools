//
//  BOMD5.m
//  WasherCar
//
//  Created by BeiOu202 on 16/9/26.
//  Copyright © 2016年 BeiOu202. All rights reserved.
//

#import "BOMD5.h"
#import <CommonCrypto/CommonDigest.h>

//秘钥
static NSString *encryptionKey = @"key=BDD3BA91E31D4194806A8F9C3F3E1380";
@implementation BOMD5

+ (NSString *)md5EncryptWithString:(NSString *)string{
    return [self md5:[NSString stringWithFormat:@"%@",string]];
}

+ (NSString *)md5:(NSString *)string{
    const char *cStr = [string UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(cStr, (CC_LONG)strlen(cStr), digest);
    
    NSMutableString *result = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02X", digest[i]];
    }
    
    return result;
}

@end
