//
//  XCDrawLineAnimationController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCDrawLineAnimationController.h"

@interface XCDrawLineAnimationController ()

@end

@implementation XCDrawLineAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 250, 500)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer new];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 5;
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue = @(0);
    pathAnimation.toValue = @(1);
    pathAnimation.autoreverses = YES;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.repeatCount = HUGE_VALF;
    [shapeLayer addAnimation:pathAnimation forKey:@"shapeLayer"];
}



@end
