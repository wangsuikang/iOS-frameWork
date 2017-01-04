
//
//  WSRightController.m
//  iOS开发框架
//
//  Created by aplple on 16/12/29.
//  Copyright © 2016年 huatan. All rights reserved.
//

#import "WSRightController.h"

@interface WSRightController ()

@end

@implementation WSRightController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
    
  
}
#pragma mrk -- 创建tabbar
- (void)createTabBar {
    self.tabBar.hidden = YES;
    UIImageView * tabBar = [UIImageView alloc]initWithImage:[UIImage imageNamed:@""];
    tabBar.frame = CGRectMake(0, 0, <#CGFloat width#>, <#CGFloat height#>)




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
