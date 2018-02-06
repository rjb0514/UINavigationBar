//
//  TwoViewController.m
//  UINavigationBarDemo
//
//  Created by ru on 2018/2/5.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "UserDefinedNavBar.h"

@interface TwoViewController ()

@property (nonatomic, strong) UserDefinedNavBar *defiedNav;


@end

@implementation TwoViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    //需要自定义导航
    self.userDefinedNavBar = YES;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.defiedNav];
}

- (void)btnClick:(UIButton *)btn {
    
    ThreeViewController *VC = [ThreeViewController new];
    [self.navigationController pushViewController:VC animated:YES];
    
}

#pragma mark - lazy
- (UserDefinedNavBar *)defiedNav {
    if (!_defiedNav) {
        _defiedNav = [[UserDefinedNavBar alloc] initWithBackButtonImageStr:@"back" navTitleName:@"哈哈" rightBtnImageStr:nil];
        _defiedNav.backgroundColor = [UIColor yellowColor];
        __weak typeof(self) weakSelf = self;
        _defiedNav.backBtnClickBlock = ^() {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
    }
    return _defiedNav;
}


@end
