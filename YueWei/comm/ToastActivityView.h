//
//  ToastActivityView.h
//  YiQiXiu
//
//  Created by ZLJ on 2017/3/29.
//  Copyright © 2017年 Sherry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToastActivityView : UIView

@property (nonatomic, strong)UIView *backView;
@property (nonatomic, assign)NSInteger maxWidth;
@property (nonatomic, assign)NSInteger maxHeight;
@property (nonatomic, strong)UIActivityIndicatorView *activity;
@property (nonatomic, strong)UILabel *textLabel;
@property (nonatomic, strong)UIView *willHideView;
@property (nonatomic, strong)UIView *hideTextView;

- (void)showActivityViewWithText:(NSString *)text superView:(UIView *)superView;
- (void)hideActivityViewWithRemoveTime:(CGFloat)time text:(NSString *)text;
- (void)hideActivityView;
- (void)hideActivityViewWithNoneAnimation;

@end

