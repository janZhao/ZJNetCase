//
//  ViewController.m
//  ZJNetCase
//
//  Created by jyd on 15/6/21.
//  Copyright (c) 2015年 jyd. All rights reserved.
//

#import "ViewController.h"
#import "ZJNavigationController.h"
#import "ZJLeftMenu.h"
#import "ZJTitleView.h"
#import "ZJReadingViewController.h"
#import "ZJNewsViewController.h"
#import "ZJRightMenuController.h"
#import "ZJRightMenuCenterViewRow.h"

#define ZJCoverTag 100
#define ZJLeftMenuW 150
#define ZJLeftMenuH 300
#define ZJLeftMenuY 50

@interface ViewController ()<ZJLeftMenuDelegate>

/**
 *  正在显示的导航控制器
 */
@property (nonatomic, weak) ZJNavigationController *showingNavigationController;
@property (weak, nonatomic) IBOutlet UIImageView *side_bg;

@property (nonatomic, weak) ZJLeftMenu *leftMenu;
@property (nonatomic, strong) ZJRightMenuController *rightMenuVc;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.创建子控制器
    // 1.1.新闻控制器
    ZJNewsViewController *news = [[ZJNewsViewController alloc] init];
    [self setupVc:news title:@"新闻"];
    
    // 1.2.订阅控制器
    ZJReadingViewController *reading = [[ZJReadingViewController alloc] init];
    [self setupVc:reading title:@"订阅"];
    
    // 1.3.图片控制器
    UIViewController *photo = [[UIViewController alloc] init];
    [self setupVc:photo title:@"图片"];
    
    // 1.4.视频控制器
    UIViewController *video = [[UIViewController alloc] init];
    [self setupVc:video title:@"视频"];
    
    // 1.5.跟帖控制器
    UIViewController *comment = [[UIViewController alloc] init];
    [self setupVc:comment title:@"跟帖"];
    
    // 1.6.电台控制器
    UIViewController *radio = [[UIViewController alloc] init];
    [self setupVc:radio title:@"电台"];
    
    // 2.添加左菜单
    ZJLeftMenu *leftMenu = [[ZJLeftMenu alloc] init];
    leftMenu.delegate = self;
    leftMenu.height = 300;
    leftMenu.width = 200;
    leftMenu.y = 60;
    self.leftMenu = leftMenu;
    [self.view insertSubview:leftMenu atIndex:1];
    
    // 3.添加右菜单
    [self setupRightMenu];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

/**
 *  添加右菜单
 */
- (void)setupRightMenu
{
    ZJRightMenuController *rightMenuVc = [[ZJRightMenuController alloc] init];
    rightMenuVc.view.x = self.view.width - rightMenuVc.view.width;
    [self.view insertSubview:rightMenuVc.view atIndex:1];
    self.rightMenuVc = rightMenuVc;
}

/**
 *  初始化一个控制器
 *
 *  @param vc      需要初始化的控制器
 *  @param title   控制器的标题
 */
- (void)setupVc:(UIViewController *)vc title:(NSString *)title
{
    // 1.设置背景色
    vc.view.backgroundColor = JYDRandomColor;
    
    // 2.设置标题
    ZJTitleView *titleView = [[ZJTitleView alloc] init];
    titleView.title = title;
    vc.navigationItem.titleView = titleView;
    
    // 3.设置左右按钮
    vc.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_menuicon" target:self action:@selector(leftMenuClick)];
    vc.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"top_navigation_infoicon" target:self action:@selector(rightMenuClick)];
    
    // 4.包装一个导航控制器
    ZJNavigationController *nav = [[ZJNavigationController alloc] initWithRootViewController:vc];
    
    // 让nav成为self（ViewController）的子控制器，能保证：self在，nav就在
    // 如果两个控制器互为父子关系，那么它们的view也应该互为父子关系
    [self addChildViewController:nav];
}

#pragma mark - 监听导航栏按钮点击

- (void)leftMenuClick
{
    JYDLog(@"leftMenuClick---");
    self.leftMenu.hidden = NO;
    self.rightMenuVc.view.hidden = YES;
    
    [UIView animateWithDuration:0.25 animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * 60;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        // 菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = 200 - leftMenuMargin;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = topMargin - 60;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移(在缩放的基础上平移、所以要 / scale)
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, -translateY / scale);
        
        showingView.transform = translateForm;
        
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        cover.tag = 1000;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    }];
}

- (void)coverClick:(UIView *)cover
{
    [UIView animateWithDuration:0.25 animations:^{
        self.showingNavigationController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [cover removeFromSuperview];
    }];
}

- (void)rightMenuClick
{
    JYDLog(@"rightMenuClick");
    self.leftMenu.hidden = YES;
    self.rightMenuVc.view.hidden = NO;
    
    [UIView animateWithDuration:0.25 animations:^{
        // 取出正在显示的导航控制器的view
        UIView *showingView = self.showingNavigationController.view;
        
        // 缩放比例
        CGFloat navH = [UIScreen mainScreen].bounds.size.height - 2 * ZJLeftMenuY;
        CGFloat scale = navH / [UIScreen mainScreen].bounds.size.height;
        
        // 菜单左边的间距
        CGFloat leftMenuMargin = [UIScreen mainScreen].bounds.size.width * (1 - scale) * 0.5;
        CGFloat translateX = leftMenuMargin - self.rightMenuVc.view.width;
        
        CGFloat topMargin = [UIScreen mainScreen].bounds.size.height * (1 - scale) * 0.5;
        CGFloat translateY = ZJLeftMenuY - topMargin;
        
        // 缩放
        CGAffineTransform scaleForm = CGAffineTransformMakeScale(scale, scale);
        // 平移
        CGAffineTransform translateForm = CGAffineTransformTranslate(scaleForm, translateX / scale, translateY / scale);
        
        showingView.transform = translateForm;
        
        // 添加一个遮盖
        UIButton *cover = [[UIButton alloc] init];
        cover.tag = ZJCoverTag;
        [cover addTarget:self action:@selector(coverClick:) forControlEvents:UIControlEventTouchUpInside];
        cover.frame = showingView.bounds;
        [showingView addSubview:cover];
    } completion:^(BOOL finished) {
        [self.rightMenuVc didShow];
    }];
}

#pragma mark - ZJLeftMenuDelegate
- (void)leftMenu:(ZJLeftMenu *)menu didSelectedButtonFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex
{
    // 0.移除旧控制器的view
    ZJNavigationController *oldNav = self.childViewControllers[fromIndex];
    [oldNav.view removeFromSuperview];
    
    // 1.显示新控制器的view
    ZJNavigationController *newNav = self.childViewControllers[toIndex];
    [self.view addSubview:newNav.view];
    
    // 设置新控制的transform跟旧控制器一样
    newNav.view.transform = oldNav.view.transform;
    // 设置阴影
    newNav.view.layer.shadowColor = [UIColor blackColor].CGColor;
    newNav.view.layer.shadowOffset = CGSizeMake(-3, 0);
    newNav.view.layer.shadowOpacity = 0.2;

    
    // 2.设置当前正在显示的控制器
    self.showingNavigationController = newNav;
    
    // 3.清空transform
    [UIView animateWithDuration:0.25 animations:^{
        newNav.view.transform = CGAffineTransformIdentity;
    }];
    
    // 3.点击遮盖
    [self coverClick:[newNav.view viewWithTag:1000]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
