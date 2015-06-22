//
//  UIBarButtonItem+JYDExtension.m
//  ZJNetCase
//
//  Created by jyd on 15/6/21.
//  Copyright (c) 2015年 jyd. All rights reserved.
//

#import "UIBarButtonItem+JYDExtension.h"

@implementation UIBarButtonItem (JYDExtension)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action
{
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    // 设置按钮的尺寸为背景图片的尺寸
    button.size = button.currentBackgroundImage.size;
    
    // 监听按钮点击
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

@end
