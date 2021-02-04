//
//  PhotoViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/27.
//

#import "PhotoViewController.h"
#import "ConstantUI.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <CoreImage/CoreImage.h>
#import <Photos/PHPhotoLibrary.h>
#import "TouchDrawModel.h"
#import "UIButton+Block.h"
#import <Masonry/Masonry.h>
#import "CutoutImageView.h"
#import "CutoutBottomMenu.h"
#import "CommUtils.h"
#import "AppDelegate.h"

@interface PhotoViewController ()<CutoutBottomMenuDelegate>{
    // 抠图对象
    CutoutImageView *imageView;
    // 切换按钮
    UIButton *personBtn;
    UIButton *goodsBtn;
}
//@property (nonatomic, strong) NSMutableArray * pointArray;                  //画板上所有点的集合
//@property (nonatomic, assign) BOOL isStart;
//@property (nonatomic, assign) BOOL isDrawing;                                  //是否正在绘制
//@property (nonatomic, assign) CGFloat lineWidth;
/// 菜单栏
@property (nonatomic, strong) CutoutBottomMenu *menu;
/// 切换按钮背景
@property (nonatomic, strong) UIView *topSelectedView;
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#EDEFF3"];
    [self addTopViews];
    [self addContentViews];
    [self addMenu];
}

- (void)addTopViews{
    self.navImageView.hidden = YES;
    UIView *cusSegment = [UIView new];
    cusSegment.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:@"#FFFFFF" withAlpha:0.9];
    [self.view addSubview:cusSegment];
    [cusSegment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_offset(STATUS_BAR_HEIGHT + 10);
        make.size.mas_offset(CGSizeMake(114, 32));
    }];
    cusSegment.layer.masksToBounds = YES;
    cusSegment.layer.cornerRadius = 16;
    
    _topSelectedView = [UIView new];
    _topSelectedView.backgroundColor = [CommUtils changeToColorWithHexAndRgbString:kMainColorStr];
    [cusSegment addSubview:_topSelectedView];
    [_topSelectedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(2);
        make.size.mas_offset(CGSizeMake(56, 28));
        make.centerY.mas_equalTo(cusSegment);
    }];
    _topSelectedView.layer.masksToBounds = YES;
    _topSelectedView.layer.cornerRadius = 14;
    
    personBtn = [UIButton new];
    [personBtn setTitle:@"人物" forState:UIControlStateNormal];
    [personBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    personBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [personBtn addTarget:self action:@selector(selectedPerson:) forControlEvents:UIControlEventTouchUpInside];
    [cusSegment addSubview:personBtn];
    [personBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_offset(0);
        make.width.mas_offset(57);
    }];
    personBtn.selected = YES;
    
    goodsBtn = [UIButton new];
    [goodsBtn setTitle:@"商品" forState:UIControlStateNormal];
    [goodsBtn setTitleColor:[CommUtils changeToColorWithHexAndRgbString:@"#111111"] forState:UIControlStateNormal];
    goodsBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    [goodsBtn addTarget:self action:@selector(selectedGoods:) forControlEvents:UIControlEventTouchUpInside];
    [cusSegment addSubview:goodsBtn];
    [goodsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_offset(0);
        make.width.mas_offset(57);
    }];
    goodsBtn.selected = NO;
    
    if (!_isFromEditor) {
        UIButton *backBtn = [UIButton new];
        backBtn.backgroundColor = [UIColor whiteColor];
        [backBtn setImage:[UIImage imageNamed:@"navBarReturn"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backBtn];
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(12);
            make.size.mas_offset(CGSizeMake(32, 32));
            make.top.mas_offset(STATUS_BAR_HEIGHT + 10);
        }];
        backBtn.layer.masksToBounds = YES;
        backBtn.layer.cornerRadius = 16;
        backBtn.layer.borderColor = [CommUtils changeToColorWithHexAndRgbString:@"#E9E9E9"].CGColor;
        backBtn.layer.borderWidth = 1.0;
        
        UIButton *saveBtn = [UIButton new];
        saveBtn.backgroundColor = [UIColor whiteColor];
        [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        [saveBtn setTitleColor:[CommUtils changeToColorWithHexAndRgbString:@"#111111"] forState:UIControlStateNormal];
        saveBtn.titleLabel.font = [UIFont boldSystemFontOfSize:13];
        [saveBtn addTarget:self action:@selector(saveBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:saveBtn];
        [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-12);
            make.size.mas_offset(CGSizeMake(64, 32));
            make.top.mas_offset(STATUS_BAR_HEIGHT + 10);
        }];
        saveBtn.layer.masksToBounds = YES;
        saveBtn.layer.cornerRadius = 16;
        saveBtn.layer.borderColor = [CommUtils changeToColorWithHexAndRgbString:@"#E9E9E9"].CGColor;
        saveBtn.layer.borderWidth = 1.0;
    }
}

