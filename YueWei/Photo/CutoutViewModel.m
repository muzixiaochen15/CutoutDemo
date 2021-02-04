//
//  CutoutViewModel.m
//  YueWei
//
//  Created by 李群 on 2021/1/29.
//

#import "CutoutViewModel.h"
#import "YiQiXiuHttpRequest.h"
#import "ConstantUI.h"
#import "AppDelegate.h"
#import "UIImage+ChangeImage.h"
#import "AFHTTPSessionManager.h"
#import "EqxLogoActvityView.h"
#import "CommUtils.h"

@interface CutoutViewModel ()

@property (nonatomic, strong) NSMutableDictionary *pagesDicM;

@property (nonatomic, strong)NSMutableDictionary *elementDicM;

@property (nonatomic, strong)NSMutableArray *elementArrayM;

/// 易企秀loading
@property (nonatomic, strong) EqxLogoActvityView *eqxActivityView;
@end


@implementation CutoutViewModel

- (instancetype)init{
    if (self = [super init]) {
        _elementArrayM = [[NSMutableArray alloc] init];
        _pagesDicM = [[NSMutableDictionary alloc] init];
        _elementDicM = [[NSMutableDictionary alloc] init];
        [_pagesDicM setObject:@(1) forKey:@"id"];
        [_pagesDicM setObject:@(1) forKey:@"sort"];
    }
    return self;
}

- (void)aiCutoutWithIsPerson:(BOOL)isPerson withImage:(UIImage *)image withCompletion:(void(^)(UIImage *image))completion{
    NSString *url;
    if (isPerson) {
        url = @"http://kotoapi.eqxiu.com/koto/person";
    }else{
        url = @"http://kotoapi.eqxiu.com/koto/general";
    }
    YiQiXiuHttpRequest *request = [[YiQiXiuHttpRequest alloc] init];
    [self.eqxActivityView showEqxLogoActivityWithText:@"智能抠图中..."];
    NSString *baseImgStr = [image base64String];
    if (!baseImgStr) {
        if (completion) {
            completion(nil);
        }
        [self.eqxActivityView endLoading];
        return;
    }
    NSDictionary *dic = @{@"img": baseImgStr};
    // 手动设置content-type类型
    request.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];;
    [request requestWithUrl:url isJsonData:YES mode:kRequestModePost postInfo:dic finishBlock:^(NSDictionary *jsonDic) {
        if (jsonDic&&jsonDic[@"image"]) {
            //Base64字符串转UIImage图片：
            NSString *base64ImageStr = [jsonDic[@"image"] stringByReplacingOccurrencesOfString:@"data:image/png;base64," withString:@""];
            NSData *decodedImageData = [[NSData alloc]initWithBase64EncodedString:base64ImageStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
            UIImage *decodedImage = [UIImage imageWithData:decodedImageData];
            if (completion) {
                completion(decodedImage);
            }
        }else{
            if (completion) {
                completion(nil);
            }
        }
        [self.eqxActivityView endLoading];
    }];
}

#pragma mark - 保存操作
- (void)createBlankLDSceneWithImage:(UIImage *)image witCompletion:(void(^)(void))completion{
    __weak typeof(self) weakSelf = self;
    YiQiXiuHttpRequest *request = [[YiQiXiuHttpRequest alloc] init];
    NSData *data = [NSJSONSerialization dataWithJSONObject:@{@"appToolType":@(5)} options:kNilOptions error:nil];
    NSString *propertyStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSDictionary *paramDic = @{@"height":@(image.size.height), @"width":@(image.size.width), @"title":@"智能抠图", @"unit":@"px",@"type":@(0),@"propertyStr":propertyStr};
    NSString *url = [NSString stringWithFormat:@"%@%@",kHeaderUrl,kLDCreateSceneUrl];
    [[AppDelegate getAppDelegate]showActivityView:@"保存中..."];
    [request requestWithUrl:url isJsonData:YES mode:kRequestModePost postInfo:paramDic finishBlock:^(NSDictionary *jsonDic) {
        if (jsonDic && [[jsonDic objectForKey:@"code"] integerValue] == 200) {
            NSDictionary *objDic = [jsonDic objectForKey:@"obj"];
            if ([objDic isKindOfClass:[NSDictionary class]]) {
                NSInteger tempSceneId = [[objDic objectForKey:@"id"] integerValue];
                weakSelf.sceneId = tempSceneId;
                //跳转进编辑
                if (completion) {
                    completion();
                }else{
                    [[AppDelegate getAppDelegate]hideActivityView];
                }
            }else{
                [[AppDelegate getAppDelegate]hideActivityView];

            }
        }else{
            [[AppDelegate getAppDelegate]hideActivityView];
        }
    }];
}

