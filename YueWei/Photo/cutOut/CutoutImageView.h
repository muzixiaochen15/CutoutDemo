//
//  CutoutImageView.h
//  YueWei
//
//  Created by 李群 on 2021/1/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CutoutImageView : UIImageView
/// 橡皮擦宽度
@property (nonatomic, assign) CGFloat lineWidth;
/// 记录最终擦除位置
@property (nonatomic, assign) NSInteger lastShowIndex;
/// 原图数据
@property (nonatomic, strong) UIImage *originImage;
/// 任务图
@property (nonatomic, strong) UIImage *personImage;
/// 商品图
@property (nonatomic, strong) UIImage *goodsImage;
/// 是否是人物
@property (nonatomic, assign) BOOL isPerson;
/// 存在撤销数据
@property (nonatomic, copy) void(^updateRevokeStatus)(BOOL isCanRevoke);

/** 撤销（删）*/
- (void)revoke:(void(^)(BOOL isHead))completion;

/** 取消撤销 （改）*/
- (void)cancelRevoke:(void(^)(BOOL isEnd))completion;


@end

NS_ASSUME_NONNULL_END
