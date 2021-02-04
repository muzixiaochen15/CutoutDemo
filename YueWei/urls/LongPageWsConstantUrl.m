//
//  LongPageWsConstantUrl.m
//  YiQiXiu
//
//  Created by Jelly on 2020/4/1.
//  Copyright © 2020 Sherry. All rights reserved.
//

#import "LongPageWsConstantUrl.h"


NSString * const kLongPageSceneListUrl                   = @"/v3/app-h5-lp/my";      //我的长页列表
NSString * const kGetLongPageSceneGroupsUrl              = @"/v3/app-h5-lp/group/my";      //我的长页列表
NSString * const kLongPageSceneCopyUrl                   = @"/v3/app-h5-lp/copy";      //我的长页作品复制
NSString * const kLongPageSceneDeleteUrl                 = @"/v3/app-h5-lp/delete";      //我的长页作品删除
NSString * const kLongPageSceneGroupSetting              = @"/v3/app-h5-lp/config/setting";//获取长页全局设置
NSString * const kLongPageSceneSettingSave               = @"/v3/app-h5-lp/settings"; // 长页设置
NSString * const kLongPageScenePublish                   = @"/v3/app-h5-lp/publish";  // 长页发布

NSString * const kLongPageGetElementUrl                  = @"/v3/app-h5-lp/element";    //长页获取页面元素
NSString * const kLongPageSaveElementUrl                 = @"/v3/app-h5-lp/element/save";       //长页保存页面信息
NSString * const kLongPageCreateEmptyUrl                 = @"/v3/app-h5-lp/create";         //长页空白创建
NSString * const kLongPageLocalVersionUrl                = @"/v3/app-h5-lp/tpl/version";        //长页本地预览版本号

NSString * const kLongPageStyleListUrl                   = @"/v3/app-h5-lp/tpl/list";       //长页风格列表
NSString * const kLongPageStyleDetialElementUrl          = @"/v3/app-h5-lp/element/tpl";     //长页风格模板页面详细信息
NSString * const kLongPageGetMsgPushUrl                  = @"/v3/app-h5-lp/get/msg/push/switch";       //长页表单消息开启
NSString * const kLongPageSetMsgPushUrl                  = @"/v3/app-h5-lp/set/msg/push/switch";       //设置长页消息提醒

NSString * const kLongPageSaveZipElementUrl              = @"/api/v3.1/long/page/save";       //长页作品保存数据（压缩）
