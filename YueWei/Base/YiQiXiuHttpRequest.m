//
//  YiQiXiuHttpRequest.m
//  YiQiXiu
//
//  Created by Sherry on 14-10-14.
//  Copyright (c) 2014年 Sherry. All rights reserved.
//

#import "YiQiXiuHttpRequest.h"
#import "ConstantUI.h"
#import "AppDelegate.h"
#import "CommUtils.h"

@interface YiQiXiuHttpRequest () {
    ///download请求
    BOOL isDownloadReq;
}
@end

@implementation YiQiXiuHttpRequest

- (YiQiXiuHttpRequest *)init
{
    self=[super init];
    if(self){
        _urlNeedReturnDic = [[NSMutableDictionary alloc] init];
        _manager = [[AFHTTPSessionManager alloc]initWithBaseURL:nil sessionConfiguration:nil];
        
        _httpSerializer = [AFHTTPRequestSerializer serializer];
        _jsonSerializer = [AFJSONRequestSerializer serializer];

        _headerDic = [NSMutableDictionary dictionary];
        [_headerDic setObject:@"http://eqxiu.com" forKey:@"Referer"];
        [_headerDic setObject:@"http://eqxiu.com" forKey:@"Origin"];

        _downloadManager = [[AFHTTPSessionManager alloc]initWithBaseURL:nil sessionConfiguration:nil];
        _downloadManager.responseSerializer  = [AFHTTPResponseSerializer serializer];
        [_downloadManager.requestSerializer setTimeoutInterval:30];
    }
    return self;
}

- (void)setHeaderValuesWithDic:(NSDictionary *)dic {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userIdStr = [defaults objectForKey:@"userId"];
    if (userIdStr && [userIdStr isKindOfClass:[NSString class]] && userIdStr.length > 0) {
        [_headerDic setObject:[defaults objectForKey:@"userId"] forKey:@"tracker-user-id"];
    } else {
        [_headerDic removeObjectForKey:@"tracker-user-id"];
    }
    
    NSString *uuid = [[NSUUID UUID] UUIDString];
    [_headerDic setObject:uuid forKey:@"Device-Number"];
    
    NSString *kStr = @"";
    for (NSInteger i = 0; i < kTXMusicKey.length; i++) {
        if (i % 2 == 0) {
            NSRange range = NSMakeRange(i, 1);
            kStr = [NSString stringWithFormat:@"%@%@",kStr,[kTXMusicKey substringWithRange:range]];
        }
    }
//    NSString *diviceSig = nil;
//    if (dic && [dic isKindOfClass:[NSDictionary class]]) {
//        NSString *account = [NSString stringWithFormat:@"%@",[dic objectForKey:@"username"]];
//        NSString *pwd = [NSString stringWithFormat:@"%@",[dic objectForKey:@"password"]];
//        diviceSig = [[[NSString stringWithFormat:@"%@%@%ld%@%@%@%@",account,[CommUtils getUserAgent],(long)kChannel,uuid,[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey],kStr,pwd] MD5] uppercaseString];
//    } else {
//        diviceSig = [[[NSString stringWithFormat:@"%@%ld%@%@%@",[CommUtils getUserAgent],(long)kChannel,uuid,[[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"] ?: [[NSBundle mainBundle] infoDictionary][(__bridge NSString *)kCFBundleVersionKey],kStr] MD5] uppercaseString];
//    }
//    [_headerDic setObject:diviceSig forKey:@"Device-Sig"];
}

- (void)otherHeaderPrametersAddToHeader:(NSDictionary *)headerFieldDic {
    if (headerFieldDic && [headerFieldDic isKindOfClass:[NSDictionary class]] && headerFieldDic.count > 0) {
        for (NSString *key in headerFieldDic.keyEnumerator) {
            id headerObj = [headerFieldDic objectForKey:key];
            [_headerDic setObject:headerObj forKey:key];
        }
    }
}

