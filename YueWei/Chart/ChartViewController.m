//
//  ChartViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/27.
//

#import "ChartViewController.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"图标";
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.lineLabel.hidden = YES;
}

@end
