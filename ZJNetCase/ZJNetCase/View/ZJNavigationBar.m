//
//  ZJNavigationBar.m
//  ZJNetCase
//
//  Created by jyd on 15/6/22.
//  Copyright (c) 2015年 jyd. All rights reserved.
//

#import "ZJNavigationBar.h"

@implementation ZJNavigationBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) continue;
        
        if (button.centerX < self.width * 0.5) { // 左边的按钮
            button.x = 0;
        } else if (button.centerX > self.width * 0.5) { // 右边的按钮
            button.x = self.width - button.width;
        }
    }
}

@end
