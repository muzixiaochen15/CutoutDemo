//
//  UploadLoadingView.h
//  YiQiXiuPersonal
//
//  Created by Sherry on 16/12/26.
//  Copyright © 2016年 Sherry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadLoadingView : UIView

@property (strong, nonatomic)UIProgressView *progressView;
@property (assign, nonatomic)NSInteger allUploadCount;
@property (strong,nonatomic) UILabel *titleLabel;

- (void)resetProgressValue:(NSInteger)progressValue;
- (void)resetCompressProgressValue:(float)progressValue;
- (instancetype)initWithFrame:(CGRect)frame andWithTitle:(NSString *)title;
@end
