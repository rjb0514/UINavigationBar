//
//  UserDefinedNavBar.m
//  UINavigationBarDemo
//
//  Created by ru on 2018/2/6.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import "UserDefinedNavBar.h"
#import <Masonry.h>
#import "UIColor+Extension.h"

#define DEVICE_WIDTH  [UIScreen mainScreen].bounds.size.width

@interface UserDefinedNavBar ()

/** 标题文字 */
@property (nonatomic, copy) NSString *titleString;
/** 标题图 */
@property (nonatomic, copy) NSString *titleImageName;
/** 返回按钮图片 */
@property (nonatomic, copy) NSString *backBtnImageStr;
/** 右侧按钮文字 */
@property (nonatomic, copy) NSString *rightBtnString;
/** 右侧按钮图片 */
@property (nonatomic ,copy) NSString * rightBtnImageStr;
/** 底部线条 */
@property (nonatomic, weak) UIView *lineView;
/** 右侧按钮 */
@property (nonatomic, weak) UIButton *rightButton;

@end

@implementation UserDefinedNavBar

/**
 右侧按钮为图片
 */
- (instancetype)initWithBackButtonImageStr:(NSString *)backImageStr navTitleName:(NSString *)titleString rightBtnImageStr:(NSString *)rightBtnImageStr {
    CGFloat Barheight =  [UIApplication sharedApplication].statusBarFrame.size.height;
    self = [super initWithFrame:CGRectMake(0, 20, DEVICE_WIDTH, Barheight + 24)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.backBtnImageStr = backImageStr;
        self.titleString = titleString;
        self.rightBtnImageStr = rightBtnImageStr;
        [self setupUI];
    }
    return self;
}

/**
 右侧按钮为图片  title为图片
 */
- (instancetype)initWithBackButtonImageStr:(NSString *)backImageStr navTitleImageName:(NSString *)imageString rightBtnImageStr:(NSString *)rightBtnImageStr {
    CGFloat Barheight =  [UIApplication sharedApplication].statusBarFrame.size.height;
    self = [super initWithFrame:CGRectMake(0, 20, DEVICE_WIDTH, Barheight + 24)];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.backBtnImageStr = backImageStr;
        self.titleImageName = imageString;
        self.rightBtnImageStr = rightBtnImageStr;
        [self setupUI];
    }
    return self;
}

#pragma mark - setUI
- (void)setupUI {
    if (self.backBtnImageStr) {
        ///返回按钮
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:self.backBtnImageStr] forState:UIControlStateNormal];
        [backButton addTarget:self action : @selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        backButton.adjustsImageWhenHighlighted = NO;
        [self addSubview:backButton];
        [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.equalTo(self);
            make.left.equalTo(self).offset(10);
            make.width.mas_equalTo(33);
        }];
        //扩大相应区域
        
    }
    if (self.titleString.length) {
        ///标题
        UILabel *navigationLabel=[[UILabel alloc]init];;
        navigationLabel.font = [UIFont systemFontOfSize:18];
        navigationLabel.text = self.titleString;
        navigationLabel.textColor = [UIColor whiteColor];
        [self addSubview:navigationLabel];
        self.titleLabel = navigationLabel;
        [navigationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.centerX.equalTo(self);
        }];
    }
    
    if (self.titleImageName.length) {
        ///标题是图片
        UIImageView *iconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.titleImageName]];
        [self addSubview:iconImageView];
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    
    if (self.rightBtnString || self.rightBtnImageStr) {
        ///右侧
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightBtn setTitleColor:[UIColor colorWithRGBString:@"#FE5722"] forState:UIControlStateNormal];
        if (self.rightBtnImageStr.length) {
            [rightBtn setImage:[UIImage imageNamed:self.rightBtnImageStr ] forState:(UIControlStateNormal)];
        } else {
            [rightBtn setTitle:self.rightBtnString forState:UIControlStateNormal];
        }
        [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightBtn];
        rightBtn.adjustsImageWhenHighlighted = NO;
        self.rightButton = rightBtn;
        
        
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-10);
            make.top.bottom.equalTo(self);
            make.width.mas_equalTo(40);
        }];
    
    }
    //线条
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWithRGBString:@"#E8E8E8"];
    lineView.hidden = YES;
    [self addSubview:lineView];
    self.lineView = lineView;
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(1);
    }];
    
}

#pragma mark - 返回按钮的点击
//左侧按钮点击事件
- (void)backButtonClick:(UIButton *)btn {
    
    if (self.backBtnClickBlock) {
        self.backBtnClickBlock();
    }
}

///右侧按钮的点击事件
- (void)rightBtnClick:(UIButton *)btn {
    if (self.rightBtnClickBlock) {
        self.rightBtnClickBlock();
    }
}


#pragma mark - setter方法

-(void)setMessageButtonHidden:(BOOL)messageButtonHidden
{
    _messageButtonHidden = messageButtonHidden;
    if (_messageButtonHidden) {
        self.rightButton.hidden = YES;
    } else {
        self.rightButton.hidden = NO;
    }
}
/**
 是否隐藏底部线条
 */
- (void)setHasBootomLine:(BOOL)hasBootomLine {
    _hasBootomLine = hasBootomLine;
    
    if (hasBootomLine) {
        self.lineView.hidden = NO;
    }else {
        self.lineView.hidden = YES;
    }
}

-(void)setTitleColor:(UIColor *)titleColor
{
    _titleColor = titleColor;
    if (self.titleLabel) {
        self.titleLabel.textColor = titleColor;
    }
}



@end