- (void)addContentViews{
    UIImage *bgImage = [UIImage imageNamed:@"bg_mosaic"];
    UIImageView *bgImageView = [[UIImageView alloc]initWithImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)]];
    bgImageView.userInteractionEnabled = YES;
    [self.view addSubview:bgImageView];
    [bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_offset(0);
        make.top.mas_offset(NAVIGATIONBAR_HEIGHT + 17);
        make.bottom.mas_offset(-158 - 19);
    }];
    CGFloat topSpace = NAVIGATIONBAR_HEIGHT + 17;
    CGFloat bottomSpace = 158 + 19;
    UIImage *image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DA74B73B-463E-4A12-B127-BDCBCAA63462" ofType:@"jpg"]];
    CGFloat width = WIDTH_OF_SCREEN;
    CGFloat height = HEIGHT_OF_SCREEN - topSpace - bottomSpace;
    CGFloat nWidth = width;
    CGFloat nHeight = height;
    if (image) {
        if (image.size.width/image.size.height > width/height) {//宽为准
            nHeight = width/(image.size.width/image.size.height);
        }else{//高为准
            nWidth = image.size.width/image.size.height * height;
        }
    }
    imageView = [[CutoutImageView alloc]initWithFrame:CGRectMake((width - nWidth)/2, (height - nHeight)/2.0, nWidth, nHeight)];
    imageView.image = image;
    imageView.originImage = [image copy];
    imageView.contentMode = UIViewContentModeScaleToFill;
    [bgImageView addSubview:imageView];
    __weak typeof(self) weakSelf = self;
    imageView.updateRevokeStatus = ^(BOOL isCanRevoke) {
        if (isCanRevoke&&weakSelf) {
            [weakSelf.menu refreshRevokeBtnEnable:YES cancelRevokeEnable:NO];
        }
    };
    imageView.lineWidth = 16;
}

- (void)addMenu{
    _menu = [CutoutBottomMenu new];
    _menu.delegate = self;
    [self.view addSubview:_menu];
    [_menu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_offset(0);
        make.height.mas_offset(156);
    }];
    if (_isFromEditor) {
        [_menu addBackAndSaveBtn];
    }
}

#pragma mark - actions
- (void)selectedPerson:(UIButton *)button{
    if (button.selected) {
        return;
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    button.selected = YES;
    [goodsBtn setTitleColor:[CommUtils changeToColorWithHexAndRgbString:@"#111111"] forState:UIControlStateNormal];
    goodsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    goodsBtn.selected = NO;
    
    [self.view setNeedsUpdateConstraints];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        if (weakSelf) {
            [weakSelf.topSelectedView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(2);
            }];
            [weakSelf.view layoutIfNeeded];
        }
    }];
}

- (void)selectedGoods:(UIButton *)button{
    if (button.selected) {
        return;
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:14];
    button.selected = YES;
    [personBtn setTitleColor:[CommUtils changeToColorWithHexAndRgbString:@"#111111"] forState:UIControlStateNormal];
    personBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    personBtn.selected = NO;
    [self.view setNeedsUpdateConstraints];
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        if (weakSelf) {
            [weakSelf.topSelectedView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(56);
            }];
            [weakSelf.view layoutIfNeeded];
        }
    }];
}

- (void)backBtnClicked:(UIButton *)button{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveBtnClicked:(UIButton *)button{
    __weak typeof(self) weakSelf = self;
    [self photoAlbumAuthorizationStatus:^(NSInteger status) {
        if (weakSelf) {
            if (status == PHAuthorizationStatusAuthorized) {
                [weakSelf saveImage];
            } else{
                
            }
        }
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)photoAlbumAuthorizationStatus:(void(^)(NSInteger status))complete{
    //获取当前App的相册授权状态
    PHAuthorizationStatus authorizationStatus = [PHPhotoLibrary authorizationStatus];
    
    //判断授权状态
    if (authorizationStatus == PHAuthorizationStatusAuthorized) {  //已授权
        if (complete) {
            complete ( PHAuthorizationStatusAuthorized);
        }

    }else if(authorizationStatus == PHAuthorizationStatusNotDetermined) {  //首次装载APP
        
        //***系统相册权限弹框事件
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
                {
                    if (complete) {
                        // 用户拒绝，跳转到自定义提示页面
                        complete ( PHAuthorizationStatusDenied);
                    }
                }else if (status == PHAuthorizationStatusAuthorized){
                    
                    if (complete) {
                        // 用户授权，弹出相册对话框
                        complete ( PHAuthorizationStatusAuthorized);
                    }
                }
            });
        }];
    }else if (authorizationStatus == PHAuthorizationStatusDenied || authorizationStatus == PHAuthorizationStatusRestricted) {   //用户已拒绝
        if (complete) {
            complete ( PHAuthorizationStatusDenied);
        }
    }
}

