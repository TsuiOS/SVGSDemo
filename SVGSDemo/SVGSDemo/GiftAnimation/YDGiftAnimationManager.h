//
//  YDGiftAnimationManager.h
//  XingNLive
//
//  Created by xuning on 2017/11/14.
//  Copyright © 2017年 XingNLive&Mall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDGiftHeader.h"
@interface YDGiftAnimationManager : NSObject


+ (instancetype)sharedManager;

+ (void)attempDealloc;

- (void)addNextGift;

- (void)showInSuperView:(UIView *)superView giftInfo:(YDGiftInfoModel *)giftInfo;

@end
