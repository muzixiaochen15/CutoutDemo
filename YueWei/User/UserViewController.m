//
//  UserViewController.m
//  YueWei
//
//  Created by 李群 on 2021/1/26.
//

#import "UserViewController.h"

@interface UserViewController (){
    UIImageView *imageView;
    UIImageView *imageView1;
}
@property (nonatomic, assign) CGPoint startP;
@property (nonatomic, strong) UIView *coverV;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleLabel.text = @"用户中心";
    self.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:17];
    self.lineLabel.hidden = YES;
    
    UIImage *cutOutImage = [self removeColorWithMinHueAngle:50 maxHueAngle:170 image:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1742463-102b639c4903fc34" ofType:@"webp"]]];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake((CGRectGetWidth([UIScreen mainScreen].bounds) - 200)/2.0, 100, 200, 200)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    imageView.image = cutOutImage;
    
    imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake((CGRectGetWidth([UIScreen mainScreen].bounds) - 200)/2.0, 400, 200, 200)];
    imageView1.contentMode = UIViewContentModeScaleAspectFit;
    imageView1.userInteractionEnabled = YES;
    [self.view addSubview:imageView1];
    imageView1.image = [self cutOutImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1742463-102b639c4903fc34" ofType:@"webp"]]];
    
    [self addPanGes];
    
    [self initWithRightButtonWithImage:[UIImage imageNamed:@"emoji_7"] name:@"刷新" isHorizon:NO];
    [self.rightButton addTarget:self action:@selector(refreshButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)refreshButtonClick{
    UIImage *cutOutImage = [self removeColorWithMinHueAngle:50 maxHueAngle:170 image:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1742463-102b639c4903fc34" ofType:@"webp"]]];
    imageView.image = cutOutImage;
    
    imageView1.image = [self cutOutImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1742463-102b639c4903fc34" ofType:@"webp"]]];
}

#pragma mark - 抠图方案一
- (UIImage *)removeColorWithMinHueAngle:(float)minHueAngle maxHueAngle:(float)maxHueAngle image:(UIImage *)originalImage{
    CIImage *image = [CIImage imageWithCGImage:originalImage.CGImage];
    CIContext *context = [CIContext contextWithOptions:nil];// kCIContextUseSoftwareRenderer : CPURender
    /** 注意
     *  UIImage 通过CIimage初始化，得到的并不是一个通过类似CGImage的标准UIImage
     *  所以如果不用context进行渲染处理，是没办法正常显示的
     */
    CIImage *renderBgImage = [self outputImageWithOriginalCIImage:image minHueAngle:minHueAngle maxHueAngle:maxHueAngle];
    CGImageRef renderImg = [context createCGImage:renderBgImage fromRect:image.extent];
    UIImage *renderImage = [UIImage imageWithCGImage:renderImg];
    return renderImage;
}

struct CubeMap {
    int length;
    float dimension;
    float *data;
};

- (CIImage *)outputImageWithOriginalCIImage:(CIImage *)originalImage minHueAngle:(float)minHueAngle maxHueAngle:(float)maxHueAngle{
    
    struct CubeMap map = createCubeMap(minHueAngle, maxHueAngle);
    const unsigned int size = 64;
    // Create memory with the cube data
    NSData *data = [NSData dataWithBytesNoCopy:map.data
                                        length:map.length
                                  freeWhenDone:YES];
    CIFilter *colorCube = [CIFilter filterWithName:@"CIColorCube"];
    [colorCube setValue:@(size) forKey:@"inputCubeDimension"];
    // Set data for cube
    [colorCube setValue:data forKey:@"inputCubeData"];
    
    [colorCube setValue:originalImage forKey:kCIInputImageKey];
    CIImage *result = [colorCube valueForKey:kCIOutputImageKey];
    
    return result;
}

struct CubeMap createCubeMap(float minHueAngle, float maxHueAngle) {
    const unsigned int size = 64;
    struct CubeMap map;
    map.length = size * size * size * sizeof (float) * 4;
    map.dimension = size;
    float *cubeData = (float *)malloc (map.length);
    float rgb[3], hsv[3], *c = cubeData;
    
    for (int z = 0; z < size; z++){
        rgb[2] = ((double)z)/(size-1); // Blue value
        for (int y = 0; y < size; y++){
            rgb[1] = ((double)y)/(size-1); // Green value
            for (int x = 0; x < size; x ++){
                rgb[0] = ((double)x)/(size-1); // Red value
                rgbToHSV(rgb,hsv);
                // Use the hue value to determine which to make transparent
                // The minimum and maximum hue angle depends on
                // the color you want to remove
                float alpha = (hsv[0] > minHueAngle && hsv[0] < maxHueAngle) ? 0.0f: 1.0f;
                // Calculate premultiplied alpha values for the cube
                c[0] = rgb[0] * alpha;
                c[1] = rgb[1] * alpha;
                c[2] = rgb[2] * alpha;
                c[3] = alpha;
                c += 4; // advance our pointer into memory for the next color value
            }
        }
    }
    map.data = cubeData;
    return map;
}

void rgbToHSV(float *rgb, float *hsv) {
    float min, max, delta;
    float r = rgb[0], g = rgb[1], b = rgb[2];
    float *h = hsv, *s = hsv + 1, *v = hsv + 2;
    
    min = fmin(fmin(r, g), b );
    max = fmax(fmax(r, g), b );
    *v = max;
    delta = max - min;
    if( max != 0 )
        *s = delta / max;
    else {
        *s = 0;
        *h = -1;
        return;
    }
    if( r == max )
        *h = ( g - b ) / delta;
    else if( g == max )
        *h = 2 + ( b - r ) / delta;
    else
        *h = 4 + ( r - g ) / delta;
    *h *= 60;
    if( *h < 0 )
        *h += 360;
}

#pragma mark - 抠图方案二
- (UIImage *)cutOutImage:(UIImage *)originImage{
    //我现在是用CubeMap实现，传的要消除的颜色的hsv范围是
    //创建透明背景图片

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(200, 200), NO, 0.0);

    UIImage *blank = UIGraphicsGetImageFromCurrentImageContext();

    UIGraphicsEndImageContext();

    //背景图片

    UIImage *backgroundImage = blank;

    //要消除的颜色的hsv值范围

    struct CubeMap myCube = createCubeMap(50, 170);//createCubeMap(0,41);

    NSData *myData = [[NSData alloc]initWithBytesNoCopy:myCube.data length:myCube.length freeWhenDone:true];

    //消除过程

    CIFilter *colorCubeFilter = [CIFilter filterWithName:@"CIColorCube"];

    [colorCubeFilter setValue:[NSNumber numberWithFloat:myCube.dimension] forKey:@"inputCubeDimension"];

    [colorCubeFilter setValue:myData forKey:@"inputCubeData"];

    [colorCubeFilter setValue:[CIImage imageWithCGImage:originImage.CGImage] forKey:kCIInputImageKey];

    //消除后的图片

    CIImage *outputImage = colorCubeFilter.outputImage;

    CIFilter *sourceOverCompositingFilter = [CIFilter filterWithName:@"CISourceOverCompositing"];

    [sourceOverCompositingFilter setValue:outputImage forKey:kCIInputImageKey];

    [sourceOverCompositingFilter setValue:[CIImage imageWithCGImage:backgroundImage.CGImage] forKey:kCIInputBackgroundImageKey];

    outputImage = sourceOverCompositingFilter.outputImage;

    struct CGImage *cgImage = [[CIContext contextWithOptions: nil]createCGImage:outputImage fromRect:outputImage.extent];

    //合成图
    return [UIImage imageWithCGImage:cgImage];
}

#pragma mark - 涂抹、擦除
- (void)addPanGes{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [imageView addGestureRecognizer:pan];
    
    UIPanGestureRecognizer *pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan1:)];
    [imageView1 addGestureRecognizer:pan1];
}
#define clipWH 10
- (void)pan:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
    }else{
        
    }
    // 获取当前触摸点
    CGPoint curP = [pan locationInView:imageView];
    
    // 获取擦除的矩形范围
    CGFloat wh = clipWH;
    CGFloat x = curP.x - wh * 0.5;
    CGFloat y = curP.y - wh * 0.5;
    CGRect rect = CGRectMake(x, y, wh, wh);
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, [UIScreen mainScreen].scale);
    // 获取当前上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 渲染控件
    [imageView.layer renderInContext:ctx];
    // 擦除上下文的某一部分
    CGContextClearRect(ctx, rect);
    // 生成一张图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    imageView.image = image;
    // 关闭上下文
    UIGraphicsEndImageContext();
}