- (void)otherHeaderPrametersDeleteFromHeader:(NSDictionary *)headerFieldDic {
    if (headerFieldDic && [headerFieldDic isKindOfClass:[NSDictionary class]] && headerFieldDic.count > 0) {
        for (NSString *key in headerFieldDic.keyEnumerator) {
            [_headerDic removeObjectForKey:key];
        }
    }
}

//默认10s的数据请求
- (void)requestWithUrl:(NSString *)urlString
                  mode:(RequestSubmission)mode
              postInfo:(id)info
           finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock{
    [self requestWithUrl:urlString isJsonData:NO mode:mode postInfo:info timeOutInterval:10 HTTPHeaderField:nil finishBlock:finishBlock];
}

//带timeOutInterval参数
- (void)requestWithUrl:(NSString *)urlString
      timeOutInterval:(NSTimeInterval)timeOutInterval
                 mode:(RequestSubmission)mode
             postInfo:(id)info
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self requestWithUrl:urlString isJsonData:NO mode:mode postInfo:info timeOutInterval:timeOutInterval HTTPHeaderField:nil finishBlock:finishBlock];
}

- (void)requestWithUrl:(NSString *)urlString
           isJsonData:(BOOL)isJsonData
                 mode:(RequestSubmission)mode
             postInfo:(id)info
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self requestWithUrl:urlString isJsonData:isJsonData mode:mode postInfo:info timeOutInterval:10 HTTPHeaderField:nil finishBlock:finishBlock];
}

- (void)requestWithUrl:(NSString *)urlString
           isJsonData:(BOOL)isJsonData
      timeOutInterval:(NSTimeInterval)timeOutInterval
                 mode:(RequestSubmission)mode
             postInfo:(id)info
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self requestWithUrl:urlString isJsonData:isJsonData mode:mode postInfo:info timeOutInterval:timeOutInterval HTTPHeaderField:nil finishBlock:finishBlock];
}


- (void)requestWithUrl:(NSString *)urlString
           isJsonData:(BOOL)isJsonData
                 mode:(RequestSubmission)mode
             postInfo:(id)info
      timeOutInterval:(NSTimeInterval)timeOutInterval
      HTTPHeaderField:(NSDictionary *)headerFieldDic
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    urlString = [urlString stringByReplacingOccurrencesOfString:@" " withString:@""];
    if (isJsonData) {
        _manager.requestSerializer = _jsonSerializer;
    } else {
        _manager.requestSerializer = _httpSerializer;
    }
    [_manager.requestSerializer setTimeoutInterval:timeOutInterval];

    //设置请求头的数据设置
    if ([urlString isEqualToString:[NSString stringWithFormat:@"%@%@",kUerServiceHeaderUrl,kLoginURL]]) {
        [self setHeaderValuesWithDic:(NSDictionary *)info];
    } else {
        [self setHeaderValuesWithDic:nil];
    }
    [self otherHeaderPrametersAddToHeader:headerFieldDic];
    
    if (_isNeedReturnNoRoot) {
        [_urlNeedReturnDic setObject:@"1" forKey:urlString];
    }
    _isNeedReturnNoRoot = NO;
    [self setCookieWithJSESSIONID];
    urlString = [self urlStringWithChannelIdAndVersion:urlString];
    switch (mode) {
        case kRequestModePost:{
            [_manager POST:urlString parameters:info headers:_headerDic progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self jsonDicParserWithDic:responseObject urlString:urlString postInfo:info finishBlock:finishBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:response.statusCode],@"code", nil];
                [self jsonDicParserWithDic:jsonDic urlString:urlString postInfo:info finishBlock:finishBlock];
            }];
        }
            break;
        case kRequestModeGet: {
            [_manager GET:urlString parameters:info headers:_headerDic progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self jsonDicParserWithDic:responseObject urlString:urlString postInfo:info finishBlock:finishBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:response.statusCode],@"code", nil];
                [self jsonDicParserWithDic:jsonDic urlString:urlString postInfo:info finishBlock:finishBlock];
            }];
        }
            break;
        default:
            break;
    }
    [self otherHeaderPrametersDeleteFromHeader:headerFieldDic];
}

