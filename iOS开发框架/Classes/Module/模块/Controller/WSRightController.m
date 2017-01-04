
//
//  WSRightController.m
//  iOS开发框架
//
//  Created by aplple on 16/12/29.
//  Copyright © 2016年 huatan. All rights reserved.
//

#import "WSRightController.h"
#import "HTBaseViewController.h"
@interface WSRightController ()
@property (nonatomic,strong)NSMutableArray *buttonArr;
@property (nonatomic,strong)NSMutableArray *labelArr;
@end

@implementation WSRightController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createViewControlers];
    [self createTabBar];
    UIButton * button = [self.buttonArr firstObject];
    [self btnClik:button];
}
#pragma mrk -- 创建tabbar
- (void)createTabBar {
    self.tabBar.hidden = YES;
    UIImageView * tabBar = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbg"]];
    tabBar.frame = CGRectMake(0, WS_Screen_Height-49, WS_Screen_Width, 49);
    tabBar.userInteractionEnabled = YES;
    [self.view addSubview:tabBar];
    NSArray * titles = @[@"first",@"second",@"three",@"four"];
    CGFloat space = (WS_Screen_Width- 30*4)/5;
    self.buttonArr = [[NSMutableArray alloc]init];
    self.labelArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < titles.count; i++) {
        UIButton * button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        button.frame = CGRectMake(space+(30+space)*i, 2, 30, 30);
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_%d",i]] forState:(UIControlStateNormal)];
        [button setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"tab_c%d",i]] forState:(UIControlStateSelected)];
        button.tag = 101+i;
        [button addTarget:self action:@selector(btnClik:) forControlEvents:(UIControlEventTouchUpInside)];
        [tabBar addSubview:button];
        [self.buttonArr addObject:button];
        
        
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, 50, 14)];
        label.tag = 201+i;
        label.text = titles[i];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:14];
        CGPoint labelCenter = label.center;
        labelCenter.x = button.center.x;
        label.center = labelCenter;
        [tabBar addSubview:label];
        [self.labelArr addObject:label];
        
        
    }
}

- (void)btnClik:(UIButton *)btn {
    NSInteger index = btn.tag - 101;
    self.selectedIndex = index;
    btn.selected = YES;
    UILabel * label = self.labelArr[index];
    label.textColor = [UIColor orangeColor];
    for (UIButton * button in _buttonArr) {
        if (button.tag != btn.tag) {
            button.selected = NO;
        }
    }
    
    for (UILabel * lab in _labelArr) {
        if (label.tag != lab.tag) {
            lab.textColor = [UIColor lightGrayColor];
        }
    }
    
}
- (void)createViewControlers {
    NSArray * vc = @[@"WSFirstViewController",@"WSSecondViewController",@"WSThirdViewController",@"WSFourViewController"];
    NSMutableArray * vcs = [[NSMutableArray alloc]init];
    for (int i = 0; i < vc.count; i ++) {
        Class cls = NSClassFromString(vc[i]);
        HTBaseViewController * vc = [[cls alloc] init];
        [vcs addObject:vc];
    }
    self.viewControllers = vcs;
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
