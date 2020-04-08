//
//  CHOIDSearchDataBase.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIDSearchDataBase.h"


@implementation CHOIDSearchDataBase

+(id)shareDataBase{
    
    static CHOIDSearchDataBase *searchDataBase;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        searchDataBase = [[CHOIDSearchDataBase alloc]init];
    });
    
    return searchDataBase;
}
-(NSMutableArray *)readLocalArray{
    
    
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dataPath = [filePath stringByAppendingString:@"/history.plist"];
    
    //    NSLog(@"dataPath---%@",dataPath);
    
    //判断是否存在这个文件
    if (![[NSFileManager defaultManager]fileExistsAtPath:dataPath]) {
        
        NSMutableArray *array = [NSMutableArray array];
        
        
        [array writeToFile:dataPath atomically:YES];
        
        
        
        return array;
        
    }else{
        
        NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:dataPath];
        if (array==nil) {
            array=[[NSMutableArray alloc]init];
        }
    
        return array;
    }
    
}

- (void)writeLocalWithDataArray:(NSMutableArray *)dataArray{
    
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dataPath = [filePath stringByAppendingString:@"/history.plist"];
    
    [dataArray writeToFile:dataPath atomically:YES];
    
}

- (void)deleteLocalDataArray{
    
    NSString *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    NSString *dataPath = [filePath stringByAppendingString:@"/history.plist"];
    
    NSMutableArray *localArray  = [NSMutableArray arrayWithContentsOfFile:dataPath];
    
    [localArray removeAllObjects];
}
@end
