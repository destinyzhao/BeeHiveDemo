//
//  MineViewController.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "MineViewController.h"
#import "BHService.h"

@BeeHiveService(MineServiceProtocol, MineViewController)

@interface MineViewController ()<MineServiceProtocol>

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(UIButton *)sender {
    NSDictionary *dic = @{@"value":@"页面传值"};
    BHPageParam *params = [[BHPageParam alloc] initWithPageParams:dic callback:^(NSDictionary *callbackParams) {
        [self valueBlcok:@"登录成功"];
    }];
    
    BHStartPageAction *pageAction = [[BHStartPageAction alloc] initWithActionType:StartPageActionTypePresent isAnimation:YES];
    [BHRouteManager navigateToViewControllerWithProtocolName:@"LoginServiceProtocol" pageParam:params pageAction:pageAction];
}

- (void)valueBlcok:(NSString *)value
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"回传结果" message:value preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
