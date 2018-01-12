//
//  YDGiftAnimationView.h
//  SVGSDemo
//
//  Created by xuning on 2018/1/12.
//  Copyright © 2018年 xuning. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDGiftHeader.h"

@interface YDGiftAnimationView : UIImageView

@property (nonatomic, assign) int count;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, assign) int duration;

@property (nonatomic, assign) BOOL isShow;

- (void)animationImageName:(NSString *)imageName count:(int)count duration:(NSTimeInterval)duration;


@end
