//
//  QNGetTokenRequest.m
//  YiQiXiu
//
//  Created by ZLJ on 16/5/20.
//  Copyright © 2016年 Sherry. All rights reserved.
//

#import "QNGetTokenRequest.h"
#import "NSString+YQXCategory.h"
#import "CommUtils.h"
#import "EQXConstantUrl.h"
#import "WsConstantUrl.h"

@implementation QNGetTokenRequest

+ (QNGetTokenRequest *)shareQNManager{
    static QNGetTokenRequest *shareManagerInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        shareManagerInstance = [[QNGetTokenRequest alloc] init];
        
    });
    return shareManagerInstance;
    
}

- (void)whetherToCallQNTokenWithType:(NSString *)type{
    NSString *QNToken = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_QNToken",type]];
    NSString *expireTimeStr = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_expireTime",type]];
    NSDate *lastUpdateTime = [[NSUserDefaults standardUserDefaults] objectForKey:[NSString stringWithFormat:@"%@_expireTime_date",type]];
    
    if (QNToken) {
        NSTimeInterval interval = [CommUtils timeSinceNowNSTimeInterval:lastUpdateTime];
        //        NSInteger secend = interval / 24 ;
        if (interval >= [expireTimeStr integerValue]) {
            self.isUpload = NO;
            _tokenSuccesful = YES;
            
            [self getTokenFromQNWithType:type];
            
        }else{
            self.isUpload = YES;
            _tokenSuccesful = NO;
            
        }
    }else{
        self.isUpload = NO;
        _tokenSuccesful = YES;
        
        [self getTokenFromQNWithType:type];
    }
}

//七牛获取token
- (void)getTokenFromQNWithType:(NSString *)type{
    if (!_tokenSuccesful) {
        return;
    }
    AFHTTPSessionManager *session = [[AFHTTPSessionManager alloc]initWithBaseURL:nil sessionConfiguration:nil];
    NSString *urlString = [NSString stringWithFormat:@"%@%@?type=%@",kHeaderUrl,kGetQNTokenUrl,type];
    if ([type isEqualToString:@"noWaterMark"]) {
        if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"NoWaterMarkPrintId"] respondsToSelector:@selector(integerValue)] && [[[NSUserDefaults standardUserDefaults] objectForKey:@"NoWaterMarkPageId"] respondsToSelector:@selector(integerValue)]) {
            urlString = [NSString stringWithFormat:@"%@%@?printId=%ld&pageId=%ld",kHeaderUrl,kGetNoWaterMarkTokenUrl,(long)[[[NSUserDefaults standardUserDefaults] objectForKey:@"NoWaterMarkPrintId"] integerValue],(long)[[[NSUserDefaults standardUserDefaults] objectForKey:@"NoWaterMarkPageId"] integerValue]];
        }
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"NoWaterMarkPrintId"];
        [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"NoWaterMarkPageId"];
    }
 
    __weak typeof(self) weakSelf = self;
    [session POST:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString * codeString = [responseObject objectForKey:@"code"];
        if ([codeString integerValue] == 200) {
            if ([type isEqualToString:@"noWaterMark"]) {
                NSString *noWaterObj =[responseObject objectForKey:@"obj"];
                if ([noWaterObj isKindOfClass:[NSString class]] && noWaterObj.length > 0) {
                    NSString *tokenKey = [NSString stringWithFormat:@"%@_QNToken",type];
                    [[NSUserDefaults standardUserDefaults] setObject:noWaterObj forKey:tokenKey];
                }
            }else{
                NSString *tokenStr = [[responseObject objectForKey:@"map"] objectForKey:@"token"];
                NSString *tokenKey = [NSString stringWithFormat:@"%@_QNToken",type];
                NSString *expireKey = [NSString stringWithFormat:@"%@_expireTime",type];
                NSString *expire = [NSString stringWithFormat:@"%@",[[responseObject objectForKey:@"map"] objectForKey:@"expire"]];
                [[NSUserDefaults standardUserDefaults] setObject:tokenStr forKey:tokenKey];
                [[NSUserDefaults standardUserDefaults] setObject:expire forKey:expireKey];
                [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:[NSString stringWithFormat:@"%@_date",expireKey]];
            }
            
            
            self.qnRequestBlock(YES);
            _isUpload = YES;
            _tokenSuccesful = YES;
        }else{
            self.qnRequestBlock(NO);
            _tokenSuccesful = NO;
            
        }
        if (weakSelf) {
            [session.session.configuration.URLCache removeAllCachedResponses];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        self.qnRequestBlock(NO);
        _tokenSuccesful = NO;
        if (weakSelf) {
            [session.session.configuration.URLCache removeAllCachedResponses];
        }
    }];
}

