//
//  MagicViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "MagicViewController.h"

@interface MagicViewController ()

@end

@implementation MagicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"创意";
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.lineLabel.hidden = YES;
    [self initWithLeftButtonWithImage:[UIImage imageNamed:@"navigator_close"] name:@"" isHorizon:NO];
    [self.leftButton addTarget:self action:@selector(leftButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)leftButtonOnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