#pragma mark - 擦除方案二
//拖动裁剪图片
- (void)pan1:(UIPanGestureRecognizer *)pan {
   //判断手势状态

   CGPoint curP = [pan locationInView:imageView1];

   if(pan.state == UIGestureRecognizerStateBegan){

      self.startP = curP;

   }else if(pan.state == UIGestureRecognizerStateChanged){

      CGFloat x = _startP.x;

      CGFloat y = _startP.y;

      CGFloat w = curP.x-self.startP.x;

      CGFloat h = curP.y-self.startP.y;

      CGRect rect = CGRectMake(x, y, w, h);

      //重新设定裁剪区域大小

      self.coverV.frame = rect;

      self.coverV.userInteractionEnabled = NO;

   }else if(pan.state == UIGestureRecognizerStateEnded){

      //滑动结束后对所选区域进行裁剪

      //设置画板大小

      UIGraphicsBeginImageContextWithOptions(imageView1.bounds.size, NO, [UIScreen mainScreen].scale);

      //设置裁剪区域

       UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:self.coverV.frame cornerRadius:CGRectGetHeight(self.coverV.frame)/3.0];//[UIBezierPath bezierPathWithRect:self.coverV.frame];

      //进行裁剪

      [clipPath addClip];

      //把当前的imageview渲染到画板上

      CGContextRef ctx = UIGraphicsGetCurrentContext();

      [imageView1.layer renderInContext:ctx];

      //从画板上生成所需要的图片

      UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

      //关闭上下文

      UIGraphicsEndImageContext();

      //移除遮盖区域

      [self.coverV removeFromSuperview];

      self.coverV = nil;

      //把图片设置到显示区域中

       imageView1.image = newImage;

   }

}

//以懒加载的形式创建裁剪区域

-(UIView *) coverV{

   if(_coverV == nil){

      //添加一个UIView

      UIView *coverV = [[UIView alloc] init];

      coverV.backgroundColor = [UIColor blackColor];

      coverV.alpha = 0.7;

      _coverV = coverV;

      [self.view addSubview:coverV];

   }

   return _coverV;

}

#pragma mark - 擦除

@end
