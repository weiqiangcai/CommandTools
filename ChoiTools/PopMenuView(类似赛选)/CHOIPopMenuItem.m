//
//  CHOIPopMenuItem.m
//  FamilyPlatForm
//
//  Created by cai on 17/11/13.
//  Copyright © 2017年 梁继明. All rights reserved.
//

#import "CHOIPopMenuItem.h"

@implementation CHOIPopMenuItem

+(instancetype)initWith:(NSString *)image title:(NSString *)title{
    
    CHOIPopMenuItem *item = [[self alloc]init];
    
    item.image = image;
    
    item.title = title;
    
    return item;
}

@end
