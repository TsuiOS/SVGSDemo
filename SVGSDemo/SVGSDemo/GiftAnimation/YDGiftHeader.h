//
//  YDGiftHeader.h
//  SVGSDemo
//
//  Created by xuning on 2018/1/12.
//  Copyright © 2018年 xuning. All rights reserved.
//

#ifndef YDGiftHeader_h
#define YDGiftHeader_h

#import "YDGiftInfoModel.h"
#import "YDGiftAnimationManager.h"
#import "YDGiftAnimationView.h"

#define RESOURCE @"Ani.bundle/%@"

#define SUB_RESOURCE @"Ani.bundle/%@/%@_%05d"

#define XNLBounds [UIScreen mainScreen].bounds

// 数组是否为空
#define kArrayIsEmpty(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)

#endif /* YDGiftHeader_h */
