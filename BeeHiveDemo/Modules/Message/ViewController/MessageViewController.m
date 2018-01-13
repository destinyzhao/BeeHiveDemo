//
//  MessageViewController.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "MessageViewController.h"
#import "BHService.h"

@BeeHiveService(MessageServiceProtocol, MessageViewController)

@interface MessageViewController ()<MessageServiceProtocol>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
