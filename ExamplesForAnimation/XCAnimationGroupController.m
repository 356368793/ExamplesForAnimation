//
//  XCAnimationGroupController.m
//  ExamplesForAnimation
//
//  Created by 小C on 2017/11/27.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCAnimationGroupController.h"

@interface XCAnimationGroupController ()

@property(nonatomic, strong) UIView *redView;

@end

@implementation XCAnimationGroupController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 70, 70)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    _redView = redView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAAnimationGroup *animationGroup = [CAAnimationGroup new];
    
    // keyframe animation
    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(150, 200, 120, 120));
    keyframeAnimation.path = path;
    CGPathRelease(path);
    
    // rotation.z
    CABasicAnimation *rotationZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationZ.toValue = @(2 * M_PI);
    
    // cornerRadius
    CABasicAnimation *cornerRadius = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadius.toValue = @(35);
    
    animationGroup.duration = 4;
    animationGroup.removedOnCompletion = NO;
    animationGroup.repeatCount = HUGE_VALF;
    animationGroup.animations = @[keyframeAnimation, rotationZ, cornerRadius];
    
    [_redView.layer addAnimation:animationGroup forKey:@"animationGroup"];
}

@end
