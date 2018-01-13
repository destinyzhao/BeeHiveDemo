//
//  LoginViewController.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/12.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "LoginViewController.h"
#import "BHService.h"

@BeeHiveService(LoginServiceProtocol, LoginViewController)

@interface LoginViewController ()<LoginServiceProtocol>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup
{
    self.title = @"登录";
}

- (IBAction)login:(UIButton *)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    if(self.pageParam.callback){
        self.pageParam.callback(@{});
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
