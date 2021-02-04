//
//  TouchDrawModel.m
//  YueWei
//
//  Created by 李群 on 2021/1/28.
//

#import "TouchDrawModel.h"

@implementation TouchDrawModel
- (instancetype)initWithLineWidth:(CGFloat)lineWidth{
    self = [super init];
    if (self) {
        self.lineWidth = lineWidth;
        self.pointArray = [NSMutableArray array];
    }
    return self;
}

@end
