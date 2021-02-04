//
//  TabBarViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "TabBarViewController.h"
#import "EQXTabBar.h"
#import "UserViewController.h"
#import "ScanViewController.h"
#import "MagicViewController.h"
#import "TabBarViewController.h"
#import "GameViewController.h"
#import "PhotoViewController.h"
#import "CommUtils.h"
#import "ConstantUI.h"
#import "XLBaseNavigationController.h"

@interface TabBarViewController ()<EQXTabBarDelegate>{
    EQXTabBar *tabBar;
    NSInteger _indexFlag;
}

@property (nonatomic, strong)NSMutableArray *tabbarArray;
@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tabbarArray = [[NSMutableArray alloc]init];
    tabBar = [[EQXTabBar alloc] init];
    tabBar.translucent = NO;
    tabBar.tabDelegate = self;
    
    [CommUtils setLightNavigationBar];
    // 浏览
    ScanViewController *scanVC = [[ScanViewController alloc]init];
    [self initTabBarItemWithRootVC:scanVC withVcDic:@{@"title": @"浏览", @"image": @"emoji_0", @"selectedImage": @"emoji_0-1"}];
    
    // Game
    GameViewController *gameVC = [[GameViewController alloc]init];
    [self initTabBarItemWithRootVC:gameVC withVcDic:@{@"title": @"Game", @"image": @"emoji_0", @"selectedImage": @"emoji_0-1"}];
    
    // 用户
    UserViewController *userVC = [[UserViewController alloc]init];
    [self initTabBarItemWithRootVC:userVC withVcDic:@{@"title": @"用户", @"image": @"emoji_1", @"selectedImage": @"emoji_1-1"}];
    
    // 相机
    PhotoViewController *photoVC = [[PhotoViewController alloc]init];
    [self initTabBarItemWithRootVC:photoVC withVcDic:@{@"title": @"相机", @"image": @"emoji_1", @"selectedImage": @"emoji_1-1"}];
    
    if (@available(iOS 13.0, *)) {
        // iOS 13以上
        tabBar.tintColor = [CommUtils changeToColorWithHexAndRgbString:@"#FF3232"];
        tabBar.unselectedItemTintColor = [CommUtils changeToColorWithHexAndRgbString:@"#999999"];
    }
    
    [self setValue:tabBar forKey:@"tabBar"];
    if (IsIOS10) {
        CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [tabBar setBackgroundImage:img];
        [tabBar setShadowImage:img];
    }
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, TABBAR_HEIGHT)];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.5f)];
    lineView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#F5F5F5"];
    [bgView addSubview:lineView];
    [tabBar insertSubview:bgView atIndex:0];
    
    [self performSelector:@selector(tabBarImageAnimation) withObject:nil afterDelay:1];
}

- (void)initTabBarItemWithRootVC:(NavBarViewController *)rootVC withVcDic:(NSDictionary *)vcDic{
    if (!rootVC) {
        return;
    }
    XLBaseNavigationController *nav = [[XLBaseNavigationController alloc]initWithRootViewController:rootVC];
    [nav setNavigationBarHidden:YES];
    
    UIImage *image = [[UIImage imageNamed:vcDic[@"image"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:vcDic[@"selectedImage"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc]initWithTitle:vcDic[@"title"] image:image selectedImage:selectedImage];
    nav.tabBarItem = item;
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:11],NSForegroundColorAttributeName:[CommUtils changeToColorWithHexAndRgbString:@"#999999"]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[CommUtils changeToColorWithHexAndRgbString:@"#FF3232"] }forState:UIControlStateSelected];
    
    self.tabBar.opaque = YES;

    [self addChildViewController:nav];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    NSInteger index = [self.tabBar.items indexOfObject:item];
   if (index != _indexFlag && index < _tabbarArray.count) {

       CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
       animation.calculationMode = kCAAnimationCubic;
       animation.duration = 0.7;       //执行时间
       animation.values = @[@0.8,@1.2,@1.0];

       [[_tabbarArray[index] layer] addAnimation:animation forKey:nil];

       _indexFlag = index;
   }
}

- (void)tabBarImageAnimation{
    for (UIControl *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            for (UIView *imageView in tabBarButton.subviews) {
                if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                    [_tabbarArray addObject:imageView];
                }
            }
        }
    }
}

#pragma mark - EQXTabBarDelegate
- (void)tabBarDidClickCreateButton{
    // 创意
    MagicViewController *magicVC = [[MagicViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:magicVC];
    [nav.navigationBar setBarStyle:UIBarStyleBlack];
    [nav setNavigationBarHidden:YES];
//    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:nav animated:YES completion:nil];
}

@end
