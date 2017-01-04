//
//  HTBaseViewController.h
//  happyRabbit
//
//  Created by Huatan on 16/5/9.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HTBaseViewController : UIViewController


/**
 *  Description 提示弹窗
 *
 *  @param message 提示信息
 */
- (void)setAlertViewWithMessage:(NSString *)message;

/**
 *  Description 界面刷新回调
 *
 *  @param downloadComplted 传回参数
 */
- (void)downloadRefursh:(void(^)())downloadRefursh;


@end