- (void)jsonDicParserWithDic:(NSDictionary *)tempJsonDic
                   urlString:(NSString *)urlString
                    postInfo:(id )info
                 finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    if (![tempJsonDic isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    if ([urlString rangeOfString:kBigDataBuriedUrl].location != NSNotFound) {
        return;
    }
    
    if ([[tempJsonDic objectForKey:@"code"] integerValue] == 200) {
        if (finishBlock){
            finishBlock(tempJsonDic);
        }
    } else {
        NSMutableDictionary *jsonDic = [NSMutableDictionary dictionaryWithDictionary:tempJsonDic];
     
        NSString *msgStr = [tempJsonDic objectForKey:@"msg"];
        if (![msgStr isKindOfClass:[NSString class]] || msgStr.length == 0) {
            msgStr = @"获取失败，请重试";
            [jsonDic setObject:msgStr forKey:@"msg"];
        }
        
        NSString  *codeStr = [jsonDic objectForKey:@"code"];
        if ([codeStr isKindOfClass:[NSNull class]] || codeStr == nil) {
            codeStr = @"110";
        }

        if ([[jsonDic objectForKey:@"code"] integerValue] == 401) {
//            if ([AppDelegate getAppDelegate].isLogin) { //现在显示的是登录的状态，正常来讲，接口在未登录的状态下不应该调用，此处容错不治标
//                [[NSNotificationCenter defaultCenter] postNotificationName:kAppExitLogin object:@"2"];
//            }
            [[AppDelegate getAppDelegate] showFailedActivityView:@"未登录状态，请先登录" interval:1.0];
        } else if ([[jsonDic objectForKey:@"code"] integerValue] == 403) {
            [[AppDelegate getAppDelegate] hideActivityView];
            if ([[_urlNeedReturnDic objectForKey:urlString] integerValue] == 1) {//需要返回
                if (finishBlock){
                    finishBlock(jsonDic);
                }
            } else {//不需要返回，直接弹框、加上子账号判断，避免其他非子账号类型提示授权
                NSInteger userType = [[[NSUserDefaults standardUserDefaults] objectForKey:@"userType"] integerValue];
                if (userType == 21) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"你还没有操作权限" message:@"请联系主账为帮您开启权限" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                    [alertView show];
                }
            }
        } else {
            if (finishBlock) {
                finishBlock(jsonDic);
            }
        }
    }
}

//接口加channel和version
- (NSString *)urlStringWithChannelIdAndVersion:(NSString *)urlString {
    NSString *newUrlString ;
    if ([urlString rangeOfString:@"?"].location == NSNotFound) {
        newUrlString = [NSString stringWithFormat:@"%@?channel=%ld&version=%@",urlString,kChannel,[CommUtils getBundleVersion]];
    } else {
        newUrlString = [NSString stringWithFormat:@"%@&channel=%ld&version=%@",urlString,kChannel,[CommUtils getBundleVersion]];
    }
    return newUrlString;
}

- (void)QNTokenIsAvailable:(void (^)(BOOL isAvailable))QNTokenState {
    [[QNGetTokenRequest shareQNManager] whetherToCallQNTokenWithType:@"image"];
    if ([QNGetTokenRequest shareQNManager].isUpload) {//这时可用
        if (QNTokenState) {
            QNTokenState(YES);
        }
    } else {
        [QNGetTokenRequest shareQNManager].qnRequestBlock = ^(BOOL isSuccess){
            if (QNTokenState) {
                QNTokenState(isSuccess);
            }
        };
    }
}

