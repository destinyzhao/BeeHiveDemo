//
//  DiscoveryViewController.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "BHService.h"

@BeeHiveService(DiscoverServiceProtocol, DiscoveryViewController)

@interface DiscoveryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation DiscoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.dataArray = @[@"PushViewController",@"PresentViewController"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self pushViewController];
            break;
            
        case 1:
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController];
            });
        }
            break;
            
        default:
            break;
    }
}

- (void)pushViewController
{
    /*
    id<DiscoverDetialServiceProtocol> detailViewController = [[BeeHive shareInstance] createService:@protocol(DiscoverDetialServiceProtocol)];
    if ([detailViewController isKindOfClass:[UIViewController class]]) {
        [detailViewController setTitleLabelText:@"Push 传值"];
        detailViewController.block = ^(NSString *value) {
            [self valueBlcok:value];
        };
        [self.navigationController pushViewController:(UIViewController *)detailViewController animated:YES];

    }
    */
    
    NSDictionary *dic = @{@"value":@"页面传值"};
    BHPageParam *params = [[BHPageParam alloc] initWithPageParams:dic callback:^(NSDictionary *callbackParams) {
        NSLog(@"🦁: %@", callbackParams);
        [self valueBlcok:[callbackParams objectForKey:@"value"]];
    }];
    
    [BHRouteManager navigateToToViewControllerWithProtocolName:@"DiscoverDetialServiceProtocol" pageParam:params];
    
}

- (void)presentViewController
{
    NSDictionary *dic = @{@"value":@"页面传值"};
    BHPageParam *params = [[BHPageParam alloc] initWithPageParams:dic callback:^(NSDictionary *callbackParams) {
        NSLog(@"🦁: %@", callbackParams);
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
