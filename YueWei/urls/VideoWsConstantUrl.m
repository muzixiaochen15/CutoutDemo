//
//  VideoWsConstantUrl.m
//  YiQiXiu
//
//  Created by Jelly on 2019/4/3.
//  Copyright © 2019年 Sherry. All rights reserved.
//

#import "VideoWsConstantUrl.h"

NSString const * kCopyVideoUrl                   = @"/v3/video/copy";         //复制视频
NSString const * kDeleteVideoUrl                 = @"/v3/video/delete";        //删除视频
NSString const * kVideoDetail                    = @"/v3/video/detail";    //作品元素信息
NSString const * kMyVideoListUrl                 = @"/v3/video/my";         //我的视频列表
NSString const * kVideoTemplateDetialUrl         = @"/v3/video/template/detail";         //根据id获取视频模板详情
NSString const * kAEVideoTemplateDetailUrl       = @"/v3/video/template/detail/ae";     //获取ae模板元素信息
NSString const * kVideoTemplateListUrl           = @"/v3/video/template/list";         //分页获取视频模板
NSString const * kVideoMaterialListUrl           = @"/v3/video/template/material/list";   //获取h视频模板素材列表
NSString const * kVideoCropInfoUrl               = @"/v3/video/crop/upload";   //视频裁剪信息上传

NSString const * kSaveVideoUrl                   = @"/v3/video/save";         //生成视频
NSString const * kVideoCancelSaveUrl             = @"/v3/video/render/cancel"; //取消生成视频
NSString const * kVideoGenerateProgressUrl       = @"/v3/video/render/query/batch";//视频生成进度
NSString const * kVideoGenerateRenderProgressUrl = @"/v3/video/render/query"; // 渲染进度查询
NSString const * kVideoSettingUrl                = @"/v3/video/setting";//视频封面，标题设置
NSString const * kVideoInfoUrl                   = @"/v3/video/info";//视频简单信息
NSString const * kUploadVideoInfoUrl             = @"/v3/video/user/upload/info";//用户上传视频信息保存
NSString const * kVideoQueryUrl                  = @"/v3/video/user/detail";//根据id获取用户上传视频信息
NSString const * kVideoTransitionsListUrl        = @"/v3/video/transition/list";//视频转场列表

NSString const * kVideoListLabel                 = @"/v3/video/template/list_label";//获取视频label列表
NSString const * kVideoPureRender                = @"/v3/video/pure/render"; //无水印视频渲染生成

NSString const * kVideoSelfieSave                = @"/v3/video/save-as-selfie";  //自拍视频保存操作
NSString const * kVideoDownloadRecordUrl         = @"/v3/video/user/add/download/record"; //视频下载记录
NSString const * kVideoSaveZipElementUrl         = @"/api/v3.1/video/save";           //视频保存作品数据（压缩

NSInteger const  kVideoTransverseBGId            = 896461;   //视频横屏背景分类id
NSInteger const  kVideoVerticalBGId              = 896462;   //视频竖屏背景分类id