//获取图片七牛token
- (void)postImageWithImagePath:(NSString *)imagePath
                    parameters:(NSDictionary *)parameters
                   finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self setCookieWithJSESSIONID];
    _manager.requestSerializer = _httpSerializer;
    [_manager.requestSerializer setTimeoutInterval:30];
    [[QNGetTokenRequest shareQNManager] whetherToCallQNTokenWithType:_isNoWaterMark?@"noWaterMark":@"image"];
    if ([QNGetTokenRequest shareQNManager].isUpload) {
        [self uploadImageWithImagePath:imagePath parameters:parameters finishBlock:finishBlock];
    } else {
        [QNGetTokenRequest shareQNManager].qnRequestBlock = ^(BOOL isSuccess){
            if (isSuccess) {
                [self uploadImageWithImagePath:imagePath parameters:parameters finishBlock:finishBlock];
            } else {
                finishBlock(nil);
            }
        };
    }
}

//图片上传
- (void)uploadImageWithImagePath:(NSString *)imagePath
                      parameters:(NSDictionary *)parameters
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    _manager.requestSerializer = _httpSerializer;
    NSString *QNToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"image_QNToken"];
    if (_isNoWaterMark) {
        QNToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"noWaterMark_QNToken"];
    }
    [[QNGetTokenRequest shareQNManager] uploadImageWithImagePath:imagePath token:QNToken finishBlock:^(NSDictionary *jsonDic) {
        NSString *uploadImageUrl = [NSString stringWithFormat:@"%@%@",kHeaderUrl,kSaveQNInfoUrl];
        NSString *newUrlString = [self urlStringWithChannelIdAndVersion:uploadImageUrl];
        if ([jsonDic isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *parameterDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
            
            NSInteger size;
            if ([jsonDic objectForKey:@"size"]) {
                size = [[jsonDic objectForKey:@"size"] integerValue];
                [parameterDic setObject:[NSNumber numberWithInteger:size/1024] forKey:@"size"];
            }
            if ([jsonDic objectForKey:@"key"]) {
                [parameterDic setObject:[NSString stringWithFormat:@"%@",[jsonDic objectForKey:@"key"]] forKey:@"path"];
                [parameterDic setObject:[NSString stringWithFormat:@"%@",[jsonDic objectForKey:@"key"]] forKey:@"tmbPath"];
            }
            if ([jsonDic objectForKey:@"name"]) {
                [parameterDic setObject:[NSString stringWithFormat:@"%@",[jsonDic objectForKey:@"name"]] forKey:@"name"];
            }
            NSInteger myMyMaterialGroupId = [[[NSUserDefaults standardUserDefaults] objectForKey:@"MyMyMaterialGroupId"] integerValue];
            if (myMyMaterialGroupId > 0) {
                [parameterDic setObject:@(myMyMaterialGroupId) forKey:@"tagId"];
            }
            if (!_isNoWaterMark) {
                if (_isNeedNotSaveToMine) {
//                不需要上传到素材库图片，直接使用七牛返回的路径
                    if (finishBlock){
                        finishBlock(jsonDic);
                    }
                } else {
                    [_manager POST:newUrlString parameters:parameterDic headers:_headerDic progress:^(NSProgress * _Nonnull uploadProgress) {

                    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                        [self jsonDicParserWithDic:responseObject urlString:newUrlString postInfo:parameterDic finishBlock:finishBlock];
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                        NSDictionary *jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:response.statusCode],@"code", nil];
                        [self jsonDicParserWithDic:jsonDic urlString:newUrlString postInfo:parameterDic finishBlock:finishBlock];
                    }];
                }
            } else {
//                无水印图片不上传到素材库，直接使用七牛返回的路径
                if (finishBlock){
                    finishBlock(jsonDic);
                }
            }
        } else {
            if (finishBlock){
                finishBlock(jsonDic);
            }
        }
    }];
}

//画中画缩略图上传到七牛服务，不同步到“我的图片”
- (void)pipPostImageWithImagePath:(NSString *)imagePath
                      finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self setCookieWithJSESSIONID];
    _manager.requestSerializer = _httpSerializer;
    [_manager.requestSerializer setTimeoutInterval:10];
    [[QNGetTokenRequest shareQNManager] whetherToCallQNTokenWithType:@"image"];
    if ([QNGetTokenRequest shareQNManager].isUpload) {
        [self pipUploadImageWithImagePath:imagePath finishBlock:finishBlock];
    } else {
        [QNGetTokenRequest shareQNManager].qnRequestBlock = ^(BOOL isSuccess){
            if (isSuccess) {
                [self pipUploadImageWithImagePath:imagePath finishBlock:finishBlock];
            }
            else{
                finishBlock(nil);
            }
        };
    }
}