- (void)uploadCutoutImage:(UIImage *)image{
    if (!image) {
        [[AppDelegate getAppDelegate]hideActivityView];
        return;
    }
    NSString *imagePath = [self preareToSubmitImag:image imageName:@"LDCutoutImage.png"];
    [self submitHeadImage:imagePath withImage:image];
}

//图片上传
- (void)submitHeadImage:(NSString *)imagePath withImage:(UIImage *)image{
    NSDictionary *parameters = @{ @"bizType" : @"0", @"fileType" : @"1" };
    YiQiXiuHttpRequest *request = [[YiQiXiuHttpRequest alloc]init];
    __weak typeof(self) weakSelf = self;
    [request postImageWithImagePath:imagePath parameters:parameters finishBlock:^(NSDictionary *jsonDic) {
        if ([[jsonDic objectForKey:@"code"] integerValue] == 200) {
            NSDictionary *objDic = [jsonDic objectForKey:@"obj"];
            if ([objDic isKindOfClass:[NSDictionary class]]) {
                if ([[objDic objectForKey:@"path"] length] > 0) {
                    NSString *urlStr = [NSString stringWithFormat:@"%@",[objDic objectForKey:@"path"]];
                    if (urlStr.length > 0) {
                        [weakSelf.pagesDicM setObject:urlStr forKey:@"cover"];
                    }else{
                        [weakSelf.pagesDicM setObject:@"" forKey:@"cover"];
                    }
                    if (weakSelf.isCreate) {
                        [weakSelf saveAllElementWithImgUrl:urlStr withImage:image];
                    }else{
                        weakSelf.elementPathSrc = urlStr;
                        if (weakSelf&&[weakSelf.delegate respondsToSelector:@selector(pushToPreviewViewCWithPath:)]) {
                            [weakSelf.delegate pushToPreviewViewCWithPath:urlStr];
                        }
                        [[AppDelegate getAppDelegate]hideActivityView];
                    }
                }else{
                    [[AppDelegate getAppDelegate]hideActivityView];
                }
            }else{
                [[AppDelegate getAppDelegate]hideActivityView];
            }
        } else {
            NSString *str = @"submitImageFailed";
            [[AppDelegate getAppDelegate] showFailedActivityView:str interval:1.0];
        }
    }];
}

//1、上传无水印到七牛获取路径赋值给element
//2、在调用无水印token保存到服务器
//3、保存元素数据
//直接设置pureCover不需要1、2逻辑了
- (void)saveAllElementWithImgUrl:(NSString *)imgUrl withImage:(UIImage *)image{
    if (imgUrl&&imgUrl.length > 0) {
        [self createImageElementWithPath:imgUrl withImage:image];
        _elementPathSrc = imgUrl;
    }
    [_pagesDicM setObject:imgUrl forKey:@"pureCover"];
    __weak typeof(self) weakSelf = self;
    [self saveAllElementRequestWithId:_sceneId pageDic:_pagesDicM finishBlock:^(NSString * _Nonnull msg, BOOL isSuccess) {
        if (isSuccess) {
            [[AppDelegate getAppDelegate] hideActivityView];
            if (weakSelf&&[weakSelf.delegate respondsToSelector:@selector(pushToPreviewViewCWithPath:)]) {
                [weakSelf.delegate pushToPreviewViewCWithPath:imgUrl];
            }
        }else{
            [[AppDelegate getAppDelegate] showFailedActivityView:msg interval:1.5];
        }
    }];
}

