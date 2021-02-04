//
//  LightDesignWsConstantUrl.m
//  YiQiXiu
//
//  Created by tt_meici on 2019/5/5.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import "LightDesignWsConstantUrl.h"

NSString const * kLightDesignPageInfoUrl            = @"/v3/print/element/";        //获取海报页面信息
NSString const * kLightDesingSaveUrl                = @"/v3/print/element/save";        //保存海报页面元素信息，传参页面信息body是查询页面信息接口的pages的第一页，参数必填项：page的id
NSString const * kLightDesignNineTempListUrl        = @"/v3/print/nine_image_template";         //九宫格趣图模板列表
NSString const * kLightDesignSaveZipElementUrl      = @"/api/v3.1/print/page/save";       //海报保存作品数据（压缩

NSString * const kLDCategoryListUrl             = @"/v3/category/list";        //海报分类
NSString * const kLDCreateSceneUrl              = @"/v3/print/create";              //海报创建x作品
NSString * const kLDDeleteSceneUrl              = @"/v3/print/delete";              //i海报删除作品
NSString * const kLDCopySceneUrl                = @"/v3/print/copy";              //海报复制作品
NSString * const kLDMySceneListUrl              = @"/v3/print/my";              //海报我的作品列表
NSString * const kLDSetMySceneUrl               = @"/v3/print/settings";            //海报设置作品信息
NSString * const kLightDesignTextNineUrl        = @"/v3/print/change/text";         //更换文字九宫格文字

NSString * const kLDArtQrCodeElementUrl         = @"/v3/print/element/for/qrcode";      //海报艺术二维码详情
NSString * const kLDArtTextStyleUrl             = @"/v3/word/art/styles";       //艺术字列表
NSString * const kLDPosterProductList           = @"/v3/app-product/poster/list"; //拼图模板、海报列表
NSString * const kLDGetTemplateInfo             = @"/v3/print/element/for/template"; // 获取模板信息