- (void)pipUploadImageWithImagePath:(NSString *)imagePath
                        finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    _manager.requestSerializer = _httpSerializer;
    NSString *QNToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"image_QNToken"];
    [[QNGetTokenRequest shareQNManager] uploadImageWithImagePath:imagePath token:QNToken finishBlock:^(NSDictionary *jsonDic) {
        if (finishBlock) {
            finishBlock(jsonDic);
        }
    }];
}

- (void)getImageWithImagePath:(NSString *)imagePath parameters:(NSDictionary *)parameters fininshBlock:(void(^)(NSDictionary *jsonDic))finishBlock {
    NSString *newUrlString = [self urlStringWithChannelIdAndVersion:imagePath];
    [_manager GET:newUrlString parameters:parameters headers:_headerDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self jsonDicParserWithDic:responseObject urlString:newUrlString postInfo:parameters finishBlock:finishBlock];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
        NSDictionary *jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:response.statusCode],@"code", nil];
        [self jsonDicParserWithDic:jsonDic urlString:newUrlString postInfo:parameters finishBlock:finishBlock];
    }];
}

//获取音频七牛token
- (void)postMusicWithMusicPath:(NSString *)musicPath
                     musicName:(NSString *)musicName
                    parameters:(NSDictionary *)parameters
                   finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self setCookieWithJSESSIONID];
    _manager.requestSerializer = _httpSerializer;
    [_manager.requestSerializer setTimeoutInterval:30];
    [[QNGetTokenRequest shareQNManager]whetherToCallQNTokenWithType:@"audio"];
    if ([QNGetTokenRequest shareQNManager].isUpload) {
        [self uploadMusicWithMusicPath:musicPath musicName:musicName parameters:parameters finishBlock:finishBlock];
    } else {
        [QNGetTokenRequest shareQNManager].qnRequestBlock = ^(BOOL isSuccess){
            if (isSuccess) {
                [self uploadMusicWithMusicPath:musicPath musicName:musicName parameters:parameters finishBlock:finishBlock];
            }
        };
    }
}

//音频上传
- (void)uploadMusicWithMusicPath:(NSString *)musicPath
                       musicName:(NSString *)musicName
                      parameters:(NSDictionary *)parameters
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    NSString *QNToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"audio_QNToken"];
    [_manager.requestSerializer setTimeoutInterval:30];
    [[QNGetTokenRequest shareQNManager] uploadMusicWithMusicPath:musicPath musicName:musicName token:QNToken finishBlock:^(NSDictionary *jsonDic) {
        NSString *uploadMusicUrl = [NSString stringWithFormat:@"%@%@",kHeaderUrl,kSaveQNInfoUrl];
        NSString *newUrlString = [self urlStringWithChannelIdAndVersion:uploadMusicUrl];
        NSMutableDictionary *parameterDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
        if ([jsonDic isKindOfClass:[NSDictionary class]]) {
            NSInteger size  ;
            if ([jsonDic objectForKey:@"size"]) {
                size = [[jsonDic objectForKey:@"size"] integerValue];
                [parameterDic setObject:[NSNumber numberWithInteger:size/1024] forKey:@"size"];
            }
            if ([jsonDic objectForKey:@"key"]) {
                [parameterDic setObject:[jsonDic objectForKey:@"key"] forKey:@"path"];
            }
            [parameterDic setObject:[NSString stringWithFormat:@"%@.mp3",musicName] forKey:@"name"];
        
            [_manager POST:newUrlString parameters:parameterDic headers:_headerDic progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self jsonDicParserWithDic:responseObject urlString:newUrlString postInfo:parameters finishBlock:finishBlock];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                NSDictionary *jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:response.statusCode],@"code", nil];
                [self jsonDicParserWithDic:jsonDic urlString:newUrlString postInfo:parameters finishBlock:finishBlock];
            }];
        }
    }];
}

