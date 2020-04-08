//
//  CHOIPopMenuItem.h
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHOIPopMenuItem : NSObject

@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *title;

+(instancetype)initWith:(NSString *)image title:(NSString *)title;

@end
