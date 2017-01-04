//
//  HTManager.h
//  happyRabbit
//
//  Created by Huatan on 16/5/20.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTManager : NSObject

/**
 *  Description 获取当前网络状态
 *
 *  @return YES :正常， NO :断开
 */
- (BOOL)checkReachability;

- (void)sendDeviceTokenWithDic:(NSDictionary *)dic Account:(NSString *)account Password:(NSString *)password;

@end