//获取视频七牛token
- (void)postVideoWithVideoPath:(NSString *)videoPath
                     videoName:(NSString *)videoName
                    parameters:(NSDictionary *)parameters
                   finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    [self setCookieWithJSESSIONID];
    [_manager.requestSerializer setTimeoutInterval:30];
    [[QNGetTokenRequest shareQNManager]whetherToCallQNTokenWithType:@"video"];
    [QNGetTokenRequest shareQNManager].qnRequestBlock = ^(BOOL isSuccess){
        [self uploadVideoWithVideoPath:videoPath videoName:videoName parameters:parameters finishBlock:finishBlock];
    };
    if ([QNGetTokenRequest shareQNManager].isUpload) {
        [self uploadVideoWithVideoPath:videoPath videoName:videoName parameters:parameters finishBlock:finishBlock];
    }
}

//视频上传
- (void)uploadVideoWithVideoPath:(NSString *)videoPath
                       videoName:(NSString *)videoName
                      parameters:(NSDictionary *)parameters
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    NSString *QNToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"video_QNToken"];
    [[QNGetTokenRequest shareQNManager] uploadVideoWithVideoPath:videoPath videoName:videoName token:QNToken finishBlock:^(NSDictionary *jsonDic) {
        if ([jsonDic isKindOfClass:[NSDictionary class]] && jsonDic.count > 0) {
            if ([jsonDic isKindOfClass:[NSDictionary class]] && jsonDic.count > 0) {
                NSInteger size = [[jsonDic objectForKey:@"size"] integerValue];
                NSString *uploadMusicUrl = [NSString stringWithFormat:@"%@%@",kHeaderUrl,kSaveQNInfoUrl];
                NSMutableDictionary *parameterDic = [NSMutableDictionary dictionaryWithDictionary:parameters];
                NSString *path = [jsonDic objectForKey:@"key"];
                if ([path isKindOfClass:[NSString class]] && path.length > 0) {
                    [parameterDic setObject:[jsonDic objectForKey:@"key"] forKey:@"path"];
                }
                [parameterDic setObject:[NSString stringWithFormat:@"%@.mp4",videoName] forKey:@"name"];
                [parameterDic setObject:[NSNumber numberWithInteger:size/1024] forKey:@"size"];
                [_manager POST:uploadMusicUrl parameters:parameterDic headers:_headerDic progress:^(NSProgress * _Nonnull uploadProgress) {
                    
                } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                    [self jsonDicParserWithDic:responseObject urlString:uploadMusicUrl finishBlock:finishBlock];
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    NSHTTPURLResponse *response = (NSHTTPURLResponse *)task.response;
                    NSDictionary *jsonDic = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:response.statusCode],@"code", nil];
                    [self jsonDicParserWithDic:jsonDic urlString:uploadMusicUrl finishBlock:finishBlock];
                }];
            }
            
        }
    }];
}

//html解析
- (void)htmlGetWithUrl:(NSString *)URLString
            parameters:(id)parameters
           finishBlock:(void (^)(NSString *htmlStr))finishBlock {
    [_manager.requestSerializer setTimeoutInterval:10];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self setCookieWithJSESSIONID];

    [_manager GET:URLString parameters:parameters headers:_headerDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        if (finishBlock ) {
            finishBlock(result);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (finishBlock ) {
            finishBlock(nil);
        }
    }];
}

