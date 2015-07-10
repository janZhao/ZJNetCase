//
//  ZJRightMenuCenterViewRow.h
//  ZJNetCase
//
//  Created by jyd on 15/7/10.
//  Copyright (c) 2015年 jyd. All rights reserved.
//  右边菜单控制器

#import "ZJRightMenuCenterViewRow.h"

@interface ZJRightMenuCenterViewRow()
@property (weak, nonatomic) IBOutlet UIButton *titleView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation ZJRightMenuCenterViewRow
+ (instancetype)centerViewRow
{
    return [[[NSBundle mainBundle] loadNibNamed:@"ZJRightMenuCenterViewRow" owner:nil options:nil] lastObject];
}

- (void)setIcon:(NSString *)icon
{
    _icon = [icon copy];
    
    self.iconView.image = [UIImage imageNamed:icon];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    
    [self.titleView setTitle:title forState:UIControlStateNormal];
}
@end
