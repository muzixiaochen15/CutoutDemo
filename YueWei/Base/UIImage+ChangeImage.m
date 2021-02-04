//
//  UIImage+ChangeImage.m
//  YiQiXiu
//
//  Created by lcyu on 2019/7/10.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import "UIImage+ChangeImage.h"
#import "NSString+Hash.h"

@implementation UIImage (ChangeImage)
- (UIImage *)imageCroppedWithRect:(CGRect)rect{
    CGRect calcRect = CGRectMake(rect.origin.x*self.scale, rect.origin.y*self.scale, rect.size.width*self.scale, rect.size.height*self.scale);
    CGImageRef cgImage = CGImageCreateWithImageInRect(self.CGImage, calcRect);
    UIImage *croppedImage =  [UIImage imageWithCGImage:cgImage scale:1 orientation:self.imageOrientation];
    CGImageRelease(cgImage);
    return croppedImage;
}

- (NSString *)base64String{
    NSData *imageData = UIImagePNGRepresentation(self);
    NSString *base64Str = nil;
    if (imageData) {
        base64Str = [imageData base64EncodedStringWithOptions:0];
    }
    return base64Str;
}
@end
