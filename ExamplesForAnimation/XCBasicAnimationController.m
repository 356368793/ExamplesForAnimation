//
//  XCBasicAnimationController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCBasicAnimationController.h"

@interface XCBasicAnimationController ()

@end

@implementation XCBasicAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    /**------------------------旋转动画-------------------------------------*/
    UIView *rotationViewX = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 70, 70)];
    rotationViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:rotationViewX];
    CABasicAnimation *rotationAnimX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimX.beginTime = 0.0;
    rotationAnimX.duration = 1.5;
    rotationAnimX.repeatCount = HUGE_VALF;
    rotationAnimX.toValue = @(2 * M_PI);
    [rotationViewX.layer addAnimation:rotationAnimX forKey:@"rotationAnimX"];
    
    UIView *rotationViewY = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 70, 70)];
    rotationViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:rotationViewY];
    CABasicAnimation *rotationAnimY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimY.beginTime = 0.0;
    rotationAnimY.duration = 1.5;
    rotationAnimY.repeatCount = HUGE_VALF;
    rotationAnimY.toValue = @(2 * M_PI);
    [rotationViewY.layer addAnimation:rotationAnimY forKey:@"rotationAnimY"];
    
    UIView *rotationViewZ = [[UIView alloc] initWithFrame:CGRectMake(280, 100, 70, 70)];
    rotationViewZ.backgroundColor = [UIColor redColor];
    [self.view addSubview:rotationViewZ];
    CABasicAnimation *rotationAnimZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimZ.beginTime = 0.0;
    rotationAnimZ.duration = 1.5;
    rotationAnimZ.repeatCount = HUGE_VALF;
    rotationAnimZ.toValue = @(2 * M_PI);
    [rotationViewZ.layer addAnimation:rotationAnimZ forKey:@"rotationAnimZ"];
    
    /**------------------------移动动画-------------------------------------*/
    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(20, 240, 70, 70)];
    moveView.center = CGPointMake(40, 200);
    moveView.backgroundColor = [UIColor redColor];
    [self.view addSubview:moveView];
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(60, 240)];
    moveAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(320, 240)];
    moveAnim.duration = 2;
    moveAnim.repeatCount = HUGE_VALF;
    moveAnim.autoreverses = YES;
    moveAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [moveView.layer addAnimation:moveAnim forKey:@"moveAnim"];
    
    /**------------------------背景颜色变化动画-------------------------------------*/
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(20, 310, 70, 70)];
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.fromValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    colorAnim.toValue = (__bridge id _Nullable)([UIColor greenColor].CGColor);
    colorAnim.autoreverses = YES;
    colorAnim.repeatCount = HUGE_VALF;
    colorAnim.duration = 2;
    [colorView.layer addAnimation:colorAnim forKey:@"colorAnim"];
    
    /**------------------------内容变化动画-------------------------------------*/
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 310, 70, 70)];
    imageView.image = [UIImage imageNamed:@"from.jpg"];
    [self.view addSubview:imageView];
    CABasicAnimation *contentsAnim = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnim.toValue = ((__bridge id)[UIImage imageNamed:@"to.jpg"].CGImage);
    contentsAnim.duration = 1.5;
    contentsAnim.autoreverses = YES;
    contentsAnim.repeatCount = HUGE_VALF;
    [imageView.layer addAnimation:contentsAnim forKey:@"contentsAnim"];
    
    /**------------------------圆角变化动画-------------------------------------*/
    UIView *cornerRadiusView = [[UIView alloc] initWithFrame:CGRectMake(280, 310, 70, 70)];
    cornerRadiusView.backgroundColor = [UIColor redColor];
    [self.view addSubview:cornerRadiusView];
    CABasicAnimation *cornerRadiusAnim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnim.toValue = @(35);
    cornerRadiusAnim.duration = 2;
    cornerRadiusAnim.autoreverses = YES;
    cornerRadiusAnim.repeatCount = HUGE_VALF;
    [cornerRadiusView.layer addAnimation:cornerRadiusAnim forKey:@"cornerRadiusAnim"];
    
    /**------------------------比例缩放动画-------------------------------------*/
    UIView *scaleView = [[UIView alloc] initWithFrame:CGRectMake(20, 410, 70, 70)];
    scaleView.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleView];
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.fromValue = @(0.3);
    scaleAnim.toValue = @(1.3);
    scaleAnim.duration = 2;
    scaleAnim.autoreverses = YES;
    scaleAnim.repeatCount = HUGE_VALF;
    [scaleView.layer addAnimation:scaleAnim forKey:@"scaleAnim"];
    
    /**------------------------比例缩放动画X-------------------------------------*/
    UIView *scaleViewX = [[UIView alloc] initWithFrame:CGRectMake(150, 410, 70, 70)];
    scaleViewX.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewX];
    CABasicAnimation *scaleAnimX = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleAnimX.fromValue = @(0.3);
    scaleAnimX.toValue = @(1.3);
    scaleAnimX.duration = 2;
    scaleAnimX.autoreverses = YES;
    scaleAnimX.repeatCount = HUGE_VALF;
    [scaleViewX.layer addAnimation:scaleAnimX forKey:@"scaleAnimX"];
    
    /**------------------------比例缩放动画Y-------------------------------------*/
    UIView *scaleViewY = [[UIView alloc] initWithFrame:CGRectMake(280, 410, 70, 70)];
    scaleViewY.backgroundColor = [UIColor redColor];
    [self.view addSubview:scaleViewY];
    CABasicAnimation *scaleAnimY = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleAnimY.fromValue = @(0.3);
    scaleAnimY.toValue = @(1.3);
    scaleAnimY.duration = 2;
    scaleAnimY.autoreverses = YES;
    scaleAnimY.repeatCount = HUGE_VALF;
    [scaleViewY.layer addAnimation:scaleAnimY forKey:@"scaleAnimY"];
    
    /**------------------------指定大小缩放-------------------------------------*/
    UIView *boundsView = [[UIView alloc] initWithFrame:CGRectMake(40, 520, 20, 80)];
    boundsView.backgroundColor = [UIColor redColor];
    [self.view addSubview:boundsView];
    CABasicAnimation *boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 90, 30)];
    boundsAnim.duration = 2;
    boundsAnim.autoreverses = YES;
    boundsAnim.repeatCount = HUGE_VALF;
    [boundsView.layer addAnimation:boundsAnim forKey:@"boundsAnim"];
    
    /**------------------------透明动画-------------------------------------*/
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(150, 520, 70, 70)];
    alphaView.backgroundColor = [UIColor redColor];
    [self.view addSubview:alphaView];
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.fromValue = @(0.3);
    alphaAnim.toValue = @(1);
    alphaAnim.duration = 0.6;
    alphaAnim.autoreverses = YES;
    alphaAnim.repeatCount = HUGE_VALF;
    [alphaView.layer addAnimation:alphaAnim forKey:@"alphaAnim"];
}




@end
