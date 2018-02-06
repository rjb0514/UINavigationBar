//
//  UserDefinedNavBar.h
//  UINavigationBarDemo
//
//  Created by ru on 2018/2/6.
//  Copyright © 2018年 GMJK. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^BarBlock)(void);

/** 自定义导航 */
@interface UserDefinedNavBar : UIView

/**
 初始化方法 右侧为图片
 @param backImageStr 返回按钮图片
 @param titleString title文字
 @param rightBtnImageStr 右侧按钮图片
 @return id
 */
- (instancetype)initWithBackButtonImageStr:(NSString *)backImageStr navTitleName:(NSString *)titleString rightBtnImageStr:(NSString *)rightBtnImageStr;

/**
 初始化方法  title为图片 右侧为图片
 @param backImageStr 返回按钮图片
 @param imageString title为图片
 @param rightBtnImageStr 右侧按钮图片
 @return id
 */
- (instancetype)initWithBackButtonImageStr:(NSString *)backImageStr navTitleImageName:(NSString *)imageString rightBtnImageStr:(NSString *)rightBtnImageStr;


/**
 返回按钮的点击事件回调
 */
@property (nonatomic, copy) BarBlock backBtnClickBlock;
/**
 右侧按钮的点击事件回调
 */
@property (nonatomic, copy) BarBlock rightBtnClickBlock;

/**
 标题文字的颜色
 */
@property (nonatomic ,strong) UIColor * titleColor;
/**
 是否有底部线条
 */
@property (nonatomic, assign) BOOL hasBootomLine;

/**
 右侧消息按钮隐藏
 */
@property (nonatomic, assign) BOOL messageButtonHidden;
/**
 titelLabel
 */
@property (nonatomic ,strong) UILabel * titleLabel;

@end
