//
//  SetupTabBar.m
//  SISTabBar
//
//  Created by Destiny on 2017/6/20.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#import "SetupTabBar.h"
#import "BHService.h"
#import "SISNavigationController.h"

#import "DiscoveryViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@implementation SetupTabBar

+ (instancetype)sharedTabBar
{
    static SetupTabBar *_tabBar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _tabBar = [[SetupTabBar alloc]init];
    });
    return _tabBar;
}

- (NSMutableArray *)viewControllersArray
{
    if (!_viewControllersArray) {
        _viewControllersArray = [NSMutableArray array];
    }
    return _viewControllersArray;
}

/**
 *  添加所有的子控制器
 */
- (void)setupTabBarController:(UITabBarController *)tabbar
{
    id<DiscoverServiceProtocol> discoverViewController = [[BeeHive shareInstance] createService:@protocol(DiscoverServiceProtocol)];
    if ([discoverViewController isKindOfClass:[UIViewController class]]) {
        [self addOneChildVC:(UIViewController *)discoverViewController title:@"发现" imageName:@"tabbar_discover_n" selectedImageName:@"tabbar_discover_s"];
    }
    
    id<MessageServiceProtocol> messageViewController = [[BeeHive shareInstance] createService:@protocol(MessageServiceProtocol)];
    if ([messageViewController isKindOfClass:[UIViewController class]]) {
        [self addOneChildVC:(UIViewController *)messageViewController title:@"消息" imageName:@"tabbar_message_n" selectedImageName:@"tabbar_message_s"];
    }
    
    id<MineServiceProtocol> mineViewController = [[BeeHive shareInstance] createService:@protocol(MineServiceProtocol)];
    if ([mineViewController isKindOfClass:[UIViewController class]]) {
        [self addOneChildVC:(UIViewController *)mineViewController title:@"我的" imageName:@"tabbar_personal_n" selectedImageName:@"tabbar_personal_s"];
    }
    
    tabbar.viewControllers = self.viewControllersArray;
}


/**
 添加一个控制器
 
 @param childVc 子控制器对象
 @param title 标题
 @param imageName 图标
 @param selectedImageName 选中时的图标
 */
- (void)addOneChildVC:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    
    // 添加为tabbar控制器的子控制器
    SISNavigationController *nav = [[SISNavigationController alloc] initWithRootViewController:childVc];
    // 设置标题
    nav.tabBarItem.title = title;
    
    // 设置图标
    nav.tabBarItem.image = [UIImage imageNamed:imageName];
    
    // 设置选中的图标
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    // 不要渲染
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = selectedImage;
    
    [self.viewControllersArray addObject:nav];
}


@end
