//
//  ViewController.m
//  ExamplesForAnimation
//
//  Created by xiaochen on 2017/11/23.
//  Copyright © 2017年 thinktrader. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *_titleArray;
    NSArray *_sectionTitleArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titleArray = @[
                    @[
                        @{@"className": @"XCBasicAnimationController", @"title": @"CABasicAnimation基础动画"},
                        @{@"className": @"XCKeyframeAnimationController", @"title": @"CAKeyframeAnimation基础动画"},
                        @{@"className": @"XCTransitionViewController", @"title": @"CATransition转场动画"},
                        @{@"className": @"XCSpringAnimationController", @"title": @"CASpringAnimation弹簧动画"}
                        ],
                    @[
                        @{@"className": @"XCDrawLineAnimationController", @"title": @"画线动画"},
                        @{@"className": @"XCWaterWaveViewController", @"title": @"水波纹效果"},
                        @{@"className": @"XCFireAnimationController", @"title": @"粒子动画-火苗效果"}
                        ]
                    ];
    
    _sectionTitleArray = @[@"动画基础示例",@"动画常见经典案例"];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [_sectionTitleArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_titleArray[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"UITableViewCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSDictionary *cellDic = _titleArray[indexPath.section][indexPath.row];
    cell.textLabel.text = cellDic[@"title"];
    
    return cell;
}

#pragma mark - UITableViewDelegate -
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sectionTitleArray[section];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *cellDic = _titleArray[indexPath.section][indexPath.row];
    NSString *className = cellDic[@"className"];
    NSString *title = cellDic[@"title"];
    
    UIViewController *vc = [NSClassFromString(className) new];
    vc.title = title;
    
    [self.navigationController pushViewController:vc animated:YES];
}



@end
