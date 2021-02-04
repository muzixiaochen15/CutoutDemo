//
//  CutoutImageView.m
//  YueWei
//
//  Created by 李群 on 2021/1/28.
//

#import "CutoutImageView.h"
#import "TouchDrawModel.h"
#import "UIButton+Block.h"
#import "CommUtils.h"
#import "ConstantUI.h"

@interface CutoutImageView (){
    // 擦除开始image
//    UIImage *touchBeginImage;
}
/// 画板上所有点的集合（已显示 + 可撤销）
@property (nonatomic, strong) NSMutableArray * pointArray;
/// 按压点
@property (nonatomic, strong) UIView *touchPoint;
/// 蒙层
@property (nonatomic, strong) UIImageView *shadeView;
@end

@implementation CutoutImageView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.masksToBounds = YES;
        self.userInteractionEnabled = YES;
        
        [self addSubview:self.shadeView];
        self.shadeView.hidden = YES;
        
        _lastShowIndex = 0;
        [self addSubview:self.touchPoint];
        self.touchPoint.hidden = YES;
        
    }
    return self;
}

- (void)setIsPerson:(BOOL)isPerson{
    _isPerson = isPerson;
    if (isPerson) {
        self.image = _personImage?_personImage:self.image;
    }else{
        self.image = _goodsImage?_goodsImage:self.image;
    }
}

#pragma mark - public
- (NSMutableArray *)pointArray{
    if (!_pointArray) {
        _pointArray = [NSMutableArray array];
    }
    return _pointArray;
}

// 擦除点（增）
- (void)addPointModel:(TouchDrawModel *)model{
    //首先过滤掉撤销点
    if (_lastShowIndex < self.pointArray.count - 1||_lastShowIndex < 0) {
        NSMutableArray *nPointArray = [NSMutableArray array];
        for (TouchDrawModel *subModel in self.pointArray) {
            if (!subModel.hasRevoke) {
                [nPointArray addObject:subModel];
            }
        }
        self.pointArray = nPointArray;
    }
    _lastShowIndex = self.pointArray.count;
    NSLog(@"add = %ld", (long)_lastShowIndex);
    if (_updateRevokeStatus) {
        _updateRevokeStatus(YES);
    }
    
    //再新增
    [self.pointArray addObject:model];
}

// 撤销（删）
- (void)revoke:(void(^)(BOOL isHead))completion{
    if (!self.pointArray.count) {
        return;
    }
    if (_lastShowIndex >= 0&&_lastShowIndex < self.pointArray.count) {
        TouchDrawModel *revokeModel = self.pointArray[_lastShowIndex];
        revokeModel.hasRevoke = YES;
        _lastShowIndex--;
        NSLog(@"revoke = %ld", (long)_lastShowIndex);
        if (completion) {
            completion(_lastShowIndex >= 0? NO: YES);
        }
    }else{
        if (completion) {
            completion(YES);
        }
    }
    [self showLines];
}

//取消撤销 （改）
- (void)cancelRevoke:(void(^)(BOOL isEnd))completion{
    if (!self.pointArray.count) {
        return;
    }
    if (_lastShowIndex < self.pointArray.count - 1||_lastShowIndex == -1) {
        _lastShowIndex++;
        TouchDrawModel *revokeModel = self.pointArray[_lastShowIndex];
        revokeModel.hasRevoke = NO;
        NSLog(@"cancel_revoke = %ld", (long)_lastShowIndex);
        if (completion) {
            completion(_lastShowIndex < self.pointArray.count - 1? NO: YES);
        }
    }else{
        if (completion) {
            completion(YES);
        }
        return;
    }
    [self showLines];
}

- (void)showLines{
    if (!self.pointArray.count) {
        return;
    }
    self.image = self.originImage;
    for (TouchDrawModel * model in self.pointArray) {
        [self drawCutoutImageWithModel:model withImage:self.image];
    }
}

#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    self.touchPoint.center = currentPoint;
    self.touchPoint.hidden = NO;
    
    TouchDrawModel * model = [[TouchDrawModel alloc]initWithLineWidth:_lineWidth];
    [model.pointArray addObject:NSStringFromCGPoint(currentPoint)];
    [self addPointModel:model];
    
    self.shadeView.hidden = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    self.touchPoint.center = currentPoint;

    CGPoint previousPoint = [touch previousLocationInView:self];
    TouchDrawModel * model = [self.pointArray lastObject];
    [model.pointArray addObject:NSStringFromCGPoint(currentPoint)];
    
    // 描述痕迹
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO,  0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.shadeView.image drawInRect:self.bounds];
    CGContextSetLineWidth(context, self.lineWidth);
    CGContextSetStrokeColorWithColor(context, [CommUtils changeToColorWithHexAndRgbString:kMainColorStr withAlpha:0.2].CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);//kCGBlendModeSourceIn//kCGBlendModeSourceAtop//kCGBlendModeSourceOut
//    CGContextSetBlendMode(context, kCGBlendModeCopy);
    CGContextSetBlendMode(context, kCGBlendModeSourceOut);
    CGContextMoveToPoint(context, previousPoint.x, previousPoint.y);
    CGContextAddQuadCurveToPoint(context, previousPoint.x, previousPoint.y, currentPoint.x, currentPoint.y);
    CGContextStrokePath(context);
    UIImage *tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    self.shadeView.image = tmpImage;
    UIGraphicsEndImageContext();
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.touchPoint.hidden = YES;
    self.shadeView.hidden = YES;
    self.shadeView.image = nil;
    [self drawCutoutImageWithModel:self.pointArray.lastObject withImage:self.image];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.touchPoint.hidden = YES;
    self.shadeView.hidden = YES;
    self.shadeView.image = nil;
    [self drawCutoutImageWithModel:self.pointArray.lastObject withImage:self.image];
}

- (void)drawCutoutImageWithModel:(TouchDrawModel *)model withImage:(UIImage *)image{
    if (model.hasRevoke) {
        return;
    }
    UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [image drawInRect:self.bounds];
    CGContextSetLineWidth(context, model.lineWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGPoint previousPoint = CGPointFromString(model.pointArray.firstObject);
    for (NSString * pointStr in model.pointArray) {
        CGPoint currentPoint = CGPointFromString(pointStr);
        CGContextMoveToPoint(context, previousPoint.x, previousPoint.y);
        CGContextAddQuadCurveToPoint(context, previousPoint.x, previousPoint.y, currentPoint.x, currentPoint.y);
        previousPoint = currentPoint;
    }
    CGContextStrokePath(context);
    UIImage *tmpImage = UIGraphicsGetImageFromCurrentImageContext();
    if (_isPerson) {
        self.personImage = tmpImage;
    }else{
        self.goodsImage = tmpImage;
    }
    self.image = tmpImage;
    UIGraphicsEndImageContext();
}

- (UIView *)touchPoint{
    if (!_touchPoint) {
        _touchPoint = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
        _touchPoint.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:kMainColorStr];
        _touchPoint.layer.masksToBounds = YES;
        _touchPoint.layer.cornerRadius = 10;
        _touchPoint.layer.borderColor = [UIColor whiteColor].CGColor;
        _touchPoint.layer.borderWidth = 4;
    }
    return _touchPoint;
}

- (UIImageView *)shadeView{
    if (!_shadeView) {
        _shadeView = [[UIImageView alloc]initWithFrame:self.bounds];
        _shadeView.backgroundColor = [UIColor clearColor];
    }
    return _shadeView;
}

@end
