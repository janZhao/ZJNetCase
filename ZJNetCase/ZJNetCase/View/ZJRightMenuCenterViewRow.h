//
//  ZJRightMenuCenterViewRow.h
//  ZJNetCase
//
//  Created by jyd on 15/7/10.
//  Copyright (c) 2015年 jyd. All rights reserved.
//  右边菜单控制器

#import <UIKit/UIKit.h>

@interface ZJRightMenuCenterViewRow : UIView
+ (instancetype)centerViewRow;

@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *title;
@end
