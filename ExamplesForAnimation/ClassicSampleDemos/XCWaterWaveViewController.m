//
//  XCWaterWaveViewController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "XCWaterWaveViewController.h"
#import "XCWaterWaveView.h"

@interface XCWaterWaveViewController ()

@end

@implementation XCWaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    XCWaterWaveView *waterWaveView = [[XCWaterWaveView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:waterWaveView];
}



@end
