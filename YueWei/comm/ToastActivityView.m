//
//  ToastActivityView.m
//  YiQiXiu
//
//  Created by ZLJ on 2017/3/29.
//  Copyright © 2017年 Sherry. All rights reserved.
//

#import "ToastActivityView.h"
#import "ConstantUI.h"
#import "AppDelegate.h"
#import "CommUtils.h"

@interface ToastActivityView (){
    //是否存在等待框
    BOOL isActivityAni;
}
@end

@implementation ToastActivityView
- (instancetype)init{
    self = [super init ];
    if (self) {
        _backView = [[UIView alloc] init];
        _backView.layer.cornerRadius = 10;
        _backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
        [self addSubview:_backView];
        
        _maxWidth = WIDTH_OF_SCREEN - 80;
        _maxHeight = 110;
        
        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [_backView addSubview:_activity];
        
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor whiteColor];
        _textLabel.font = [UIFont systemFontOfSize:15];
        _textLabel.textAlignment = NSTextAlignmentCenter;
        [_backView addSubview:_textLabel];
        
        NSInteger backViewWidth = WIDTH_OF_SCREEN * 2 / 3;
        _hideTextView = [[UIView alloc] initWithFrame:CGRectMake((WIDTH_OF_SCREEN - backViewWidth)/2 , (HEIGHT_OF_SCREEN - 50)/2, backViewWidth , 60)];
        _hideTextView.layer.cornerRadius = 10;
        _hideTextView.clipsToBounds = YES;
        _hideTextView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
     
        UILabel *hideTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, _hideTextView.frame.size.width - 10, _hideTextView.frame.size.height)];
        hideTextLabel.tag = 6752;
        hideTextLabel.font = [UIFont systemFontOfSize:15];
        hideTextLabel.textColor = [UIColor whiteColor];
        hideTextLabel.textAlignment = NSTextAlignmentCenter;
        hideTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
        hideTextLabel.numberOfLines = 0;
        [_hideTextView addSubview:hideTextLabel];
    }
    return self;
}

- (void)showActivityViewWithText:(NSString *)text superView:(UIView *)superView{
    self.frame = CGRectMake(0, 0, superView.frame.size.width, superView.frame.size.height);
    CGFloat textWidth = [CommUtils returnWidthWithLabel:text frontSize:14 maxSize:CGSizeMake(_maxHeight, 50)];
    NSInteger backViewWidth = MIN(textWidth + 40 * 2, _maxWidth);
    _backView.alpha = 1.0;
    if ([text length] > 0) {
        _backView.frame = CGRectMake((CGRectGetWidth(superView.frame) - backViewWidth)/2, (CGRectGetHeight(superView.frame) - _maxHeight) / 2, backViewWidth, _maxHeight);
    }else{
        _backView.frame = CGRectMake((CGRectGetWidth(superView.frame) - backViewWidth)/2, (CGRectGetHeight(superView.frame) - _maxHeight) / 2, backViewWidth, backViewWidth);
    }
    _activity.frame = CGRectMake((_backView.frame.size.width - 50) / 2, 15, 50, 50);
    [_activity startAnimating];
    _textLabel.text = text;
    
    if (textWidth > _maxWidth) {
        _textLabel.frame = CGRectMake(5.0f, 65, backViewWidth - 10.0f, 50);
    }else{
        _textLabel.frame = CGRectMake(5.0f, 60, backViewWidth - 10.0f, 50);
    }
    _textLabel.numberOfLines = 2;
    [superView addSubview:self];
    
    isActivityAni = YES;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(isHideActivityView) object:nil];
    [self performSelector:@selector(isHideActivityView) withObject:nil afterDelay:30.0f];
}
- (void)isHideActivityView{
    if ([_activity isAnimating]&&isActivityAni) {
        [self hideActivityView];
    }
}

- (void)hideActivityView{
    isActivityAni = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(isHideActivityView) object:nil];
    
    [_activity stopAnimating];
    [UIView animateWithDuration:0.2 animations:^{
        _backView.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)hideActivityViewWithNoneAnimation{
    isActivityAni = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(isHideActivityView) object:nil];
    
    [_activity stopAnimating];
    [self removeFromSuperview];
}

- (void)hideActivityViewWithRemoveTime:(CGFloat)time text:(NSString *)text{
    dispatch_async(dispatch_get_main_queue(), ^{
        [_activity stopAnimating];
        [self removeFromSuperview];
        _hideTextView.alpha = 1.0;
        UILabel *hideTextLabel = (UILabel *)[_hideTextView viewWithTag:6752];
        hideTextLabel.text = text;
        [[AppDelegate getAppDelegate].window addSubview:_hideTextView];
        [self performSelector:@selector(hideWillHideView) withObject:nil afterDelay:time];
    });
}

- (void)hideWillHideView{
    [UIView animateWithDuration:0.2 animations:^{
        _hideTextView.alpha = 0;
    } completion:^(BOOL finished) {
        [_hideTextView removeFromSuperview];
    }];
}
@end
