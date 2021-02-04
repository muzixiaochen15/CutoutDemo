//
//  EQXTabBar.h
//  YiQiXiu
//
//  Created by Jelly on 2019/4/4.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EQXTabBar;

NS_ASSUME_NONNULL_BEGIN

@protocol EQXTabBarDelegate <NSObject>

- (void)tabBarDidClickCreateButton;

@end


@interface EQXTabBar : UITabBar

@property (nonatomic, weak)id<EQXTabBarDelegate>tabDelegate;
@end

NS_ASSUME_NONNULL_END
