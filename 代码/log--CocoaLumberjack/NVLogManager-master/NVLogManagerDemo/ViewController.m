//
//  ViewController.m
//  NVLogManagerDemo
//
//  Created by Jackey on 2017/6/3.
//  Copyright © 2017年 com.zhouxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self printMe];
}

-(void)printMe{
    
    DDLogInfo(@"dayinle --wo ");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
