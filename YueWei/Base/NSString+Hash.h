//
//  NSString+Hash.h
//  YiQiXiu
//
//  Created by lcyu on 2019/7/10.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Hash)
@property (readonly) NSString *MD5Hash;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

-(NSString *)base64Encode;
-(NSString *)base64Decode;
-(UIImage *)base64DecodeToImage;
@end

NS_ASSUME_NONNULL_END
