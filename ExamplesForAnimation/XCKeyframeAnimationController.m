//
//  XCKeyframeAnimationController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCKeyframeAnimationController.h"

@interface XCKeyframeAnimationController ()

@end

@implementation XCKeyframeAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    UIView *animView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 70, 80)];
    animView.backgroundColor = [UIColor redColor];
    [self.view addSubview:animView];
    
    CAKeyframeAnimation *orbitAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    orbitAnim.duration = 5;
    orbitAnim.path = bezierPath.CGPath;
    orbitAnim.calculationMode = kCAAnimationPaced;
    orbitAnim.fillMode = kCAFillModeForwards;
    orbitAnim.repeatCount = HUGE_VALF;
    orbitAnim.rotationMode = kCAAnimationRotateAutoReverse;
    [animView.layer addAnimation:orbitAnim forKey:@"orbitAnim"];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
}



@end
