//
//  NSString+YQXCategory.m
//  YiQiXiu
//
//  Created by lcyu on 2019/6/13.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import "NSString+YQXCategory.h"

@implementation NSString (YQXCategory)
-(BOOL)isGif{
    NSURL *url = [NSURL fileURLWithPath:self];
    if (url) {
        NSData *data = [NSData dataWithContentsOfURL:url];
        uint8_t c;
        [data getBytes:&c length:1];
        switch (c) {
            case 0x47:
                return true;
        }
    }
    return false;
}
@end
