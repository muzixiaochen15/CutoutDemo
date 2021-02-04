//
//  GameViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/27.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"Game";
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.lineLabel.hidden = YES;
}

@end
