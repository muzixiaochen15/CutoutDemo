//
//  LongPageWsConstantUrl.m
//  YiQiXiu
//
//  Created by Jelly on 2019/3/11.
//  Copyright © 2019年 Sherry. All rights reserved.
//

#import "EasyFormWsConstantUrl.h"


#pragma mark 表单创建复制等
NSString const * kCreateEmptyEasyFormUrl            = @"/v3/lp/create";         //创建空白表单
NSString const * kCopyEasyFormUrl                   = @"/v3/lp/copy";         //复制表单
NSString const * kDeleteEasyFormUrl                 = @"/v3/lp/delete";        //删除表单
NSString const * kMyEasyFormListUrl                 = @"/v3/lp/my";         //我的表单列表
NSString const * kSetEasyFormUrl                    = @"/v3/lp/settings";             //表单设置
NSString const * kPublishEasyFormUrl                = @"/v3/lp/publish";          //c发布表单
NSString const * kGroupEasyFormUrl                  = @"/v3/lp/group/my";           //表单分组列表
NSString const * kChangeEasyFormSkinListUrl         = @"/v3/skin/list";             //皮肤模板列表
NSString const * kChangeSkinDetialUrl               = @"/v3/skin/detail/";             //皮肤模板信息和属性列表
NSString const * kEasyFormDataListUrl               = @"/v3/lp/data/list";              //表单收集数据（表单）
NSString const * kEasyFormDeleteDataUrl             = @"/v3/lp/data/delete";          //表单删除表单数据
NSString const * kGetEasyFormOtherSettingUrl        = @"/v3/lp/config/setting";         //获取表单设置信息
NSString const * kSetEasyFormOtherSettingUrl        = @"/v3/lp/config/set";             //设置易表单设置信息

NSString const * kLongPageDataListUrl               = @"/v3/app-h5-lp/data/list";      //长页面收集数据
NSString const * kLongPageDeleteDataUrl             = @"/v3/app-h5-lp/data/delete";      //删除长页数据
NSString const * kLongPageDataShareUrl              = @"/v3/app-h5-lp/data/share";      //长页标记分享报表


#pragma mark 表单页面信息
NSString const * kEasyFormSaveUrl                   = @"/v3/lp/element/save";          //保存表单页面元素信息
NSString const * kGetEasyFormElementUrl             = @"/v3/lp/element";          //获取表单页面信息
NSString const * kEasyFormSaveZipElementUrl         = @"/api/v3.1/form/page/save";        //表单保存作品数据（压缩

#pragma mark 表单首页推荐
NSString const *kEasyFormModuleListUrl               = @"/v3/module/list";          //获取模块列表

#pragma mark 本地预览表单版本号
NSString const *kEasyFormHtmlVersionUrl              = @"/v3/lp/tpl/version/new";  //本地预览版本号

NSString const * kEasyFormSetMsgPushUrl              = @"/v3/lp/set/msg/push/switch";        //设置表单消息开关
NSString const * kEasyFormGetMsgPushUrl              = @"/v3/lp/get/msg/push/switch";       //获取表单作品消息推送是否开启


NSString * const kEasyFormAvailCountUrl                  = @"/v3/lp/avail/count";       //获取用户题目(组件)限制数量

#pragma mark 短信包购买
NSString * const kEasyFormMsgPackageCountUrl            = @"/v2/user/sms/benefit/count";        //短信包权益查询



#pragma mark 表单红包相关
NSString * const kSaveEasyFormRedUrl                 = @"/v3/lp/redpack/save";      //红包设置
NSString * const kGetEasyFormRedPacketUrl            = @"/v3/lp/redpack/config";        //获取红包配置信息
NSString * const kEasyFormRedPacketAllCountUrl       = @"/v3/lp/redpack/data/summary";      //红包领取概况
NSString * const kEasyFormRedPacketDetialUrl         = @"/v3/lp/redpack/data/list";     //红包领取详情