- (void)downloadPreFontUrl:(NSString *)urlString
                parameters:(id)parameters
                 savedPath:(NSString*)savedPath
                  fileName:(NSString *)fileName
                  progress:(void (^)(float progress))progress
                   success:(void(^) (BOOL state,NSString * message,NSString * filePath))completion {
    isDownloadReq = YES;
    NSString *urlStr = [self urlStringWithChannelIdAndVersion:urlString];
    [self setCookieWithJSESSIONID];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",urlStr]]];
    [self setRequestHeader:request];
    NSURLSessionDownloadTask *task = [_downloadManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            float p = downloadProgress.fractionCompleted;
            progress(p);
        }];
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载到哪个文件夹
        return [NSURL fileURLWithPath:savedPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        //下载完成了
        //        NSLog(@"下载完成了 %@",filePath);
        if (error == nil) {
            completion(YES,@"下载完成",[filePath path]);
        } else {
            completion(NO,@"下载失败",nil);
        }
    }];
    [task resume];
}

-(void)setRequestHeader:(NSMutableURLRequest *)request{
    [request setValue:@"http://eqxiu.com" forHTTPHeaderField:@"Origin"];
    [request setValue:@"http://eqxiu.com" forHTTPHeaderField:@"Referer"];
    [request setValue:[CommUtils getUserAgent] forHTTPHeaderField:@"User-Agent"];
}

//audio、gif下载
- (void)downloadDataWithUrl:(NSString *)url
                  savedPath:(NSString*)savedPath
                   progress:(void(^)(CGFloat value))downProgress
                    success:(void(^) (BOOL state,NSString * message,NSString * filePath))completion{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",url]]];
    NSURLSessionTask *task = [_downloadManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (downProgress) {// 进度值
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                float p = downloadProgress.fractionCompleted;
                downProgress(p);
            }];
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        return [NSURL fileURLWithPath:savedPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if (error == nil) {
            completion (YES,@"下载完成",[filePath path]);
        }else{
            completion (NO,@"下载失败",nil);
        }
    }];
    [task resume];
}

- (void)jsonDicParserWithDic:(NSDictionary *)jsonDic
                   urlString:(NSString *)urlString
                 finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock {
    if ([[jsonDic objectForKey:@"code"] integerValue] == 401) {
        NSLog(@"urlString--401--%@",urlString);
//        [[NSNotificationCenter defaultCenter] postNotificationName:kAppExitLogin object:@"2"];
//        [[AppDelegate getAppDelegate] hideActivityView];
    } else if ([[jsonDic objectForKey:@"code"] integerValue] == 403) {
        NSLog(@"urlString--403--%@",urlString);
        [[AppDelegate getAppDelegate] hideActivityView];
        if ([[_urlNeedReturnDic objectForKey:urlString] integerValue] == 1) {//需要返回
            if (finishBlock) {
                finishBlock(jsonDic);
            }
        } else {//不需要返回，直接弹框
            NSInteger userType = [[[NSUserDefaults standardUserDefaults] objectForKey:@"userType"] integerValue];
            if (userType == 21) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"你还没有操作权限" message:@"请联系主账为帮您开启权限" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
                [alertView show];
            }
            
        }
    } else {
        if (finishBlock) {
            finishBlock(jsonDic);
        }
    }
}

- (void)setCookieWithJSESSIONID {
    NSData *cookiesdata = [[NSUserDefaults standardUserDefaults] objectForKey:@"cookieWithJSESSIONID"];
    if([cookiesdata length]) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesdata];
        NSHTTPCookie *cookie;
        for (cookie in cookies) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
        }
    }
}

#pragma mark 取消请求
- (void)cancelAllRequests {
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
}

- (void)cancelOneRequestWithUrl:(NSString *)urlStr {
    if ([urlStr isKindOfClass:[NSString class]] && urlStr.length > 0) {
        for (NSURLSessionDataTask *task in self.manager.tasks) {
            if ([task isKindOfClass:[NSURLSessionDataTask class]]) {
                if ([task.currentRequest.URL.absoluteString rangeOfString:urlStr].location != NSNotFound) {
                    [task cancel];
                    break;
                }
            }
        }
    }
}

- (void)dealloc {
    if (!isDownloadReq) {
        [_manager invalidateSessionCancelingTasks:YES resetSession:YES];
        _manager = nil;
    }
}
@end
