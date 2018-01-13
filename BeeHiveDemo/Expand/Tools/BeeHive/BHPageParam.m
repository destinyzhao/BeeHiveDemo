//
//  BHPageParam.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "BHPageParam.h"

@implementation BHPageParam

- (instancetype)initWithPageParams:(NSDictionary *)params callback:(PageCallback)callback
{
    self = [super init];
    if (self) {
        _params = params;
        _callback = callback;
    }
    return self;
}

@end
