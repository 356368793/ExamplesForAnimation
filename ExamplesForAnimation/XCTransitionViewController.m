//
//  XCTransitionViewController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCTransitionViewController.h"

@interface XCTransitionViewController () <CAAnimationDelegate> {
    NSArray *_animArr;
    NSInteger _index;
}

@property (strong, nonatomic) UILabel *transitionLab;
@property (strong, nonatomic) UILabel *titleLab;

@end

@implementation XCTransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _animArr = @[@"cube", @"suckEffect", @"rippleEffect", @"pageCurl", @"pageUnCurl", @"oglFlip", @"cameraIrisHollowOpen", @"cameraIrisHollowClose", @"spewEffect",@"genieEffect",@"unGenieEffect",@"twist",@"tubey",@"swirl",@"charminUltra", @"zoomyIn", @"zoomyOut", @"oglApplicationSuspend"];
    _index = 0;
    
    UILabel *transitionLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    transitionLab.center = CGPointMake(375 / 2, 667 / 2);
    transitionLab.backgroundColor = [UIColor redColor];
    transitionLab.font = [UIFont systemFontOfSize:20];
    transitionLab.numberOfLines = 0;
    transitionLab.textColor = [UIColor blueColor];
    transitionLab.textAlignment = NSTextAlignmentCenter;
    transitionLab.text = @"测试文字";
    [self.view addSubview:transitionLab];
    self.transitionLab = transitionLab;
    
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(100, 500, 175, 60)];
    titleLab.backgroundColor = [UIColor blueColor];
    titleLab.textColor = [UIColor whiteColor];
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:13];
    titleLab.text = [NSString stringWithFormat:@"动画：无"];
    [self.view addSubview:titleLab];
    self.titleLab = titleLab;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 600, 175, 40)];
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitle:@"动画" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnAction {
    NSString *animType = _animArr[_index];
    
    CATransition *pageCurlAnim = [CATransition new];
    pageCurlAnim.delegate = self;
    pageCurlAnim.duration = 1;
    pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pageCurlAnim.type = animType;
    pageCurlAnim.subtype = kCATransitionFromLeft;
    pageCurlAnim.repeatCount = 1;
    [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
    [_transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
    _titleLab.text = [NSString stringWithFormat:@"动画：%@", _animArr[_index]];
}

#pragma mark - CAAnimationDelegate -
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    _index = (_index < [_animArr count] - 1) ? ++_index : 0;
    
    if (flag) {
        CATransition *pageCurlAnim = [CATransition new];
        pageCurlAnim.delegate = self;
        pageCurlAnim.duration = 1;
        pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        pageCurlAnim.type = _animArr[_index];
        pageCurlAnim.subtype = kCATransitionFromLeft;
        pageCurlAnim.repeatCount = 1;
        pageCurlAnim.autoreverses = YES;
        [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
        [_transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
        _titleLab.text = [NSString stringWithFormat:@"动画：%@", _animArr[_index]];
    }
}



@end
