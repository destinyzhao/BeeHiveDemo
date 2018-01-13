//
//  BHStartPageAction.m
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import "BHStartPageAction.h"

@implementation BHStartPageAction

+ (BHStartPageAction *)defaultAction
{
    BHStartPageAction *action = [[BHStartPageAction alloc] initWithActionType:StartPageActionTypePush isAnimation:YES];
    return action;
}

- (instancetype)initWithActionType:(StartPageActionType)actionType isAnimation:(BOOL)animation
{
    self = [super init];
    if (self) {
        _actionType = actionType;
        _animation = animation;
    }
    return self;
}

@end