- (void)saveImage{
    UIImage *image = imageView.image;
    if (image) {//统一转化为png
        NSData *imageData = UIImagePNGRepresentation(image);
        image = [UIImage imageWithData:imageData];
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contentInfo:), nil);
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contentInfo:(void *)contextInfo{
    NSLog(@"保存成功！");
    [[AppDelegate getAppDelegate]showFailedActivityView:@"保存成功" interval:1.5];
}

#pragma mark - CutoutBottomMenuDelegate
/** 选择画笔宽度 */
- (void)selectLineWidth:(CGFloat)lineWidth{
    imageView.lineWidth = lineWidth;
}

/** 撤销 */
- (void)revokeButtonClicked{
    __weak typeof(self) weakSelf = self;
    [imageView revoke:^(BOOL isHead) {
        if (weakSelf) {
            [weakSelf.menu refreshRevokeBtnEnable:!isHead cancelRevokeEnable:YES];
        }
    }];
}

/** 恢复撤销 */
- (void)cancelRevokeBtnClicked{
    __weak typeof(self) weakSelf = self;
    [imageView cancelRevoke:^(BOOL isEnd) {
        if (weakSelf) {
            [weakSelf.menu refreshRevokeBtnEnable:YES cancelRevokeEnable:!isEnd];
        }
    }];
}

