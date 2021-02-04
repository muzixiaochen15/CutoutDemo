//
//  AppDelegate.h
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow * window;
+ (AppDelegate *)getAppDelegate;
#pragma mark -
// first show hud with text
- (void)showActivityView:(NSString *)text;
// first show hud with text in view
- (void)showActivityView:(NSString *)text inView:(UIView *)view;
// hide prevoiusly showed hud
- (void)hideActivityView;
- (void)hideActivityView:(BOOL)animated;
// first showe hud with succeed text and image for time seconds
- (void)showFailedActivityView:(NSString *)text interval:(NSTimeInterval)time;
@end

