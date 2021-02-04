//
//  NavBarViewController.h
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NavBarViewController : UIViewController
@property (strong, nonatomic) UIView *navImageView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *leftButton;
@property (strong, nonatomic) UIButton *rightButton;
@property (strong, nonatomic) UIView *lineLabel;
- (void)initWithLeftButtonWithImage:(UIImage *)image name:(NSString *)name isHorizon:(BOOL)isHorizon;
- (void)initWithRightButtonWithImage:(UIImage *)image name:(NSString *)name isHorizon:(BOOL)isHorizon;
@end

NS_ASSUME_NONNULL_END
