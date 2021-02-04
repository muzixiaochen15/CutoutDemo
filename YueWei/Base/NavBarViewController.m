//
//  NavBarViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "NavBarViewController.h"
#import "CommUtils.h"
#import "ConstantUI.h"

@interface NavBarViewController ()<UINavigationBarDelegate, UINavigationControllerDelegate>
@property (nonatomic,assign) BOOL isCanSideBack;/**< 是否可以侧滑 */

@end

@implementation NavBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#F4F4F4"];
    [self.navigationController setHidesBottomBarWhenPushed:YES];
    self.navigationController.delegate = self;
    
    _navImageView = [[UIView alloc] initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, NAVIGATIONBAR_HEIGHT )];
    self.navImageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_navImageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(40.0f, STATUS_BAR_HEIGHT, _navImageView.frame.size.width - 80.0f, NAVIGATIONBAR_HEIGHT - STATUS_BAR_HEIGHT);
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textColor = [CommUtils changeToColorWithHexAndRgbString:@"#222222"];
    _titleLabel.font = [UIFont boldSystemFontOfSize:17];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLabel];
    
    _lineLabel = [[UIView alloc] initWithFrame:CGRectMake(0, _navImageView.frame.size.height - 1,[UIScreen mainScreen].bounds.size.width , 1)];
    _lineLabel.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#E9EDEF"];
    [_navImageView addSubview:_lineLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.navigationController.viewControllers.firstObject != self) {
        [self disableSideBack];
    }else{
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        } //webview的手势有重写，所以要把这段放在这里，而不是viewdidload
    }
}

- (void)initWithLeftButtonWithImage:(UIImage *)image
                               name:(NSString *)name
                          isHorizon:(BOOL)isHorizon{
    if (!self.navImageView) {
        return;
    }
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftButton.frame = CGRectMake(0, STATUS_BAR_HEIGHT, 80, NAVIGATIONBAR_HEIGHT - STATUS_BAR_HEIGHT);
    _leftButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [_leftButton setImage:image forState:UIControlStateNormal];
    if (isHorizon) {
        [_leftButton setTitle:[NSString stringWithFormat:@" %@",name] forState:UIControlStateNormal];
        [_leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 12, 0, 80 - image.size.width - 12)];
        [_leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 2 + image.size.width, 0, 0)];
        
    }else{
        [_leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 80 - image.size.width - 15)];
        if (name.length > 0) {
            [_leftButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 20, 0, 0)];
            [_leftButton setTitle:name forState:UIControlStateNormal];
        }
    }
    
    [_leftButton setTitleColor:[CommUtils changeToColorWithHexAndRgbString:@"#222222"] forState:UIControlStateNormal];
    _leftButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.navImageView addSubview:_leftButton];
}


- (void)initWithRightButtonWithImage:(UIImage *)image
                                name:(NSString *)name
                           isHorizon:(BOOL)isHorizon{
    if (!self.navImageView) {
        return;
    }
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(_navImageView.frame.size.width - 80, STATUS_BAR_HEIGHT, 80, NAVIGATIONBAR_HEIGHT - STATUS_BAR_HEIGHT);
    _rightButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [_rightButton setImage:image forState:UIControlStateNormal];
    [_rightButton setTitle:name forState:UIControlStateNormal];
    
    [_rightButton setTitleColor:[CommUtils changeToColorWithHexAndRgbString:@"#222222"] forState:UIControlStateNormal];
    _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [self.navImageView addSubview:_rightButton];
    
    if (isHorizon) {
        [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 80 - 11 - image.size.width, 0, 0)];
        [_rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0,  11 + image.size.width + 5)];
    }else
    {
        [_rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 80 - image.size.width - 15, 0, 15)];
        [_rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
    }
}
#pragma mark - 解决滑动返回卡死问题
//- (void)viewWillAppear:(BOOL)animated
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.navigationController.viewControllers.firstObject != self) {
        [self enableSideBack];
    }
}
/*!
 @abstract 禁用侧滑返回
 */
- (void)disableSideBack{
    self.isCanSideBack = NO;
    // 关闭 侧滑返回
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }
}
/*!
 @abstract 启用 侧滑返回
 */
- (void)enableSideBack{
    self.isCanSideBack = YES;
    // 开启 侧滑返回
    if([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
}
#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer {
    if (self.navigationController.viewControllers.firstObject != self) {
        return YES;
    }else{
        return self.isCanSideBack;
    }
}

@end
