//
//  TouchDrawModel.h
//  YueWei
//
//  Created by 李群 on 2021/1/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TouchDrawModel : NSObject
/// 该滑动操作下的所有点
@property (nonatomic, strong) NSMutableArray *pointArray;
/// 线宽
@property (nonatomic, assign) CGFloat lineWidth;
/// 已经撤销
@property (nonatomic, assign) BOOL hasRevoke;

- (instancetype)initWithLineWidth:(CGFloat)lineWidth;
@end

NS_ASSUME_NONNULL_END