// 关闭
- (void)bottomCloseBtnClicked{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 保存
- (void)bottomSaveBtnClicked{
    __weak typeof(self) weakSelf = self;
    [self photoAlbumAuthorizationStatus:^(NSInteger status) {
        if (weakSelf) {
            if (status == PHAuthorizationStatusAuthorized) {
                [weakSelf saveImage];
            } else{
                
            }
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        }
    }];
}


#pragma mark - delete code
#if 0
/*
 1.开启图形上下文
 2.绘制图片
 - 使用drowInRect或者drawAtPoint绘制图片(区别在哪儿？你可以先想一想)
  drawInRect是以rect作为图片绘制的区域，图片是以填充的方式被绘制在当前区域图片的大小，rect的宽高比和原图片的宽高比不同时会造成图片的变形
  drowAtPoint是以point作为图片绘制的起点，绘制的图片的大小依然是原图片的大小，不会使图片变形
 - 将layer渲染在当前上下文
 3.从当前上下文获取新的图片
 4.关闭上下文
 */

//生成图片，这里我们生成特定颜色的图片
+ (UIImage *)createImageColor:(UIColor *)color size:(CGSize)size {
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //绘制颜色区域
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [color setFill];
    [path fill];
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(ctx, color.CGColor);
//    CGContextFillRect(ctx, CGRectMake(0, 0, size.width, size.height));
    //从图形上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

//绘制图片为某一分辨率
+ (UIImage *)scaleImage:(UIImage *)image sclae:(CGFloat)scale {
    //确定压缩后的size
    CGFloat scaleWidth = image.size.width * scale;
    CGFloat scaleHeight = image.size.height * scale;
    CGSize scaleSize = CGSizeMake(scaleWidth, scaleHeight);
    //开启图形上下文
    UIGraphicsBeginImageContext(scaleSize);
    //绘制图片
    [image drawInRect:CGRectMake(0, 0, scaleWidth, scaleHeight)];
    //从图形上下文获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭图形上下文
    UIGraphicsEndImageContext();
    return newImage;
}

- (void)addGes{
    UIPanGestureRecognizer *ges = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [imageView addGestureRecognizer:ges];
}

#define clipWH 5
- (void)pan:(UIPanGestureRecognizer *)pan
{
//    if (pan.state == UIGestureRecognizerStateBegan) {
//
//    }else if (pan.state == UIGestureRecognizerStateChanged){
        // 获取当前触摸点
        CGPoint curP = [pan locationInView:imageView];
        UIImage *image = [self wipeView:imageView point:curP size:CGSizeMake(clipWH, clipWH)];
        imageView.image = image;
//    }else{
//
//    }
//    // 获取当前触摸点
//    CGPoint curP = [pan locationInView:imageView];
//
//    // 获取擦除的矩形范围
//    CGFloat wh = clipWH;
//    CGFloat x = curP.x - wh * 0.5;
//    CGFloat y = curP.y - wh * 0.5;
//    CGRect rect = CGRectMake(x, y, wh, wh);
//
//    // 开启位图上下文
//    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale);
//    // 获取当前上下文
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//
//    // 渲染控件
//    [imageView.layer renderInContext:ctx];
//    // 擦除上下文的某一部分
//    CGContextClearRect(ctx, rect);
//    // 生成一张图片
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    imageView.image = image;
//    // 关闭上下文
//    UIGraphicsEndImageContext();
}

// 擦除
- (UIImage *)wipeView:(UIImageView *)view
                point:(CGPoint)point
                 size:(CGSize)size {
    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    //获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //渲染
//    [view.layer renderInContext:ctx];
//    [view drawViewHierarchyInRect:view.bounds afterScreenUpdates:YES];
    [view.image drawInRect:view.bounds];
    //计算擦除的rect
    CGFloat clipX = point.x - size.width/2;
    CGFloat clipY = point.y - size.height/2;
    CGRect clipRect = CGRectMake(clipX, clipY, size.width, size.height);
    //将该区域设置为透明
    CGContextClearRect(ctx, clipRect);
    //获取新的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return newImage;
}


//- (void)writeImageToAlbum{
//    __weak typeof(self) weakSelf = self;
//    [self photoAlbumAuthorizationStatus:^(NSInteger status) {
//        if (weakSelf) {
//            if (status == PHAuthorizationStatusAuthorized) {
//                [weakSelf saveImage];
//            } else{
//
//            }
//        }
//    }];
//}

- (NSMutableArray *)pointArray{
    if (!_pointArray) {
        _pointArray = [NSMutableArray array];
    }
    return _pointArray;
}
#endif
#pragma mark - public
#if 0
- (void)startDrawing:(BOOL)start
{
    self.isStart = start;
}
- (void)clearLines
{
    imageView.image = nil;
    
    [self.pointArray removeAllObjects];

}
- (void)revoke
{
    if (!self.pointArray.count) return;
    
    [self.pointArray removeObject:self.pointArray.lastObject];
    
    imageView.image = nil;
    
    [self showLines];
}

- (void)showLines
{
    imageView.image = nil;
    
    if (!self.pointArray.count) return;
    
    CGPoint previousPoint;
    
    for (TouchDrawModel * model in self.pointArray) {

        UIGraphicsBeginImageContextWithOptions(imageView.frame.size, NO, [UIScreen mainScreen].scale);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [imageView.image drawAtPoint:CGPointZero];
        
        CGContextSetLineWidth(context, model.lineWidth);
        
        CGContextSetStrokeColorWithColor(context, model.lineColor.CGColor);
        
        CGContextSetLineCap(context, kCGLineCapRound);
        
        if(model.isEraser){
            
            CGContextSetBlendMode(context, kCGBlendModeClear);
        }
        
        previousPoint = CGPointFromString(model.pointArray.firstObject);

        for (NSString * pointStr in model.pointArray) {
            
            CGPoint currentPoint = CGPointFromString(pointStr);
            
            CGContextMoveToPoint(context, previousPoint.x, previousPoint.y);
            
            CGContextAddQuadCurveToPoint(context, previousPoint.x, previousPoint.y, currentPoint.x, currentPoint.y);
            
            previousPoint = currentPoint;
            
        }
        
        CGContextStrokePath(context);
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
    }
}
- (void)forbidDrawing
{
    self.isStart = NO;
}
#pragma mark - touch
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.isStart) return;
    
//    [_showTimer setFireDate:[NSDate distantFuture]];

    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:imageView];
    
    TouchDrawModel * model = [[TouchDrawModel alloc] initWithLineColor:[UIColor blueColor] lineWidth:_lineWidth isEraser:YES];

    [model.pointArray addObject:NSStringFromCGPoint(currentPoint)];
    
    [self.pointArray addObject:model];
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (!self.isStart) return;
    
    self.isDrawing = YES;
    
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:imageView];
    
    CGPoint previousPoint = [touch previousLocationInView:imageView];
    
    TouchDrawModel * model = [self.pointArray lastObject];
    
    [model.pointArray addObject:NSStringFromCGPoint(currentPoint)];
    
    UIGraphicsBeginImageContextWithOptions(imageView.frame.size, NO,  [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [imageView.image drawAtPoint:CGPointZero];
    CGContextSetLineWidth(context, self.lineWidth);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
//    if(_isEraserBlock()){
        
        CGContextSetBlendMode(context, kCGBlendModeClear);
//    }
    
    CGContextMoveToPoint(context, previousPoint.x, previousPoint.y);
    
    CGContextAddQuadCurveToPoint(context, previousPoint.x, previousPoint.y, currentPoint.x, currentPoint.y);
    
    CGContextStrokePath(context);
    
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.isDrawing == NO) return;
    
//    WS(weakSelf)
//
//    _showTimer = [NSTimer homedScheduledTimerWithTimeInterval:0.5 repeats:NO block:^(NSTimer *timer) {
//
//        weakSelf.isDrawing = NO;
//    }];
//    imageView.image = [self cutOutImage:imageView.image];
}
#endif

@end
