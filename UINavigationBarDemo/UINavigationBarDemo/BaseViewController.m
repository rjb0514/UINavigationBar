//
//  BaseViewController.m
//  UINavigationBarDemo
//
//  Created by ru on 2018/2/5.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置vie的颜色  如果不设置颜色的话 Navigation push 操作会出现黑屏卡顿的效果
    //所以我们给基类 的view设置个颜色
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = NSStringFromClass(self.class);
    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //判断是否隐藏导航
    if (self.userDefinedNavBar) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }else {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}



@end
