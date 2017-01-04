//
//  HTNavigationViewController.m
//  happyRabbit
//
//  Created by Huatan on 16/5/5.
//  Copyright © 2016年 Huatan. All rights reserved.
//

#import "HTNavigationViewController.h"
@interface HTNavigationViewController ()

@end

@implementation HTNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationBar setTitleTextAttributes:
     
     
  @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],
    

    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
   
}
#pragma mark - 重写push方法

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [super pushViewController:viewController animated:animated];
  
    HTLog(@"%@", self.childViewControllers);
    
    [[HTAlertView createAlertView] setKeyWithController:NSStringFromClass([self.childViewControllers.lastObject class])];
    
    if (self.childViewControllers.count > 0) {
      
        //创建set按钮
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 0, 14, 24);
        [leftBtn setImage:[UIImage imageNamed:@"arrow_back"] forState:UIControlStateNormal];
        //添加方法
        [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *leftBarBtn = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
        viewController.navigationItem.leftBarButtonItem = leftBarBtn;
        
        viewController.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
        
    }
}


- (void)back{
    
    HTLog(@"%@", self.childViewControllers);
    
    [self popViewControllerAnimated:NO];
    
    HTLog(@"%@", self.childViewControllers);
    
    [[HTAlertView createAlertView] refreshCurrentViewWithController:NSStringFromClass([self.childViewControllers.lastObject class])];
    
}

#pragma mark - 检查网络连接状态
- (BOOL)checkReachability
{
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}


- (void)setAlertViewWithMessage:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:HT_POINT_OUT message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaulAction = [UIAlertAction actionWithTitle:HT_CONFIRM_TEXT style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    [alert addAction:defaulAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
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
