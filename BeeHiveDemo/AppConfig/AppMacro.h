//
//  AppMacro.h
//  topkid-app-ios-customer
//
//  Created by Destiny on 2017/8/11.
//  Copyright © 2017年 Destiny. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h
#import <UIKit/UIKit.h>
// 完成回调Block
typedef void (^Complete)(void);
typedef void (^CompletionBlock)(NSDictionary *dict);
// 成功回调Block
typedef void (^SuccessBlock)(id result);
// 失败回调Block
typedef void (^FailedBlock)(NSError *error);
// 失败回调Block
typedef void (^Failed)(void);
//登录结果回调
typedef void (^LoginResultBlock)(BOOL success);

#pragma mark - ===================获取分辨率=====================

// iphone 4s
#define isScreen640x960 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
// iphone 5s
#define isScreen640x1136 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
// iphone 6,7,8
#define isScreen750x1334 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
// iphone plus
#define isIphonePlus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
// iphonex
#define isIphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#pragma mark - ===================获取设备大小=====================
//获取屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
//获取屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
// 适配iPhone x TabBar 底栏高度
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
// 适配iPhone x 导航栏高度
#define NavigationBarHeight ([[UIApplication sharedApplication]statusBarFrame].size.height>20?88:64)
// 状态栏高度
#define StatusBarHeight ([[UIApplication sharedApplication]statusBarFrame].size.height)


#pragma mark - ===================系统版本========================
//当前设备系统版本号
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#pragma mark - ===================AppDelegate========================
// 获取AppDelegate
#define appDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

#pragma mark - ===================UIImage图片=====================
//读取本地图片
#define LoadImage(file,type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:file ofType:type]]

//定义UIImage对象
#define ImageNamed(imageName) [UIImage imageNamed:imageName]

// weakSelf
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 版本名称
#define VER_NAME [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 获取主线程
#define GCD_MAIN(block)             dispatch_async(dispatch_get_main_queue(), block)


#endif /* AppMacro_h */
