//
//  ViewController.m
//  UINavigationBarDemo
//
//  Created by ru on 2018/2/5.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)btnClick:(UIButton *)btn {
    
    TwoViewController *VC = [TwoViewController new];
    [self.navigationController pushViewController:VC animated:YES];
    
}


@end
