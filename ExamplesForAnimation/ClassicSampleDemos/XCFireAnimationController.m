//
//  XCFireAnimationController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCFireAnimationController.h"

@interface XCFireAnimationController () {
    /// 发射器对象
    CAEmitterLayer *_fireEmitter;
    
    UIImageView *_candleIV;
}

@end

@implementation XCFireAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    _fireEmitter = [CAEmitterLayer new];
    _candleIV = [UIImageView new];
    
    // 发射器在xy平面的中心位置
    _fireEmitter.emitterPosition = self.view.center;
    // 发射器的尺寸大小
    //        fireEmitter.emitterSize = CGSize(width: 20, height: 60)
    // 发射器的发射模式
    //        fireEmitter.emitterMode = kCAEmitterLayerOutline
    //        // 发射器的形状
    _fireEmitter.emitterShape = kCAEmitterLayerCircle;
    // 发射器渲染模式
    _fireEmitter.renderMode = kCAEmitterLayerAdditive;
    
    // 发射单元 - 火焰
    CAEmitterCell *fire = [CAEmitterCell new];
    // 粒子的创建速率，默认为1/s。
    fire.birthRate = 200;
    // 粒子存活时间
    fire.lifetime = 0.2;
    // 粒子的生存时间容差
    fire.lifetimeRange = 0.5;
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    fire.contents = (__bridge id _Nullable)([UIImage imageNamed:@"DazFire.png"].CGImage);
    fire.name = @"fire";
    // 粒子的速度
    fire.velocity = 35;
    // 粒子动画的速度容差
    fire.velocityRange = 10;
    // 粒子在xy平面的发射角度
    fire.emissionLongitude = M_PI + M_PI_2;
    // 粒子发射角度的容差
    fire.emissionRange = M_PI_2;
    // 缩放速度
    fire.scaleSpeed = 0.3;
    // 旋转度
    //        fire.spin = 0.2
    
    _fireEmitter.emitterCells = @[fire];
    [self.view.layer addSublayer:_fireEmitter];
}


@end
