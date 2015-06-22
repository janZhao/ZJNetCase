//
//  ZJLeftMenu.h
//  ZJNetCase
//
//  Created by jyd on 15/6/21.
//  Copyright (c) 2015年 jyd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZJLeftMenu;

@protocol ZJLeftMenuDelegate <NSObject>
@optional
- (void)leftMenu:(ZJLeftMenu *)menu didSelectedButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
@end

@interface ZJLeftMenu : UIView
@property (nonatomic, weak) id<ZJLeftMenuDelegate> delegate;
@end