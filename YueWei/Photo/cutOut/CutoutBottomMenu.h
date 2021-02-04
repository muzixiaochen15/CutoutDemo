//
//  CutoutBottomMenu.h
//  YueWei
//
//  Created by 李群 on 2021/1/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CutoutBottomMenuDelegate <NSObject>

/** 选择画笔宽度 */
- (void)selectLineWidth:(CGFloat)lineWidth;

/** 撤销 */
- (void)revokeButtonClicked;

/** 恢复撤销 */
- (void)cancelRevokeBtnClicked;

/** 关闭 */
- (void)bottomCloseBtnClicked;

/** 保存 */
- (void)bottomSaveBtnClicked;
@end


@interface CutoutBottomMenu : UIView
@property (nonatomic, weak) id<CutoutBottomMenuDelegate> delegate;

/** 添加撤销、保存按钮 */
- (void)addBackAndSaveBtn;
/** 刷新组件状态 */
- (void)refreshRevokeBtnEnable:(BOOL)isRevokeAble
            cancelRevokeEnable:(BOOL)isCancelAble;
@end

NS_ASSUME_NONNULL_END
