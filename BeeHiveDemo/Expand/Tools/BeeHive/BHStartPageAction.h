//
//  BHStartPageAction.h
//  BeeHiveDemo
//
//  Created by Destiny on 2018/1/11.
//  Copyright © 2018年 Destiny. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, StartPageActionType)
{
    StartPageActionTypePush,
    StartPageActionTypePresent
};

@interface BHStartPageAction : NSObject

+ (BHStartPageAction *)defaultAction;

- (instancetype)initWithActionType:(StartPageActionType)actionType isAnimation:(BOOL)animation;

@property (nonatomic,assign, readonly) StartPageActionType actionType;
@property (nonatomic,assign, readonly) BOOL animation;

@end
