//
//  BHPageParam.h
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PageCallback)(NSDictionary *callbackParams);

@interface BHPageParam : NSObject

- (instancetype)initWithPageParams:(NSDictionary *)params callback:(PageCallback)callback;

@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, copy) PageCallback callback;

@end
