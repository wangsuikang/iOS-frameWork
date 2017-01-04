//
//  HTToolManager.h
//  MeetingmeVideo
//
//  Created by aplple on 16/8/4.
//  Copyright © 2016年 huatan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HTToolManager : NSObject


+(void) doZipAtPath:(NSString*)sourcePath to:(NSString*)destZipFile;
+(NSString * )createMeetDocPath:(NSString *)eventId :(BOOL)isNote;
+ (NSArray *)getMeetDocContentArry:(NSString *)eventId :(BOOL)isNote;
+(BOOL)MeetDocisContent:(NSString *)eventId :(BOOL)isNote;
+(NSString * )createPageDic;
+ (void)setAlertViewWithTitle:(NSString *)title message:(NSString *)message;


/**
 *  Description 定时消失提示框
 *
 *  @param massager   提示信息
 *  @param controller 控制器
 */
+ (void)showAlertViewWithMessage:(NSString *)message Controller:(UIViewController *)controller;


+ (void)showMessage:(NSString *)message parent:(UIViewController *)parentController Finished:(void(^)(void))finished;


+ (void)showAlertView:(NSString *)title withMessage:(NSString *)message parent:(UIViewController *)parentController ConfirmFinished:(void(^)(void))finished cancelBlock:(void(^)(void))cancelBlock;


+ (void)showDestructiveAlertView:(NSString *)title withMessage:(NSString *)message parent:(UIViewController *)parentController DefaultBlock:(void(^)())defaultBlock DestructiveBlock:(void(^)())destructiveBlock cancelBlock:(void(^)())cancelBlock;

@end
