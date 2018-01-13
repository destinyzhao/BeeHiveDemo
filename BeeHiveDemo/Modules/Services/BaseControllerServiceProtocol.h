//
//  BaseControllerServiceProtocol.h
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "BHServiceProtocol.h"
#import "BHPageParam.h"

@protocol BaseControllerServiceProtocol <NSObject,BHServiceProtocol>

@property (nonatomic, strong) BHPageParam *pageParam;

@end
