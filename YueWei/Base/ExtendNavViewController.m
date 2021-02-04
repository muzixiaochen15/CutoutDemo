//
//  ExtendNavViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "ExtendNavViewController.h"

@interface ExtendNavViewController ()<UINavigationControllerDelegate>

@end

@implementation ExtendNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
   if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    // 为了解决部分页面加了转场动画手势返回卡死的bug
    // 在UINavigationController代理方法didShowViewController中设置enable = YES
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
 }

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 为了解决手势返回卡住的bug
    // 在NavigationController中重写push方法禁用返回手势,此处打开
    if ([navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}
@end