- (void)saveAllElementRequestWithId:(NSInteger)sceneId pageDic:(NSDictionary *)pagesDic finishBlock:(void (^)(NSString *msg, BOOL isSuccess))finishBlock{
    YiQiXiuHttpRequest *request = [[YiQiXiuHttpRequest alloc] init];
    
    NSArray *pageArray = [NSArray arrayWithObjects:[self filterNullKeyWithDic:pagesDic], nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@?id=%ld",kHeaderUrl,kLightDesignSaveZipElementUrl,(long)sceneId];
    NSString *zipPageInfoStr = [CommUtils setDataForGzipDataWith:pageArray];
    NSDictionary *paramDic = @{@"requestBody":zipPageInfoStr};

    [request requestWithUrl:urlString isJsonData:YES mode:kRequestModePost postInfo:paramDic finishBlock:^(NSDictionary *jsonDic) {
        if (jsonDic && [[jsonDic objectForKey:@"code"] integerValue] == 200) {
            if (finishBlock) {
                finishBlock(@"",YES);
                
            }
        }else{
            if (finishBlock) {
                finishBlock(jsonDic[@"msg"],NO);
            }
        }
    }];
}

///过滤掉<"null">
- (NSMutableDictionary *)filterNullKeyWithDic:(NSDictionary *)originalDic{
    NSMutableDictionary *prunedDictionary = [NSMutableDictionary dictionary];
    for (NSString * key in [originalDic allKeys])
    {
        if (![[originalDic objectForKey:key] isKindOfClass:[NSNull class]]){
            [prunedDictionary setObject:[originalDic objectForKey:key] forKey:key];
            if ([[originalDic objectForKey:key] isKindOfClass:[NSString class]]) {
                if ([[originalDic objectForKey:key] isEqualToString:@"<null>"] || [[originalDic objectForKey:key] isEqualToString:@"elementsStr"] || [[originalDic objectForKey:key] isEqualToString:@"propertyStr"]) {
                    NSLog(@"------");
                }else{
                    [prunedDictionary setObject:[originalDic objectForKey:key] forKey:key];
                }
            }else{
                [prunedDictionary setObject:[originalDic objectForKey:key] forKey:key];
            }
        }
    }
    return prunedDictionary;
}

- (void)createImageElementWithPath:(NSString *)path withImage:(UIImage *)image{
    if (_elementArrayM.count > 0) {
        [_elementArrayM removeAllObjects];
    }
    NSMutableDictionary *elementDic = [self addImageElementWithImageRatio:0 andWithPageWidth:image.size.width andWithPageHeight:image.size.height imgPath:path];
    _elementDicM = elementDic;
    [_elementArrayM addObject:elementDic];
    [_pagesDicM setObject:_elementArrayM forKey:@"elements"];
}

- (NSMutableDictionary *)addImageElementWithImageRatio:(CGFloat)ratio andWithPageWidth:(CGFloat)pageWidth andWithPageHeight:(CGFloat)pageHeight imgPath:(NSString *)imgPath {
    NSMutableDictionary *muElementDic = [[NSMutableDictionary alloc]init];
    [muElementDic setObject:[NSNumber numberWithInteger:arc4random()%1000] forKey:@"id"];
    NSMutableDictionary *cssDic = [[NSMutableDictionary alloc]init];
    [muElementDic setObject:cssDic forKey:@"css"];
    [cssDic setObject:@"rgba(255,255,255,1)" forKey:@"borderColor"];
    [cssDic setObject:@"solid" forKey:@"borderStyle"];
    [cssDic setObject:@"0px" forKey:@"borderWidth"];
    [cssDic setObject:@"block" forKey:@"display"];
    [cssDic setObject:@"0" forKey:@"opacity"];
    [cssDic setObject:@"rotateZ(0deg)" forKey:@"transform"];
    [cssDic setObject:@"0px" forKey:@"left"];
    [cssDic setObject:@"0px" forKey:@"top"];
    [cssDic setObject:[NSString stringWithFormat:@"%ldpx", (long)pageHeight] forKey:@"height"];
    [cssDic setObject:[NSString stringWithFormat:@"%ldpx", (long)pageWidth] forKey:@"width"];
    [cssDic setObject:@(0) forKey:@"zIndex"];
    ///1.设置type值
    [muElementDic setObject:@(102) forKey:@"type"];
    NSMutableDictionary *propertyDic = [[NSMutableDictionary alloc]init];
    propertyDic[@"bgColor"] = @"rgba(0,0,0,0)";

    [muElementDic setObject:propertyDic forKey:@"property"];
    NSDictionary *dropShadowDic = @{@"blur":@"0",@"color":@"rgba(0,0,0,0.50)",@"transparency":@"50",@"x":@"0",@"y":@"0"};
    [propertyDic setObject:dropShadowDic forKey:@"dropShadow"];
    if ([imgPath isKindOfClass:[NSString class]] && imgPath.length > 0) {
        [propertyDic setObject:imgPath forKey:@"src"];
    }
    return muElementDic;
}

- (NSString *)preareToSubmitImag:(UIImage *)image imageName:(NSString *)imgName {
    NSArray *storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *imgDirectory = [NSString stringWithFormat:@"%@/Images", doucumentsDirectiory];
    BOOL haveconfOK = [fileMgr fileExistsAtPath:imgDirectory];
    NSError *error = nil;
    if (!haveconfOK) {
        BOOL isSetDirectory = [fileMgr createDirectoryAtPath:imgDirectory  withIntermediateDirectories:NO attributes:nil error:&error];
        
        if (!isSetDirectory) {
            NSLog(@"creat confDirectory faild");
        } else
            [CommUtils addSkipBackupAttributeToItemAtURL:[NSURL fileURLWithPath:imgDirectory]];
    }
    NSString *imagePath = [imgDirectory stringByAppendingPathComponent:imgName];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:imagePath atomically:YES];
    
    return imagePath;
}

#pragma mark - activity
- (EqxLogoActvityView *)eqxActivityView{
    if (!_eqxActivityView) {
        _eqxActivityView = [[EqxLogoActvityView alloc]init];
    }
    return _eqxActivityView;
}


@end
