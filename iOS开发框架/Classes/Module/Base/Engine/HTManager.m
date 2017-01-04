//
//  HTManager.m
//  happyRabbit
//
//  Created by Huatan on 16/5/20.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import "HTManager.h"

@implementation HTManager

/**
 *  Description 获取当前网络状态
 *
 *  @return YES :正常， NO :断开
 */
//- (BOOL)checkReachability
//{
//    return [[AFNetworkReachabilityManager sharedManager] isReachable];
//}


- (NSString *)getInfoPathString {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES)firstObject];
    NSString *filename = [path stringByAppendingPathComponent:@"personalInfo.plist"];
    return filename;
}

- (void)sendDeviceTokenWithDic:(NSDictionary *)dic Account:(NSString *)account Password:(NSString *)password
{
#if 0
    NSMutableDictionary * dict = [NSMutableDictionary dictionaryWithContentsOfFile:[self getInfoPathString]];

        [dict removeAllObjects];
        [dict writeToFile:[self getInfoPathString]atomically:YES];
    
    
    HTLoginUserModel *model = [HTLoginUserModel yy_modelWithDictionary:[dic getNetworkResponseJson]];
    
    
    [[HTLoginUser sharedLoginUser] setLoginUserId:model.uid];
    [[HTLoginUser sharedLoginUser] setLoginUserBranchId:model.branchId];
    [[HTLoginUser sharedLoginUser] setLoginUserAccount:account];
    [[HTLoginUser sharedLoginUser] setLoginUserPassword:password];
    [[HTLoginUser sharedLoginUser] setLoginUserStatus:YES];


    NSString *jpushAlias = nil;
    
    if (isiPhone) {
        
        jpushAlias = [NSString stringWithFormat:@"%@%@", APP_JPUSH_ALIAS_IPHONE, [[HTLoginUser sharedLoginUser] getLoginUserId]];
        
    }else if (isiPad) {
        jpushAlias = [NSString stringWithFormat:@"%@%@", APP_JPUSH_ALIAS_IPAD, [[HTLoginUser sharedLoginUser] getLoginUserId]];
    }
   
    
    
    NSSet *setTags = [NSSet setWithObjects:[[HTLoginUser sharedLoginUser] getLoginUserBranchId], nil];
    
    
    [JPUSHService setTags:setTags alias:jpushAlias fetchCompletionHandle:^(int iResCode, NSSet *iTags, NSString *iAlias) {
        
        HTLog(@"rescode: %d, \ntags: %@, \nalias: %@\n", iResCode, iTags, iAlias);
  
    }];
    
    HTUpdateUserDeviceTokenApi *deviceTokenApi = [[HTUpdateUserDeviceTokenApi alloc]initWithDeviceToken:jpushAlias userId:[[HTLoginUser sharedLoginUser] getLoginUserId]];
    
    [deviceTokenApi startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest *request) {
        
        NSDictionary *dic = [request.responseData jSONObjectToDic];
        
        HTLog(@"%@", [dic getNetworkResponseMsg]);
        
        HTLog(@"%@", dic);
        
    } failure:^(__kindof YTKBaseRequest *request) {
        
    }];
#endif
}

@end
