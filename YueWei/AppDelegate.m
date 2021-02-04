//
//  AppDelegate.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "AppDelegate.h"
#import "TabBarViewController.h"
#import "ConstantUI.h"
#import "ToastActivityView.h"

@interface AppDelegate ()
@property (nonatomic, strong) ToastActivityView *toastActivityView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
   
    //首页
    if (IsIOS10) {
        [[UITabBar appearance] setTranslucent:NO];
    }
    
    TabBarViewController *rootTabBarC = [[TabBarViewController alloc] init];
    self.window.rootViewController = rootTabBarC;
    return YES;
}

#pragma mark ActivityViews loading.
- (void)showActivityView:(NSString *)text {
    [self showActivityView:text inView:self.window];
}

- (void)showActivityView:(NSString *)text inView:(UIView *)view {
    if (_toastActivityView == nil) {
        ToastActivityView *toastActivityView = [[ToastActivityView alloc] init];
        _toastActivityView = toastActivityView;
    }
    [_toastActivityView showActivityViewWithText:text superView:view];
}

- (void)hideActivityView {
    [_toastActivityView hideActivityView];
}

- (void)hideActivityView:(BOOL)animated {
    if (!animated) {
        [_toastActivityView hideActivityViewWithNoneAnimation];
    } else {
        [self hideActivityView];
    }
}

#pragma mark - 结果提示
- (void)showFailedActivityView:(NSString *)text interval:(NSTimeInterval)time {
    if (_toastActivityView == nil) {
        ToastActivityView *toastActivityView = [[ToastActivityView alloc] init];
        _toastActivityView = toastActivityView;
    }
    [_toastActivityView hideActivityViewWithRemoveTime:time text:text];
}

+ (AppDelegate *)getAppDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
