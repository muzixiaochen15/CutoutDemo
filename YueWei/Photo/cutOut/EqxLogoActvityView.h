//
//  EqxLogoActvityView.h
//  YiQiXiu
//
//  Created by 李群 on 2021/2/3.
//  Copyright © 2021 Sherry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface EqxLogoActvityView : UIView
/** 加载loading */
- (void)showEqxLogoActivityWithText:(NSString *)loadText;
/** 结束加载 */
- (void)endLoading;
@end

NS_ASSUME_NONNULL_END
