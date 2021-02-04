//
//  YiQiXiuHttpRequest.h
//  YiQiXiu
//
//  Created by Sherry on 14-10-14.
//  Copyright (c) 2014年 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "WsConstantUrl.h"
#import "QNGetTokenRequest.h"
#import "EasyFormWsConstantUrl.h"
#import "VideoWsConstantUrl.h"
#import "EQXConstantUrl.h"
#import "LightDesignWsConstantUrl.h"
#import "LongPageWsConstantUrl.h"

typedef enum
{
    kRequestModePost = 0,
    kRequestModeGet ,
    kRequestModeSubmitImage
}RequestSubmission;

@interface YiQiXiuHttpRequest : NSObject

@property (strong,nonatomic)AFHTTPSessionManager *downloadManager;
@property (strong,nonatomic)AFHTTPSessionManager *manager;
@property (assign,nonatomic)BOOL isNeedReturnNoRoot;
@property (assign,nonatomic)BOOL isNoWaterMark;
@property (nonatomic, assign)BOOL isNeedNotSaveToMine;//仅把图片上传到七牛，不保存到“我的素材库”中
@property (strong,nonatomic)NSMutableDictionary *urlNeedReturnDic;
@property (strong,nonatomic)NSMutableDictionary *headerDic;

@property (strong,nonatomic)AFHTTPRequestSerializer *httpSerializer;
@property (strong,nonatomic)AFJSONRequestSerializer *jsonSerializer;

/*!
 @brief 网络请求
 @param urlString URLString
 @param timeOutInterval 请求超时设置
 @param mode 请求方式
 @param info postInfo
 @param finishBlock 完成回调
 */
- (void)requestWithUrl:(NSString *)urlString
                  mode:(RequestSubmission)mode
              postInfo:(id)info
           finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;


/*!
 @brief 带有超时时间的网络请求，默认超时时间为10s
 @param timeOutInterval 超时时间，以s（秒）为单位
 */
-(void)requestWithUrl:(NSString *)urlString
      timeOutInterval:(NSTimeInterval)timeOutInterval
                 mode:(RequestSubmission)mode
             postInfo:(id)info
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;

/*!
 @brief 要提交json类型的数据的网络请求
 @param isJsonData 提交的是否为json数据
 */
-(void)requestWithUrl:(NSString *)urlString
           isJsonData:(BOOL)isJsonData
                 mode:(RequestSubmission)mode
             postInfo:(id)info
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;

/*!
 @brief 带有超时时间,要提交json类型的数据的网络请求，默认超时时间为10s
 @param timeOutInterval 超时时间，以s（秒）为单位
 @param isJsonData 提交的是否为json数据
 */
-(void)requestWithUrl:(NSString *)urlString
           isJsonData:(BOOL)isJsonData
      timeOutInterval:(NSTimeInterval)timeOutInterval
                 mode:(RequestSubmission)mode
             postInfo:(id)info
          finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;

/*!
@brief 带有需要设置http Header 的请求，一定需要是NSDictionary类型的
@param timeOutInterval 超时时间，以s（秒）为单位
@param isJsonData 提交的是否为json数据
*/
- (void)requestWithUrl:(NSString *)urlString
     isJsonData:(BOOL)isJsonData
           mode:(RequestSubmission)mode
       postInfo:(id)info
timeOutInterval:(NSTimeInterval)timeOutInterval
HTTPHeaderField:(NSDictionary *)headerFieldDic
           finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock ;



- (void)QNTokenIsAvailable:(void (^)(BOOL isAvailable))QNTokenState;
- (void)postImageWithImagePath:(NSString *)imagePath
                    parameters:(NSDictionary *)parameters
                   finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;


//画中画缩略图上传到七牛服务，不同步到“我的图片”
- (void)pipPostImageWithImagePath:(NSString *)imagePath
                      finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;


- (void)getImageWithImagePath:(NSString *)imagePath parameters:(NSDictionary *)parameters fininshBlock:(void(^)(NSDictionary *jsonDic))finishBlock;

- (void)postMusicWithMusicPath:(NSString *)musicPath
                     musicName:(NSString *)musicName
                    parameters:(NSDictionary *)parameters
                   finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;

- (void)htmlGetWithUrl:(NSString *)URLString
            parameters:(id)parameters
           finishBlock:(void (^)(NSString *htmlStr))finishBlock;

#if 0
//下载
- (void)downloadFontUrl:(NSString *)urlString
             parameters:(id)parameters
              savedPath:(NSString*)savedPath
               fileName:(NSString *)fileName
               progress:(void (^)(float progress))progress;


//预览字下载
- (void)downloadPreFontUrl:(NSString *)urlString
                parameters:(id)parameters
                 savedPath:(NSString*)savedPath
                  fileName:(NSString *)fileName
                  progress:(void (^)(float progress))progress;
#endif
- (void)downloadPreFontUrl:(NSString *)urlString
                parameters:(id)parameters
                 savedPath:(NSString*)savedPath
                  fileName:(NSString *)fileName
                  progress:(void (^)(float progress))progress
                   success:(void(^) (BOOL state,NSString * message,NSString * filePath))completion;

//获取视频七牛token
- (void)postVideoWithVideoPath:(NSString *)videoPath
                     videoName:(NSString *)videoName
                    parameters:(NSDictionary *)parameters
                   finishBlock:(void (^)(NSDictionary *jsonDic))finishBlock;

//audio、gif下载
- (void)downloadDataWithUrl:(NSString *)url
                  savedPath:(NSString*)savedPath
                   progress:(void(^)(CGFloat value))downProgress
                    success:(void(^) (BOOL state,NSString * message,NSString * filePath))completion;

#pragma mark 取消请求
- (void)cancelAllRequests;
- (void)cancelOneRequestWithUrl:(NSString *)urlStr;

@end
