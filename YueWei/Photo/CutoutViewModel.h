//
//  CutoutViewModel.h
//  YueWei
//
//  Created by 李群 on 2021/1/29.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CutoutViewModelDelegate <NSObject>

- (void)pushToPreviewViewCWithPath:(NSString *)path;

@end

@interface CutoutViewModel : NSObject

@property (nonatomic, weak) id<CutoutViewModelDelegate> delegate;
/// 空白作品id
@property (nonatomic, assign) NSInteger sceneId;

/// 无水印的存在元素中的图片地址
@property (nonatomic, strong) NSString *elementPathSrc;

/// 直接创建的完成后分享，编辑器添加的完成后返回编辑区
@property (nonatomic, assign)BOOL isCreate;

/** 智能抠图 */
- (void)aiCutoutWithIsPerson:(BOOL)isPerson
                   withImage:(UIImage *)image
              withCompletion:(void(^)(UIImage *image))completion;
/** 抠图保存 */
- (void)createBlankLDSceneWithImage:(UIImage *)image
                      witCompletion:(void(^)(void))completion;
/** 保存抠图 */
- (void)uploadCutoutImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
