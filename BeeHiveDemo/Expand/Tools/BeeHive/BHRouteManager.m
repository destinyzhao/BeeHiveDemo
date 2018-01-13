//
//  BHRouteManager.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "BHRouteManager.h"
#import "AppDelegate.h"

@interface BHRouteManager()

@property (nonatomic, strong) UINavigationController *rootNavigation;

@end

@implementation BHRouteManager

+ (BHRouteManager *)shareInstance
{
    static BHRouteManager *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BHRouteManager alloc] init];
    });
    
    return instance;
}

+ (void)setupWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions
{
    [BHContext shareInstance].env = BHEnvironmentDev;
    [BHContext shareInstance].application = application;
    [BHContext shareInstance].launchOptions = launchOptions;
//    [BHContext shareInstance].moduleConfigName = @"BeeHiveModuleDefine";
//    [BHContext shareInstance].serviceConfigName =  @"BeeHiveServiceDefine";
    [[BeeHive shareInstance] setContext:[BHContext shareInstance]];
}

+ (void)navigateToToViewControllerWithProtocolName:(NSString *)protocolName
{
    [self navigateToViewControllerWithProtocolName:protocolName pageParam:nil pageAction:nil];
}

+ (void)navigateToToViewControllerWithProtocolName:(NSString *)protocolName pageParam:(BHPageParam *)pageParam
{
    [self navigateToViewControllerWithProtocolName:protocolName pageParam:pageParam pageAction:nil];
}

+ (void)navigateToViewControllerWithProtocolName:(NSString *)protocolName pageParam:(BHPageParam *)pageParam pageAction:(BHStartPageAction *)pageAction
{
    if (protocolName) {
        
        Protocol *protocol = NSProtocolFromString(protocolName);
        
        id<BaseControllerServiceProtocol> page = [[BeeHive shareInstance] createService:protocol];
        
        if (page) {
            
            page.pageParam = pageParam;
            
            if (!pageAction) {
                pageAction = [BHStartPageAction defaultAction];
            }
            
            switch (pageAction.actionType) {
                    
                case StartPageActionTypePush:
                {
                    [[UIWindow getCurrentViewController].navigationController pushViewController:(BaseViewController *)page animated:pageAction.animation];
                }
                    break;
                    
                case StartPageActionTypePresent:
                {
                    SISNavigationController *navi = [[SISNavigationController alloc]initWithRootViewController:(BaseViewController *)page];
                    
                    [[UIWindow getCurrentViewController] presentViewController:navi animated:NO completion:nil];
                }
                    break;
                    
                default:
                    break;
            }
            
        }else{
            NSLog(@"cat not find page define at PageRouteDefine.plist");
        }
    }
}


@end
