//
//  ExtendNavViewController.h
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExtendNavViewController : UINavigationController
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated;
@end

NS_ASSUME_NONNULL_END
