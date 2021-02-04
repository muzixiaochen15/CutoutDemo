//
//  EQXTabBar.m
//  YiQiXiu
//
//  Created by Jelly on 2019/4/4.
//  Copyright © 2019 Sherry. All rights reserved.
//


#import "EQXTabBar.h"
#import "ConstantUI.h"

@interface EQXTabBar ()
@property (nonatomic, strong)UIButton *createButton;
@end

@implementation EQXTabBar


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.createButton];
        if ([[[UIDevice currentDevice] systemVersion] doubleValue] < 10.0) {
            CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
            UIGraphicsBeginImageContext(rect.size);
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
            CGContextFillRect(context, rect);
            UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            [self setBackgroundImage:img];
            [self setShadowImage:img];
        }
    }
    return self;
}

- (void)respondsToCreateButton{
    if ([self.tabDelegate respondsToSelector:@selector(tabBarDidClickCreateButton)]) {
        [self.tabDelegate tabBarDidClickCreateButton];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // 放置➕
    self.createButton.center = CGPointMake(CGRectGetWidth(self.frame) * 0.5,IS_IPHONE_X ?  CGRectGetHeight(self.frame) * 0.2 : CGRectGetHeight(self.frame) * 0.4);

    // 平分tabbar
    NSInteger tabbarCount = 4;
    CGFloat tabbarButtonWidth = (CGRectGetWidth(self.frame) - CGRectGetWidth(self.createButton.frame))/tabbarCount;
    CGFloat tabbarButtonIndex = 0;
    for (UIView *childView in self.subviews) {
        Class class = NSClassFromString(@"UITabBarButton");
        if ([childView isKindOfClass:class]) {
            if (tabbarButtonIndex > 1) {
                childView.frame = CGRectMake(tabbarButtonWidth * tabbarButtonIndex + CGRectGetWidth(self.createButton.frame), CGRectGetMinY(childView.frame), tabbarButtonWidth, CGRectGetHeight(childView.frame));
            }else{
                childView.frame = CGRectMake(tabbarButtonWidth *tabbarButtonIndex, CGRectGetMinY(childView.frame), tabbarButtonWidth, CGRectGetHeight(childView.frame));
            }
            tabbarButtonIndex += 1;
        }
    }
    for (UIView *subView in self.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            subView.alpha = 0;
        }
    }
}

///重写hittest方法以相应点击超出tabbar的加号按钮
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (!self.clipsToBounds && !self.hidden && self.alpha > 0) {
        UIView *result = [super hitTest:point withEvent:event];
        if (result) {
            return result;
        }else{
            for (UIView *subView  in self.subviews.reverseObjectEnumerator) {
                CGPoint subPoint = [subView convertPoint:point fromView:self];
                result = [subView hitTest:subPoint withEvent:event];
                if (result) {
                    return result;
                }
            }
        }
    }
    return nil;
}

- (UIButton *)createButton{
    if (_createButton == nil) {
        _createButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_createButton setImage:[UIImage imageNamed:@"tabbarCreate"] forState:UIControlStateNormal];
        [_createButton setImage:[UIImage imageNamed:@"tabbarCreate"] forState:UIControlStateHighlighted];
        _createButton.frame = CGRectMake(0, 0, _createButton.imageView.image.size.width, _createButton.imageView.image.size.height);
        [_createButton addTarget:self action:@selector(respondsToCreateButton) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _createButton;
}
@end
