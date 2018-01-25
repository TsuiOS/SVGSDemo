//
//  YDGiftAnimationManager.m
//  XingNLive
//
//  Created by xuning on 2017/11/14.
//  Copyright © 2017年 XingNLive&Mall. All rights reserved.
//

#import "YDGiftAnimationManager.h"


@interface YDGiftAnimationManager ()

@property (nonatomic, strong) UIView *superViews;


@property (nonatomic, strong) NSMutableArray *grounderArray;
@property (nonatomic, strong) NSMutableArray *modelArray;


@end


@implementation YDGiftAnimationManager

static dispatch_once_t onceToken;
static YDGiftAnimationManager *instance;

+ (instancetype)sharedManager {
    
    dispatch_once(&onceToken, ^{
        instance = [[YDGiftAnimationManager alloc] init];
        instance.grounderArray = [[NSMutableArray alloc] init];
        instance.modelArray = [[NSMutableArray alloc] init];
        YDGiftAnimationView *animation = [[YDGiftAnimationView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        animation.isShow = NO;
        [instance.grounderArray addObject:animation];
    });
    return instance;
}
- (void)showInSuperView:(UIView *)superView giftInfo:(YDGiftInfoModel *)giftInfo {

    YDGiftAnimationManager *instance = [YDGiftAnimationManager sharedManager];
    instance.superViews = superView;
    [instance.modelArray addObject:giftInfo];
    [self addNextGift];
}



- (void)addNextGift {
    
    YDGiftAnimationManager *instance = [YDGiftAnimationManager sharedManager];
    NSLog(@"==========数组长度%zd",instance.modelArray.count);
    if (kArrayIsEmpty(instance.modelArray)) {
        [YDGiftAnimationManager attempDealloc];
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        for (YDGiftAnimationView *animationView in instance.grounderArray) {
            if (animationView.isShow == NO) {
                YDGiftInfoModel *model = instance.modelArray.firstObject;
                animationView.isShow = YES;
                [animationView animationImageName:model.imageName count:model.count duration:3];
                [instance.superViews addSubview:animationView];
                [instance.modelArray removeObjectAtIndex:0];
            }
        }
    });
}

+ (void)attempDealloc {
    instance.grounderArray = nil;
    instance.modelArray = nil;
    onceToken = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    instance = nil;

}
@end
