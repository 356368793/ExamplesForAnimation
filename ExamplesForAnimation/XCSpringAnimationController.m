//
//  XCSpringAnimationController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCSpringAnimationController.h"

@interface XCSpringAnimationController ()

@end

@implementation XCSpringAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, 50, 30)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    CASpringAnimation *spring = [CASpringAnimation animationWithKeyPath:@"position.x"];
    spring.damping = 5;
    spring.stiffness = 100;
    spring.mass = 1;
    spring.initialVelocity = 0;
    spring.fromValue = @(label.layer.position.x);
    spring.toValue = @(label.layer.position.x + 100);
    spring.autoreverses = YES;
    spring.repeatCount = HUGE_VALF;
    spring.duration = spring.settlingDuration;
    [label.layer addAnimation:spring forKey:spring.keyPath];
}


@end
