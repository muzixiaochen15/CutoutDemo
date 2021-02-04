//
//  EqxLogoActvityView.m
//  YiQiXiu
//
//  Created by 李群 on 2021/2/3.
//  Copyright © 2021 Sherry. All rights reserved.
//

#import "EqxLogoActvityView.h"
#import "CommUtils.h"
#import "ConstantUI.h"
#import "AppDelegate.h"

@interface EqxLogoActvityView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *activityImageView;
@property (nonatomic, strong) UIImageView *activityLogoImageView;
@end

@implementation EqxLogoActvityView

- (instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];//[CommUtls changeToColorWithHexAndRgbString:kWhiteColorStrF4];
    }
    return self;
}

- (void)showEqxLogoActivityWithText:(NSString *)loadText{
    self.frame = [UIScreen mainScreen].bounds;
    self.backgroundColor = [UIColor clearColor];
    self.alpha = 1.0;
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 96, 96)];
    bgView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#000000" withAlpha:0.8];
    [self addSubview:bgView];
    bgView.layer.masksToBounds = YES;
    bgView.layer.cornerRadius = 8;
    bgView.center = self.center;
    
    UIImage *image = [UIImage imageNamed:@"activityImage"];
    NSInteger imageHeight = image.size.height;
    NSInteger originY = (bgView.frame.size.height - imageHeight) / 2 - 17;
    UIImageView *activityImage = [[UIImageView alloc] initWithImage:image];
    activityImage.frame = CGRectMake((bgView.frame.size.width - image.size.width) / 2,
                                     originY,
                                     image.size.width,
                                     image.size.height);
    [bgView addSubview:activityImage];
    _activityImageView = activityImage;
    
    UIImage *logoImage = [UIImage imageNamed:@"activityLogoImage"];
    UIImageView *logoImageView = [[UIImageView alloc] initWithImage:logoImage];
    logoImageView.frame = activityImage.frame;
    logoImageView.contentMode = UIViewContentModeCenter;
    [bgView addSubview:logoImageView];
    _activityLogoImageView = logoImageView;
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, logoImageView.frame.origin.y + logoImageView.frame.size.height, CGRectGetWidth(bgView.frame), 50)];
    [bgView addSubview:titleLabel];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:14];
    _titleLabel = titleLabel;
        
    [[UIApplication sharedApplication].keyWindow addSubview:self];

    if (loadText.length > 0) {
        _titleLabel.text = loadText;
    }else{
        _titleLabel.text = @"加载中...";
    }
    [self animationNowSet:YES];
}

- (void)endLoading{
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self animationNowSet:NO];
        [self removeFromSuperview];
    }];
}

- (void)animationNowSet:(BOOL)isAdd{
    if (isAdd) {
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
        rotationAnimation.duration = 1;
        rotationAnimation.repeatCount = HUGE_VALF;
        rotationAnimation.cumulative = YES;
        [_activityImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    }
    else{
        [_activityImageView.layer removeAnimationForKey:@"rotationAnimation"];
    }
}

@end
