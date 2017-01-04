//
//  HTBaseViewController.m
//  happyRabbit
//
//  Created by Huatan on 16/5/9.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import "HTBaseViewController.h"
#import "HTBoardShareController.h"


typedef void(^DownloadRefursh)();


@interface HTBaseViewController ()

@property (nonatomic, copy) DownloadRefursh downloadRefursh;
@property (nonatomic,strong)HTMeetListModel * meetingListModel;
@end

@implementation HTBaseViewController

- (void)dealloc
{
    HTLog(@"base:已经被销毁");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HT_BackgroundColor;
    
    [HTReachabilityTool monitorCheckReachabilityStatusWithNotReachable:^{
        
        NSLog(@"0");
        
    } WiFiReachable:^{
        
        NSLog(@"1");
        
    } WWANReachable:^{
        
        NSLog(@"2");
        
    }];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self monitorCheckReachability];
    self.navigationController.navigationBarHidden = YES;
    
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}


/**
 *  Description 实时监听网络状态
 */
- (void)monitorCheckReachability
{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{

//                HTLog(@"无网络");
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
           
//                HTLog(@"WiFi网络");
                
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                
                
//                HTLog(@"移动网络");
                break;
            }
            default:
                break;
        }
    }];
}


- (void)downloadRefursh:(void (^)())downloadRefursh
{
    if (downloadRefursh) {
        self.downloadRefursh = downloadRefursh;
    }
}

/**
 *  Description 提示弹窗
 *
 *  @param message 提示信息
 */
- (void)setAlertViewWithMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    
//    /*title*/
//    NSMutableAttributedString *alertTitleStr = [[NSMutableAttributedString alloc] initWithString:@"提示"];
//    [alertTitleStr addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:22] range:NSMakeRange(0, 2)];
//    
//    [alert setValue:alertTitleStr forKey:@"attributedTitle"];
//    
//    
//    /*message*/
//    NSMutableAttributedString *alertMessageStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"\n%@", message]];
//    [alertMessageStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, message.length)];
//    
//    [alert setValue:alertMessageStr forKey:@"attributedMessage"];
    
    
    UIAlertAction *defaulAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:defaulAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}



//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
