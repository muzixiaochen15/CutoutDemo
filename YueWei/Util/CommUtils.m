//
//  CommUtils.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "CommUtils.h"
#import <GZIP/GZIP.h>

@implementation CommUtils

+ (UIColor *)changeToColorWithHexAndRgbString:(NSString *)stringToConvert {
    if ([stringToConvert isKindOfClass:[UIColor class]]) {
        return (UIColor *) stringToConvert;
    }
    if (![stringToConvert isKindOfClass:[NSString class]]) {
        return [UIColor clearColor];
    }

    UIColor *deColor = nil;
    if ([stringToConvert hasPrefix:@"#"] || [stringToConvert hasPrefix:@"0X"] || stringToConvert.length == 6) { //是16进制的颜色值
        if (stringToConvert.length == 4) { //比如 #fff
            unichar lastChar = [stringToConvert characterAtIndex:3];
            stringToConvert = [NSString stringWithFormat:@"%@%c%c%c", stringToConvert, lastChar, lastChar, lastChar];
        }
        NSString *cString = [[stringToConvert stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
        if ([cString hasPrefix:@"0X"]) {
            cString = [cString substringFromIndex:2];
        } else if ([cString hasPrefix:@"#"]) {
            cString = [cString substringFromIndex:1];
        }

        if (cString.length == 6) {
            NSRange range;
            range.location = 0;
            range.length = 2;
            NSString *rString = [cString substringWithRange:range];

            range.location = 2;
            NSString *gString = [cString substringWithRange:range];

            range.location = 4;
            NSString *bString = [cString substringWithRange:range];

            // Scan values
            unsigned int r, g, b;
            [[NSScanner scannerWithString:rString] scanHexInt:&r];
            [[NSScanner scannerWithString:gString] scanHexInt:&g];
            [[NSScanner scannerWithString:bString] scanHexInt:&b];
            if ([[UIDevice currentDevice] systemVersion].floatValue >= 10.0f) {
                deColor = [UIColor colorWithDisplayP3Red:((float) r / 255.0f)
                                                   green:((float) g / 255.0f)
                                                    blue:((float) b / 255.0f)
                                                   alpha:1.0f];
            } else {
                deColor = [UIColor colorWithRed:((float) r / 255.0f)
                                          green:((float) g / 255.0f)
                                           blue:((float) b / 255.0f)
                                          alpha:1.0f];
            }
        }
    } else {
        NSRange range1 = [stringToConvert rangeOfString:@"("];
        NSRange range2 = [stringToConvert rangeOfString:@")"];
        if (range2.location > range1.location + 1 && [stringToConvert length] > range2.location - range1.location - 1) {
            NSString *string = [stringToConvert substringWithRange:NSMakeRange(range1.location + 1, range2.location - range1.location - 1)];
            NSArray *colorArray = [string componentsSeparatedByString:@","];
            if ([colorArray count] >= 3) {
                CGFloat redValue = 255.0;
                CGFloat greenValue = 255.0;
                CGFloat blueValue = 255.0;
                CGFloat alphaValue = 1.0;

                if ([[colorArray objectAtIndex:0] respondsToSelector:@selector(floatValue)]) {
                    redValue = [[colorArray objectAtIndex:0] floatValue];
                }
                if ([[colorArray objectAtIndex:1] respondsToSelector:@selector(floatValue)]) {
                    greenValue = [[colorArray objectAtIndex:1] floatValue];
                }
                if ([[colorArray objectAtIndex:2] respondsToSelector:@selector(floatValue)]) {
                    blueValue = [[colorArray objectAtIndex:2] floatValue];
                }
                if (colorArray.count > 3) {
                    if ([[colorArray objectAtIndex:3] respondsToSelector:@selector(floatValue)]) {
                        alphaValue = [[colorArray objectAtIndex:3] floatValue];
                    }
                }
                deColor = [UIColor colorWithRed:((float) redValue / 255.0f)
                                          green:((float) greenValue / 255.0f)
                                           blue:((float) blueValue / 255.0f)
                                          alpha:alphaValue];
            }
        }
    }
    if (deColor) {
        return deColor;
    } else {
        return [UIColor clearColor];
    }
}

+ (UIColor *)changeToColorWithHexAndRgbString:(NSString *)stringToConvert withAlpha:(CGFloat)alpha {
    UIColor *color = [self changeToColorWithHexAndRgbString:stringToConvert];
    if (alpha == 1) {
        return color;
    } else {
        return [color colorWithAlphaComponent:alpha];
    }
}

+(void)setLightNavigationBar{
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                          NSForegroundColorAttributeName: [CommUtils changeToColorWithHexAndRgbString:@"#222222"],
                                                          NSFontAttributeName:[UIFont boldSystemFontOfSize:16]
                                                          }];
    UIImage *backgroundImage = [CommUtils imageWithColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (NSTimeInterval)timeSinceNowNSTimeInterval:(NSDate *)date {
    @try {
        NSTimeInterval interval = 0 - [date timeIntervalSinceNow];
        return interval;
    }
    @catch (NSException *exception) {
        return 0;
    }
    @finally {
    }
}

//Ua
+ (NSString *)getUserAgent {
    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)", [[NSBundle mainBundle] infoDictionary][(__bridge NSString *) kCFBundleExecutableKey] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *) kCFBundleIdentifierKey], [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *) kCFBundleVersionKey], [[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion], [[UIScreen mainScreen] scale]];
    return userAgent;
}

+ (BOOL)addSkipBackupAttributeToItemAtURL:(NSURL *)URL {
    assert([[NSFileManager defaultManager] fileExistsAtPath:[URL path]]);
    NSError *error = nil;
    BOOL success = [URL setResourceValue:[NSNumber numberWithBool:YES]
                                  forKey:NSURLIsExcludedFromBackupKey error:&error];
    if (!success) {
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

///压缩数据
+ (NSString *)setDataForGzipDataWith:(id)obj {
    NSData *data = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:nil];
    NSData *reData = [data gzippedDataWithCompressionLevel:1];
    NSString *str = [self convertDataToHexStr:reData];
    return str;

}

+ (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";

    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char *) bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];

            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }

    }];
    return string;

}

+ (NSString *)getBundleVersion {//获取系统版本号
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *versionNum = [infoDict objectForKey:@"CFBundleShortVersionString"];
    return versionNum;
}

/*!
 @brief label长度
 @param string 输入文字
 @param frontSize 字体大小
 @param maxSize 最大长度限制
 @return label长度
 */
+ (CGFloat)returnWidthWithLabel:(NSString *)string frontSize:(CGFloat)frontSize maxSize:(CGSize)maxSize {
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:frontSize]};
    CGSize labSize = [string boundingRectWithSize:maxSize
                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine
                                       attributes:attributes
                                          context:nil].size;

    return labSize.width;
}

@end
