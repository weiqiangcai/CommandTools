//
//  CHOIDSearchDataBase.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/22.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHOIDSearchDataBase : NSObject

+ (id)shareDataBase;

- (NSMutableArray *)readLocalArray;

- (void)writeLocalWithDataArray:(NSMutableArray *)dataArray;

- (void)deleteLocalDataArray;



@end
