//
//  DiscoveryDetailViewController.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "DiscoveryDetailViewController.h"
#import "BHService.h"

@BeeHiveService(DiscoverDetialServiceProtocol, DiscoveryDetailViewController)

@interface DiscoveryDetailViewController ()<DiscoverDetialServiceProtocol>

@property (weak, nonatomic) IBOutlet UILabel *valuelbl;

@end

@implementation DiscoveryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    BHPageParam *pageParmas = self.pageParam;
    self.valuelbl.text = [pageParmas.params objectForKey:@"value"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setValueStr:(NSString *)valueStr
{
    self.valuelbl.text = valueStr;
}

- (IBAction)callBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    BHPageParam *pageParmas = self.pageParam;
    if (pageParmas.callback) {
        pageParmas.callback(@{@"value":@"我是从详情页面传过来的"});
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
