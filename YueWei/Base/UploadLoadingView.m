//
//  UploadLoadingView.m
//  YiQiXiuPersonal
//
//  Created by Sherry on 16/12/26.
//  Copyright © 2016年 Sherry. All rights reserved.
//

#import "UploadLoadingView.h"
#import "ConstantUI.h"
#import "CommUtils.h"

@implementation UploadLoadingView

- (instancetype)initWithFrame:(CGRect)frame andWithTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger backWidth = frame.size.width - 65 * 2;
        NSInteger backHeight = backWidth / 2;
        NSInteger progressWidth = backWidth - 2 * 20;
        NSInteger progressHeight = 5;
        UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(65,
                                                                     (CGRectGetHeight(frame) - backHeight) / 2,
                                                                     backWidth,
                                                                     backHeight)];
        [self addSubview:whiteView];
        whiteView.layer.cornerRadius = 5;
        whiteView.backgroundColor = [UIColor whiteColor];
        
        UIProgressView *progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(20,(whiteView.frame.size.height -  progressHeight) / 2 - 10, progressWidth, progressHeight)];
        [whiteView addSubview:progressView];
        progressView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#f4f4f4"];
        progressView.tintColor = [CommUtils changeToColorWithHexAndRgbString:kMainColorStr];
        _progressView = progressView;
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, progressView.frame.origin.y + 20,whiteView.frame.size.width , 20)];
        [whiteView addSubview:_titleLabel];
        _titleLabel.textColor = [CommUtils changeToColorWithHexAndRgbString:kMainColorStr];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = 1;
        _titleLabel.text = title;
    }
    return self;
}

- (void)resetProgressValue:(NSInteger)progressValue {
    CGFloat progress = 1.0 - (CGFloat)progressValue / (CGFloat)_allUploadCount;
    _progressView.progress = progress;
    if (progress == 1 || progressValue == -1) {
        [self removeFromSuperview];
    }
}

- (void)resetCompressProgressValue:(float)progressValue {
    _progressView.progress = progressValue;
    if (progressValue == 1 || progressValue == -1) {
        [self removeFromSuperview];
    }
}

@end
