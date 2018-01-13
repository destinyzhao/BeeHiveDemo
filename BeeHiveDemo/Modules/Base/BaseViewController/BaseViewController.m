//
//  BaseViewController.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize pageParam = _pageParam;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
   
    if (self.navigationController.childViewControllers.count > 1) {
        [self initCustomNavigationItem];
    }
    else if (self.presentingViewController){
        [self initCustomNavigationItem];
    }
//    else if ([self isKindOfClass:NSClassFromString(@"LoginViewController")]){
//        [self initCustomNavigationItem];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  自定义返回按钮
 */
- (void)initCustomNavigationItem
{
     if (!self.navigationItem.leftBarButtonItem) {
         UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navi_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onGoBack:)];
         leftItem.tintColor = [UIColor getColorWithHexString:@"757475"];
         leftItem.title = @"返回";
         self.navigationItem.leftBarButtonItem = leftItem;
     }
}

/**
 *  返回按钮点击事件
 */
- (void)onGoBack:(UIButton *)sender {
    if (self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
