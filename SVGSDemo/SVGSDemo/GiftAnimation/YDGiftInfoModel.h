//
//  YDGiftInfoModel.h
//  SVGSDemo
//
//  Created by xuning on 2018/1/12.
//  Copyright © 2018年 xuning. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YDGiftInfoModel : NSObject

// 图片名
@property (nonatomic, copy) NSString *imageName;

// 总帧数
@property (nonatomic, assign) int count;

- (instancetype)initWithImageName:(NSString *)imageName count:(int)count;

@end
