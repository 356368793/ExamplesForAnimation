//
//  XCWaterWaveView.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/12/4.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCWaterWaveView.h"
#import <CoreGraphics/CoreGraphics.h>

@interface XCWaterWaveView () {
    CGFloat _waveA;
    
    /// 水纹周期
    CGFloat _waveW;
    
    /// 位移
    CGFloat _offsetX;
    
    /// 当前波浪高度Y
    CGFloat _currentK;
    
    /// 水纹速度
    CGFloat _waveSpeed;
    
    /// 水纹路宽度
    CGFloat _waterWaveWidth;
    
    CADisplayLink *_waveDisplaylink;
    CAShapeLayer *_firstWaveLayer;
    CAShapeLayer *_secondWaveLayer;
    
    UIColor *_firstWaveColor;
}

@end

@implementation XCWaterWaveView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds = YES;
    
    _waveDisplaylink = [CADisplayLink new];
    _firstWaveLayer = [CAShapeLayer new];
    _secondWaveLayer = [CAShapeLayer new];
    
    /// 水纹振幅
    _waveA = 10;
    
    /// 水纹周期
    _waveW = 1/30.0;
    
    /// 位移
    _offsetX = 0;
    
    /// 当前波浪高度Y
    _currentK = 0;
    
    /// 水纹速度
    _waveSpeed = 0;
    
    /// 水纹路宽度
    _waterWaveWidth = 0;
    
    // 波浪宽
    _waterWaveWidth = self.bounds.size.width;
    // 波浪颜色
    _firstWaveColor = [UIColor greenColor];
    // 波浪速度
    _waveSpeed = 0.4 / M_PI;
    // 设置闭环的颜色
    _firstWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
    // 设置边缘线的颜色
    //        firstWaveLayer.strokeColor = UIColor.blue.cgColor
    _firstWaveLayer.strokeStart = 0.0;
    _firstWaveLayer.strokeEnd = 0.8;
    // 设置闭环的颜色
    _secondWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
    // 设置边缘线的颜色
    //        secondWaveLayer.strokeColor = UIColor.blue.cgColor
    _secondWaveLayer.strokeStart = 0.0;
    _secondWaveLayer.strokeEnd = 0.8;
    [self.layer addSublayer:_firstWaveLayer];
    [self.layer addSublayer:_secondWaveLayer];
    
    // 设置波浪流动速度
    _waveSpeed = 0.05;
    // 设置振幅
    _waveA = 8;
    // 设置周期
    _waveW = 2 * M_PI / self.bounds.size.width;
    // 设置波浪纵向位置
    _currentK = self.bounds.size.height / 2; //屏幕居中
    
    _waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave)];
    [_waveDisplaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)getCurrentWave {
    _offsetX += _waveSpeed;
    [self setCurrentFirstWaveLayerPath];
}

- (void)setCurrentFirstWaveLayerPath {
    // 创建一个路径
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    float y = _currentK;
    [path moveToPoint:CGPointMake(0, y)];
    
    int waterWaveWidth = (int)_waterWaveWidth;
    for (int i = 0; i < waterWaveWidth; i++) {
        y = _waveA * sin(_waveW * i + _offsetX) + _currentK;
        [path addLineToPoint:CGPointMake(i, y)];
    }
    
    [path addLineToPoint:CGPointMake(_waterWaveWidth, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    
    _firstWaveLayer.path = path.CGPath;
    
    // 创建一个路径
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    float y2 = _currentK;
    [path2 moveToPoint:CGPointMake(0, y2)];
    
    for (int i = 0; i < waterWaveWidth; i++) {
        y2 = _waveA * sin(_waveW * i + _offsetX - _waterWaveWidth / 2) + _currentK;
        [path2 addLineToPoint:CGPointMake(i, y2)];
    }
    
    [path2 addLineToPoint:CGPointMake(_waterWaveWidth, self.bounds.size.height)];
    [path2 addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path2 closePath];
    _secondWaveLayer.path = path2.CGPath;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
