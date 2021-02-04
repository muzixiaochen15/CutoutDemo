//
//  LongPageWsConstantUrl.h
//  YiQiXiu
//
//  Created by Jelly on 2019/3/11.
//  Copyright © 2019年 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 表单创建复制等
extern NSString const * kCreateEmptyEasyFormUrl;         //创建空白表单
extern NSString const * kCopyEasyFormUrl;         //复制表单
extern NSString const * kDeleteEasyFormUrl;        //删除表单
extern NSString const * kMyEasyFormListUrl;         //我的表单列表
extern NSString const * kSetEasyFormUrl;             //表单设置
extern NSString const * kPublishEasyFormUrl;          //c发布表单
extern NSString const * kGroupEasyFormUrl;           //表单分组列表
extern NSString const * kChangeEasyFormSkinListUrl;             //皮肤模板列表
extern NSString const * kChangeSkinDetialUrl;             //皮肤模板信息和属性列表
extern NSString const * kEasyFormDataListUrl;              //表单收集数据（表单）
extern NSString const * kEasyFormDeleteDataUrl;          //表单删除表单数据
extern NSString const * kGetEasyFormOtherSettingUrl;         //获取表单设置信息
extern NSString const * kSetEasyFormOtherSettingUrl;             //设置易表单设置信息

extern NSString const * kLongPageDataListUrl;      //长页面收集数据
extern NSString const * kLongPageDeleteDataUrl;      //删除长页数据
extern NSString const * kLongPageDataShareUrl;      //长页标记分享报表
extern NSString const * kEasyFormSaveZipElementUrl;        //表单保存作品数据（压缩

#pragma mark 表单页面信息
extern NSString const * kEasyFormSaveUrl;          //保存表单页面元素信息
extern NSString const * kGetEasyFormElementUrl;          //获取表单页面信息


#pragma mark 表单首页推荐
extern NSString const *kEasyFormModuleListUrl;          //获取模块列表

#pragma mark 表单本地预览
extern NSString const *kEasyFormHtmlVersionUrl;

extern NSString const * kEasyFormSetMsgPushUrl;        //设置表单消息开关
extern NSString const * kEasyFormGetMsgPushUrl;       //获取表单作品消息推送是否开启

extern NSString * const kEasyFormAvailCountUrl;       //获取用户题目(组件)限制数量


#pragma mark 短信包购买
extern NSString * const kEasyFormMsgPackageCountUrl;        //短信包权益查询

#pragma mark 表单红包相关
extern NSString * const kSaveEasyFormRedUrl;      //红包设置
extern NSString * const kGetEasyFormRedPacketUrl;        //获取红包配置信息
extern NSString * const kEasyFormRedPacketAllCountUrl;      //红包领取概况
extern NSString * const kEasyFormRedPacketDetialUrl;     //红包领取详情
