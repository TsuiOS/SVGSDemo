//
//  YDGiftInfoModel.m
//  SVGSDemo
//
//  Created by xuning on 2018/1/12.
//  Copyright © 2018年 xuning. All rights reserved.
//

#import "YDGiftInfoModel.h"

@implementation YDGiftInfoModel

- (instancetype)initWithImageName:(NSString *)imageName count:(int)count {
    if (self = [super init]) {
        self.imageName = imageName;
        self.count = count;
    }
    return self;
}

@end
