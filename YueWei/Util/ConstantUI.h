//
//  ConstantUI.h
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#ifndef ConstantUI_h
#define ConstantUI_h

#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define IsIOS8 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)c
#define IsIOS9 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 9.0)
#define IsIOS10 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 10.0)
#define IsIOS11 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 11.0)
#define isIOS13 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 13.0)
#define isIOS14 ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 14.0)
#define KScreenSize [[UIScreen mainScreen] bounds].size

#define WIDTH_OF_SCREEN [[UIScreen mainScreen] bounds].size.width
#define HEIGHT_OF_SCREEN [[UIScreen mainScreen] bounds].size.height
#define SCREEN_MAX_LENGTH (MAX(WIDTH_OF_SCREEN, HEIGHT_OF_SCREEN))
#define SCREEN_MIN_LENGTH (MIN(WIDTH_OF_SCREEN, HEIGHT_OF_SCREEN))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X (((WIDTH_OF_SCREEN == 375) && (SCREEN_MAX_LENGTH == 812.0)) || (SCREEN_MAX_LENGTH >= 812.0))//补充SCREEN_MAX_LENGTH > 812.0，适配xs max、xr
#define RGBA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])

#define TOPBAR_HEIGHT 0

#define VIEW_EDGE 16
#define NAVIGATIONBAR_HEIGHT (IS_IPHONE_X ? 89 : 65)
#define TABBAR_HEIGHT (IS_IPHONE_X ?( isIOS14? 79.6 : 83) : 49)
#define STATUS_BAR_HEIGHT (IS_IPHONE_X ? 44 : 20)
#define IPHONE_X_TABBAR_SPACE  (IS_IPHONE_X ? 34 : 0)    //底部空隙

typedef NS_ENUM(NSInteger, ScreenSize) {
    Iphone4s = 960,
    Iphone5s = 1136,
    Iphone6 = 1334,
    Iphone6Plus = 1472,
    IphoneX = 1624
};

#define kMainColorStr                 @"#1593FF"

#endif /* ConstantUI_h */
