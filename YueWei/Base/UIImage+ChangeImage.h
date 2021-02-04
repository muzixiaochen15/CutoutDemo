//
//  UIImage+ChangeImage.h
//  YiQiXiu
//
//  Created by lcyu on 2019/7/10.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ChangeImage)
- (UIImage *)imageCroppedWithRect:(CGRect)rect;
- (NSString *)base64String;
@end

NS_ASSUME_NONNULL_END