//图片上传
- (void)uploadImageWithImagePath:(NSString *)imagePath
                           token:(NSString *)tokenStr
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock{//
    if (_uploadQueue == nil) {
        _uploadQueue = dispatch_queue_create("uploadImageToQiniu", DISPATCH_QUEUE_CONCURRENT);
    }
    
    if (_upManager == nil) {
        _upManager = [[QNUploadManager alloc] init];
    }
    
    NSString *uuidStr = [[NSUUID UUID] UUIDString];//自定义key
    dispatch_async(_uploadQueue, ^{
        [_upManager putFile:imagePath key:[NSString stringWithFormat:@"%@.%@",uuidStr, [imagePath isGif]?@"gif":@"jpg"] token:tokenStr complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
            if (finishBlock) {
                finishBlock(resp);
            }
        } option:nil];
    });
}

//音频上传
- (void)uploadMusicWithMusicPath:(NSString *)musicPath
                       musicName:(NSString *)musicName
                           token:(NSString *)tokenStr
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock{
    
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    NSError *error = nil;
    NSData *musicData;
    if ([[NSFileManager defaultManager]fileExistsAtPath:musicPath]) {
        musicData = [NSData dataWithContentsOfFile:musicPath options:0 error:&error];
    }
    if (musicData == nil) {
        musicPath = [NSString stringWithFormat:@"%@.MP3",[self preareToSubmitMusicName:@"Music"] ];
    }
    
    NSString *uuidStr = [[NSUUID UUID] UUIDString];//自定义key
    
    [upManager putFile:musicPath key:[NSString stringWithFormat:@"%@.mp3",uuidStr] token:tokenStr complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        if (finishBlock)
        {
            finishBlock(resp);
        }
    } option:nil];
}

//音乐路径
- (NSString *)preareToSubmitMusicName:(NSString *)musicName
{
    NSArray* storeFilePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentsDirectiory = [storeFilePath objectAtIndex:0];
    NSString *imgDirectory = [NSString stringWithFormat:@"%@", doucumentsDirectiory];
    NSString *musicPath = [imgDirectory stringByAppendingPathComponent:musicName];
    return musicPath;
    
}

//视频上传
- (void)uploadVideoWithVideoPath:(NSString *)videoPath
                       videoName:(NSString *)videoName
                           token:(NSString *)tokenStr
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock{
    QNUploadManager *upManager = [[QNUploadManager alloc] init];
    NSError *error = nil;
    NSData *videoData;
    if ([[NSFileManager defaultManager]fileExistsAtPath:videoPath]) {
        videoData = [NSData dataWithContentsOfFile:videoPath options:0 error:&error];
    }
    if (videoData == nil) {
        videoPath = [NSString stringWithFormat:@"%@.MP4",[self preareToSubmitMusicName:@"Video"] ];
    }
    
    NSString *uuidStr = [[NSUUID UUID] UUIDString];//自定义key
    [upManager putFile:videoPath key:[NSString stringWithFormat:@"%@.mp4",uuidStr] token:tokenStr complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        if (finishBlock)
        {
            finishBlock(resp);
        }
    } option:nil];
}
@end
