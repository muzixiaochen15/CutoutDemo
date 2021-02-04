//
//  CommUtils.h
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommUtils : NSObject

+ (UIColor *)changeToColorWithHexAndRgbString:(NSString *)stringToConvert;
+ (UIColor *)changeToColorWithHexAndRgbString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha;
+ (void)setLightNavigationBar;
+ (NSTimeInterval )timeSinceNowNSTimeInterval:(NSDate *)date;
//Ua
+ (NSString *)getUserAgent;
+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL ;
///压缩数据
+ (NSString *)setDataForGzipDataWith:(id)obj;
+ (NSString *)getBundleVersion;//获取系统版本号
//返回label长度
+(CGFloat)returnWidthWithLabel:(NSString *)string frontSize:(CGFloat )frontSize maxSize:(CGSize)maxSize;

+(CGFloat)returnWidthWithLabelText:(NSString *)string font:(UIFont *)font maxSize:(CGSize)maxSize;
@end

NS_ASSUME_NONNULL_END
