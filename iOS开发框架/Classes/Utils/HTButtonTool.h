//
//  HTButtonTool.h
//  gxn_suyuan
//
//  Created by Huatan on 16/8/5.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 *  Description 自定义Button工具
 */
@interface HTButtonTool : NSObject

/**
 *  Description 初始化button方法
 *
 *  @param rect   控件大小
 *  @param title  标题
 *  @param tag    tag
 *  @param font   文字大小
 *  @param target target
 *  @param action 点击方法
 *  @param color  颜色
 *
 *  @return button
 */
+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title tag:(NSInteger)tag font:(CGFloat)font target:(id)target action:(SEL)action backgroundColor:(UIColor *)color;


/**
 *  Description 初始化button方法
 *
 *  @param rect        控件大小
 *  @param title       标题
 *  @param image       正常图片
 *  @param selectImage 点击图片
 *  @param font        文字大小
 *  @param target      target
 *  @param action      点击方法
 *  @param color       颜色
 *
 *  @return button
 */
+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage font:(CGFloat)font target:(id)target action:(SEL)action backgroundColor:(UIColor *)color;

@end
