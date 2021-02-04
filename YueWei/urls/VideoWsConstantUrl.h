//
//  VideoWsConstantUrl.h
//  YiQiXiu
//
//  Created by Jelly on 2019/4/3.
//  Copyright © 2019年 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString const * kCopyVideoUrl;         //复制视频
extern NSString const * kDeleteVideoUrl;        //删除视频
extern NSString const * kVideoDetail;           //获取元素信息
extern NSString const * kMyVideoListUrl;         //我的视频列表
extern NSString const * kVideoSegementsUrl;       //根据视频模板id获取视频片段素材等
extern NSString const * kVideoRenderBatchUrl;         //视频渲染查询

extern NSString const * kVideoTemplateDetialUrl;         //根据id获取视频模板详情
extern NSString const * kAEVideoTemplateDetailUrl;     //获取ae模板元素信息
extern NSString const * kVideoTemplateListUrl;         //分页获取视频模板
extern NSString const * kVideoMaterialListUrl;         //获取h视频模板素材列表

extern NSString const * kVideoMaterialDetail;         //获取h视频模板素材详情
extern NSString const * kVideoSettingUrl;             //视频封面，标题设置
extern NSString const * kVideoCropInfoUrl;          //视频裁剪信息上传

extern NSString const * kSaveVideoUrl  ;         //生成视频
extern NSString const * kVideoCancelSaveUrl;    //取消生成视频
extern NSString const * kVideoGenerateProgressUrl;
extern NSString const * kVideoGenerateRenderProgressUrl; // 渲染进度查询

extern NSString const * kVideoInfoUrl;
extern NSString const * kUploadVideoInfoUrl;
extern NSString const * kVideoQueryUrl;         //根据id获取用户上传视频信息
extern NSString const * kVideoTransitionsListUrl;

extern NSString const * kVideoListLabel;     //获取视频label列表
extern NSString const * kVideoPureRender;    //无水印视频渲染生成
extern NSString const * kVideoSelfieSave;    //自拍视频保存操作

extern NSString const * kVideoDownloadRecordUrl;  //视频下载记录
extern NSString const * kVideoSaveZipElementUrl;           //视频保存作品数据（压缩

extern NSInteger const kVideoTransverseBGId;     //视频横屏背景分类id
extern NSInteger const kVideoVerticalBGId;       //视频竖屏背景分类id


NS_ASSUME_NONNULL_END
