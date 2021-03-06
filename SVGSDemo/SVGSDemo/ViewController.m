//
//  ViewController.m
//  SVGSDemo
//
//  Created by xuning on 2018/1/9.
//  Copyright © 2018年 xuning. All rights reserved.
//

#import "ViewController.h"
#import <SVGA.h>
#import "YDGiftHeader.h"

@interface ViewController ()<SVGAPlayerDelegate>
@property (nonatomic, strong) SVGAPlayer *aPlayer;
@end

static SVGAParser *parser;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.aPlayer];
    self.aPlayer.delegate = self;
    self.aPlayer.frame = CGRectMake(0, 0, 320, 320);
    self.aPlayer.loops = 0;
    self.aPlayer.clearsAfterStop = YES;
    parser = [[SVGAParser alloc] init];
//    [self onChange:nil];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 20, 200, 44)];
    [button setTitle:@"随机一个动画" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.aPlayer.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}

// 帧动画
- (IBAction)onChange:(id)sender {
    
    YDGiftInfoModel *model = [[YDGiftInfoModel alloc]initWithImageName:@"bizui" count:20];
    [[YDGiftAnimationManager sharedManager] showInSuperView:self.view giftInfo:model];
    
    
}


// SVGA动画
//- (IBAction)onChange:(id)sender {

    // 加载URL
//    NSArray *items = @[
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/EmptyState.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/HamburgerArrow.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/PinJump.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/TwitterHeart.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/Walkthrough.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/angel.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/halloween.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/kingset.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/posche.svga?raw=true",
//                       @"https://github.com/yyued/SVGA-Samples/blob/master/rose.svga?raw=true",
//                       ];
//    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    [parser parseWithURL:[NSURL URLWithString:items[arc4random() % 10]]
//         completionBlock:^(SVGAVideoEntity * _Nullable videoItem) {
//             [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//             if (videoItem != nil) {
//                 self.aPlayer.videoItem = videoItem;
//                 [self.aPlayer startAnimation];
//             }
//         } failureBlock:nil];

    
//    // 加载本地路径
//    [parser parseWithNamed:@"kingset" inBundle:[NSBundle mainBundle] completionBlock:^(SVGAVideoEntity * _Nonnull videoItem) {
//        if (videoItem != nil) {
//            self.aPlayer.videoItem = videoItem;
//            [self.aPlayer startAnimation];
//        }
//
//    } failureBlock:nil];
//}


- (SVGAPlayer *)aPlayer {
    if (_aPlayer == nil) {
        _aPlayer = [[SVGAPlayer alloc] init];
    }
    return _aPlayer;
}
@end
