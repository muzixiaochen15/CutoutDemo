//
//  QNGetTokenRequest.h
//  YiQiXiu
//
//  Created by ZLJ on 16/5/20.
//  Copyright © 2016年 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QiniuSDK.h"
#import "AFNetworking.h"
#import "UploadLoadingView.h"

typedef void (^QNGetTokenRequestBack)(BOOL isSuccess);

@interface QNGetTokenRequest : NSObject

@property (nonatomic, copy)QNGetTokenRequestBack qnRequestBlock;
@property (nonatomic, assign)BOOL isUpload;
@property (nonatomic, assign)BOOL tokenSuccesful;
@property (nonatomic, strong)QNUploadManager *upManager;
@property (nonatomic, strong)dispatch_queue_t uploadQueue;
@property (strong, nonatomic)UploadLoadingView *uploadView;


+ (QNGetTokenRequest *)shareQNManager;

- (void)whetherToCallQNTokenWithType:(NSString *)type;

- (void)getTokenFromQNWithType:(NSString *)type;

- (void)uploadImageWithImagePath:(NSString *)imagePath
                           token:(NSString *)tokenStr
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;


- (void)uploadMusicWithMusicPath:(NSString *)musicPath
                       musicName:(NSString *)musicName
                           token:(NSString *)tokenStr
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;

- (void)uploadVideoWithVideoPath:(NSString *)videoPath
                       videoName:(NSString *)videoName
                           token:(NSString *)tokenStr
                     finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;
@end
