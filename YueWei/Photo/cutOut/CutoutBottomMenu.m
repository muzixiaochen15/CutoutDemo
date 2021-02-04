//
//  CutoutBottomMenu.m
//  YueWei
//
//  Created by 李群 on 2021/1/28.
//

#import "CutoutBottomMenu.h"
#import <Masonry/Masonry.h>
#import "CommUtils.h"
#import "ConstantUI.h"

@interface CutoutBottomMenu (){
    UIView *bgView;
    UIButton *revokeButton;
    UIButton *cancelRevokeBtn;
}
@end

@implementation CutoutBottomMenu

- (void)refreshRevokeBtnEnable:(BOOL)isRevokeAble
            cancelRevokeEnable:(BOOL)isCancelAble{
    if (isRevokeAble) {
        [revokeButton setImage:[UIImage imageNamed:@"cutout_revoke"] forState:UIControlStateNormal];
        revokeButton.userInteractionEnabled = YES;
    }else{
        [revokeButton setImage:[UIImage imageNamed:@"cutout_unRevoke"]  forState:UIControlStateNormal];
        revokeButton.userInteractionEnabled = NO;
    }
    if (isCancelAble) {
        [cancelRevokeBtn setImage:[UIImage imageNamed:@"cutout_cancelrevoke"] forState:UIControlStateNormal];
        cancelRevokeBtn.userInteractionEnabled = YES;
    }else{
        [cancelRevokeBtn setImage:[UIImage imageNamed:@"cutout_unCancelrevoke"] forState:UIControlStateNormal];
        cancelRevokeBtn.userInteractionEnabled = NO;
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:15];
        titleLabel.textColor = [CommUtils changeToColorWithHexAndRgbString:@"#111111"];
        titleLabel.text = @"橡皮擦";
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_offset(0);
            make.height.mas_offset(44);
        }];
        
        bgView = [UIView new];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.top.mas_offset(66);
            make.size.mas_equalTo(CGSizeMake(375 - 32, 28));
        }];
        
        revokeButton = [UIButton new];
        [revokeButton setImage:[UIImage imageNamed:@"cutout_unRevoke"]  forState:UIControlStateNormal];
        [revokeButton addTarget:self action:@selector(revokeButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:revokeButton];
        [revokeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(28, 28));
            make.left.mas_offset(0);
            make.centerY.mas_equalTo(bgView);
        }];
        revokeButton.userInteractionEnabled = NO;
        
        cancelRevokeBtn = [UIButton new];
        [cancelRevokeBtn setImage:[UIImage imageNamed:@"cutout_unCancelrevoke"] forState:UIControlStateNormal];
        [cancelRevokeBtn addTarget:self action:@selector(cancelRevokeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:cancelRevokeBtn];
        [cancelRevokeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_offset(CGSizeMake(28, 28));
            make.left.mas_equalTo(revokeButton.mas_right).mas_offset(14);
            make.centerY.mas_equalTo(bgView);
        }];
        cancelRevokeBtn.userInteractionEnabled = NO;
                
        UILabel *lineTitleLabel = [UILabel new];
        lineTitleLabel.backgroundColor = [UIColor whiteColor];
        lineTitleLabel.textAlignment = NSTextAlignmentRight;
        lineTitleLabel.font = [UIFont systemFontOfSize:12];
        lineTitleLabel.textColor = [CommUtils changeToColorWithHexAndRgbString:@"#333333"];
        lineTitleLabel.text = @"画笔";
        [bgView addSubview:lineTitleLabel];
        [lineTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(cancelRevokeBtn.mas_right).mas_offset(0);
            make.size.mas_offset(CGSizeMake(46, 17));
            make.centerY.mas_equalTo(bgView);
        }];
        
        UIView *line = [UIView new];
        line.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#EDEFF3"];
        [bgView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(lineTitleLabel.mas_right).mas_offset(20);
            make.centerY.mas_equalTo(bgView);
            make.size.mas_offset(CGSizeMake(195, 2));
        }];
        __block CGFloat sLeft = 16;
        for (int i = 0; i < 5; i++) {
            //背景
            UIView *scaleBgView = [UIView new];
            scaleBgView.backgroundColor = [UIColor whiteColor];
            [bgView addSubview:scaleBgView];
            __block CGFloat btnWidth = radius + (borderWidth * 2) * i + borderWidth * 2;
            [scaleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(bgView);
                make.left.mas_equalTo(lineTitleLabel.mas_right).mas_offset(sLeft);
                sLeft += (btnWidth + 28);
                make.size.mas_offset(CGSizeMake( btnWidth, btnWidth));
            }];
            scaleBgView.layer.masksToBounds = YES;
            scaleBgView.layer.cornerRadius = btnWidth/2.0;
            
            //刻度
            UIView *scaleView = [UIView new];
            scaleView.tag = 200 + i;
            if (i == 2) {
                scaleView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:kMainColorStr];
            }else{
                scaleView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#D9DBE4"];
            }
            [bgView addSubview:scaleView];
            [scaleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_offset(CGSizeMake(btnWidth - 4, btnWidth - 4));
                make.center.mas_equalTo(scaleBgView);
            }];
            scaleView.layer.masksToBounds = YES;
            scaleView.layer.cornerRadius = (btnWidth - 4)/2.0;
            
            UIButton *scaleBtn = [UIButton new];
            scaleBtn.tag = 100 + i;
            [scaleBtn addTarget:self action:@selector(scaleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [bgView addSubview:scaleBtn];
            [scaleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.center.mas_equalTo(scaleView);
                make.size.mas_offset(CGSizeMake(40, 40));
            }];
        }
    }
    return self;
}

- (void)addBackAndSaveBtn{
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:[UIImage imageNamed:@"editIcon_close"]  forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(bottomCloseBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_offset(0);
        make.size.mas_offset(CGSizeMake(52, 44));
    }];
    
    UIButton *saveBtn = [UIButton new];
    [saveBtn setImage:[UIImage imageNamed:@"editIcon_yes"]  forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(bottomSaveBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.mas_offset(0);
        make.size.mas_offset(CGSizeMake(52, 44));
    }];
}

- (void)bottomCloseBtnClicked:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(bottomCloseBtnClicked)]) {
        [_delegate bottomCloseBtnClicked];
    }
}

- (void)bottomSaveBtnClicked:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(bottomSaveBtnClicked)]) {
        [_delegate bottomSaveBtnClicked];
    }
}

static const CGFloat radius = 8;
static const CGFloat borderWidth = 2;
- (void)scaleBtnClicked:(UIButton *)button{
    //重置
    for (UIView *view in bgView.subviews) {
        if (view.tag >= 200) {
            view.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#D9DBE4"];
        }
    }
    
    //选中
    UIView *selectedView = [bgView viewWithTag:button.tag - 100 + 200];
    if (selectedView) {
        selectedView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:kMainColorStr];
    }
    
    //选择宽度
    CGFloat btnWidth = radius + (borderWidth * 2) * (button.tag - 100);
    if ([_delegate respondsToSelector:@selector(selectLineWidth:)]) {
        [_delegate selectLineWidth:btnWidth];
    }
}

- (void)revokeButtonClicked:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(revokeButtonClicked)]) {
        [_delegate revokeButtonClicked];
    }
}

- (void)cancelRevokeBtnClicked:(UIButton *)button{
    if ([_delegate respondsToSelector:@selector(cancelRevokeBtnClicked)]) {
        [_delegate cancelRevokeBtnClicked];
    }
}

@end
