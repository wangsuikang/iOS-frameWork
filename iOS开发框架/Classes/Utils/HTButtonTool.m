//
//  HTButtonTool.m
//  gxn_suyuan
//
//  Created by Huatan on 16/8/5.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import "HTButtonTool.h"

@implementation HTButtonTool

+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title tag:(NSInteger)tag font:(CGFloat)font target:(id)target action:(SEL)action backgroundColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = rect;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 10;
    button.tag = tag;
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.0f green:0.5f blue:1.0f alpha:1.0f] forState:UIControlStateNormal];
    [button setBackgroundColor:color];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


+ (UIButton *)buttonWithFrame:(CGRect)rect title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage font:(CGFloat)font target:(id)target action:(SEL)action backgroundColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = rect;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 0;
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundColor:color];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
 
    
    return button;
}

@end
