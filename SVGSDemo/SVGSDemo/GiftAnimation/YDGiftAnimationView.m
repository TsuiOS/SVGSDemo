//
//  YDGiftAnimationView.m
//  SVGSDemo
//
//  Created by xuning on 2018/1/12.
//  Copyright © 2018年 xuning. All rights reserved.
//

#import "YDGiftAnimationView.h"


@interface YDGiftAnimationView()

@property (nonatomic, assign) int i;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation YDGiftAnimationView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
    }
    return self;
}

/**
 每个view都有这个方法，用来处理用户的操作事件。
 @return 它返回：self，代表这个view会接受用户的操作事件，返回：nil，则代表这个view不会接受用户的操作事件。
 */

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    return nil;
}


- (void)animationImageName:(NSString *)imageName count:(int)count duration:(NSTimeInterval)duration {
    
    self.imageName = imageName;
    self.count = count;
    self.duration = duration;
    self.i = -1;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(setPlaneScrewImages) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)setPlaneScrewImages {
    
    self.i++;
    NSString *imageName = [NSString stringWithFormat:SUB_RESOURCE,self.imageName,self.imageName,_i];
    
    self.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:imageName ofType:@"png"]];
    if (self.i == self.count) {
        [self.timer invalidate];
        self.timer = nil;
        [self removeFromSuperview];
        self.isShow = NO;
        [[YDGiftAnimationManager sharedManager] addNextGift];
        NSLog(@"%@",self.timer);
    }
    
}



@end
