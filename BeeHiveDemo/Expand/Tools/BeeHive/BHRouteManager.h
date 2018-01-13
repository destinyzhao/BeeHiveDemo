//
//  BHRouteManager.h
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BHPageParam.h"
#import "BHStartPageAction.h"
#import "BaseControllerServiceProtocol.h"

@interface BHRouteManager : NSObject

+ (void)setupWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions;


/**
 不传参数跳转

 @param protocolName 协议名
 */
+ (void)navigateToToViewControllerWithProtocolName:(NSString *)protocolName;


/**
 传参数跳转

 @param protocolName 协议名
 @param pageParam 页面需要传的参数
 */
+ (void)navigateToToViewControllerWithProtocolName:(NSString *)protocolName pageParam:(BHPageParam *)pageParam;


/**
 传参数以及说明跳转的方式(Push/Present)

 @param protocolName 协议名
 @param pageParam 参数
 @param pageAction 跳转方式
 */
+ (void)navigateToViewControllerWithProtocolName:(NSString *)protocolName pageParam:(BHPageParam *)pageParam pageAction:(BHStartPageAction *)pageAction;

@end
