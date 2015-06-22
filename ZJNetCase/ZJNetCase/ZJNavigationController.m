//
//  ZJNavigationController.m
//  ZJNetCase
//
//  Created by jyd on 15/6/21.
//  Copyright (c) 2015年 jyd. All rights reserved.
//

#import "ZJNavigationController.h"
#import "ZJNavigationBar.h"

@interface ZJNavigationController ()

@end

@implementation ZJNavigationController

+ (void)initialize
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    // 设置导航栏背景
    [appearance setBackgroundImage:[UIImage imageNamed:@"top_navigation_background"] forBarMetrics:UIBarMetricsDefault];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setValue:[[ZJNavigationBar alloc]init] forKey:@"navigationBar"];
}

#pragma mark - 这个方法也是专门用来布局子控件（当控制器的view尺寸发生改变的时候会调用）
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//
//    for (UIButton *button in self.navigationBar.subviews) {
//        if (![button isKindOfClass:[UIButton class]]) continue;
//
//        if (button.centerX < self.navigationBar.width * 0.5) { // 左边的按钮
//            button.x = 0;
//        } else if (button.centerX > self.navigationBar.width * 0.5) { // 右边的按钮
//            button.x = self.view.width - button.width;
//        }
//    }
//}

@end
