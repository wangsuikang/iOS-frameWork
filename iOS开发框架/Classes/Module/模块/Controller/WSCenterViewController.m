//
//  WSCenterViewController.m
//  iOS开发框架
//
//  Created by aplple on 16/12/29.
//  Copyright © 2016年 huatan. All rights reserved.
//

#import "WSCenterViewController.h"

@interface WSCenterViewController ()

@end

@implementation WSCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationItemConfig];

}
- (void)navigationItemConfig {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar"] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"bi_chapters_img2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:(UIBarButtonItemStyleDone) target:self action:@selector(itemClick:)];
    UIBarButtonItem * searchItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"search"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal ] style:(UIBarButtonItemStyleDone) target:self action:@selector(itemClick:)];
    UIBarButtonItem * detailItem = [[UIBarButtonItem alloc]initWithTitle:@"书城" style:(UIBarButtonItemStyleDone) target:self action:@selector(itemClick:)];
    leftItem.tag = 101;
    searchItem.tag = 102;
    detailItem.tag = 103;
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItems = @[detailItem,searchItem];
    self.navigationItem.title = @"我的书架";
}

- (void)itemClick: (UIBarButtonItem *)item {
    switch (item.tag) {
        case 101:
        {
            [self.drawerController toggleDrawerSide:(MMDrawerSideLeft) animated:YES completion:nil];
            
        }
            break;
        case 102:
        {
            
        }
            break;
        case 103:
        {
            [self.drawerController toggleDrawerSide:(MMDrawerSideRight) animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
    
    
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
