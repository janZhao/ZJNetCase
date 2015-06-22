//
//  ZJAdViewController.m
//  ZJNetCase
//
//  Created by jyd on 15/6/22.
//  Copyright (c) 2015年 jyd. All rights reserved.
//

#import "ZJAdViewController.h"

@interface ZJAdViewController ()

@end

@implementation ZJAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.背景图片
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Default.png"]];
    bg.frame = self.view.bounds;
    [self.view addSubview:bg];
    
    // 2.广告图片(真实的广告图片应该要先下载广告图片)
    UIImageView *ad = [[UIImageView alloc] init];
    ad.image = [UIImage imageNamed:@"ad"];
    ad.width = 280;
    ad.height = 300;
    ad.centerX = self.view.width * 0.5;
    ad.y = 60;
    [self.view addSubview:ad];
    
    // 2s后调到主界面
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow *keywindow = [UIApplication sharedApplication].keyWindow;
        keywindow.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Main"];
    });

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
