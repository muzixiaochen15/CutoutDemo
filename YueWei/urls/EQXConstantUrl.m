//
//  EQXConstantUrl.m
//  YiQiXiu
//
//  Created by Sherry on 2019/7/25.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import "EQXConstantUrl.h"
//正式
#if 1
NSString * const kHeaderUrl                = @"https://m1.eqxiu.com";//api域名
NSString * const kImageHeaderUrl           = @"https://res3.eqh5.com/";//资源相关：图片、音频等
NSString * const kTencentcdn               = @"https://video-1251586368.file.myqcloud.com"; // 腾讯视频地址
NSString * const kTencentimgcdn            = @"https://video-1251586368.image.myqcloud.com"; // 腾讯图片地址
NSString * const kSceneShareUrl            = @"https://m.eqxiu.com/s/";   //参数code，作品浏览域名
NSString * const kBootJavascriptUrl        = @"https://as.eqh5.com";//资源相关：获取本地预览文件
NSString * const kVipUrl                   = @"https://vip.eqxiu.cn";//保障后vip域名
NSString * const kXDPayHeaderUrl           = @"https://xiupay.eqxiu.com";//商城秀点下单支付
NSString * const kBigDataBuriedUrl         = @"https://datalog.eqxiu.com/p.gif";//新大数据打点
NSString * const kUerServiceHeaderUrl      = @"https://passport.eqxiu.com";//用户信息
NSString * const kEasyFormPreUrl           = @"https://form.ebdan.net/ls";     //表单预览域名
NSString * const kLongpagePreUrl           = @"https://h5.eqxiul.com";     //长页预览域名
NSString * const kShowerHeaderUrl          = @"https://showker.eqxiu.com";//秀客小店
NSString * const kDataServerUrl            = @"https://data.eqxiu.com";  //大数据接口数据
NSString * const kCalendarHeaderUrl        = @"http://calendar.eqxiu.com";
NSString * const kOldNewShareUrl           = @"http://appweb.eqxiu.com"; //运营老带新分享域名
NSString * const kUpdateAccountUrl         = @"http://www.eqxiu.com";////免费升级企业账号
NSString * const kWapHeadUrl               = @"http://wap.eqxiu.com";    //积分wap页域名
NSString * const kUserApiHeadUrl           = @"http://assist-api.eqxiu.com";     //用户注册后礼包、信息等
NSString * const kInvoiceHeaderUrl         = @"http://pay.eqxiu.com";           //发票域名
NSString * const kMaxGDHeaderUrl           = @"https://iom-api.eqxiu.com";        //中台广告（运营位）域名

NSString * const kVideoImgFileHeaderUrl    = @"https://res3.eqh5.com/";//视频工具中图片七牛文件头
NSString * const kVideoFileHeaderUrl       = @"https://res4.eqh5.com/";//视频七牛文件头
NSString * const kVideoShareUrl            = @"https://a.veqxiu.com/video/player/0/";//视频作品分享地址
NSString * const kVideoTemplateShareUrl    = @"https://a.veqxiu.com/video/player/";//视频模板分享地址
NSString * const kMaxUserPerHeaderUrl      = @"http://muc.eqxiu.com";       //中台信息补足页面域名

NSString * const kCommunityHeaderUrl       = @"http://app.eqxiu.com";   //用户社区域名
NSString * const kEasyFormLocalUrl         = @"https://form-preview-api.eqxiu.com";   //表单本地预览会调用的
NSString * const kLworkApiUrl              = @"https://lwork-api.eqxiu.com";  //积分任务

NSString * const kMallMusicID              = @"890162";         //商城音乐分类Id
NSString * const kNewMallFontID            = @"897981";         //新商城字体分类id
NSString * const kMallPictureID            = @"889982";         //商城图片分类id
NSString * const kLPMallPictureID          = @"897582";         //长页图片商城分类id
NSString * const kMallSoundID              = @"890017";         //商城音效分类id
NSString * const kMallBackgroundID         = @"889998";         //商城背景分类id
NSString * const kMallSingleTemplateID     = @"890477";         //商城单页模板分类id
NSString * const kRecommendPageCode        = @"0zl7Stp2kM";     //推荐页专题模块唯一id
NSString * const kEasyFormSuperID          = @"892960";     //表单父类id
NSString * const kLightDesignCategoryID    = @"11000000";       //海报分类id
NSString * const kStitchPicBackgroundId    = @"898992";         //拼图背景分类id

NSString * const kLDMallTemplateId         = @"893757";         //海报模板id
NSString * const kLDMallImageID            = @"897507";       //海报图片-包含付费素材id
NSString * const kLDMallPictureId          = @"893820";       //海报图片素材id
NSString * const kLDMallBackgroundId       = @"893821";       //海报背景素材id
NSString * const kLDMallShapeId            = @"893822";       //海报形状素材id
NSString * const kLDMallArtQRCodeId        = @"896645";       //海报艺术二维码id

NSString * const kVDMallMappingImage       = @"895862";
NSString * const kVDMallGifImage           = @"895888";
NSString * const kVDMallAlbumVideoId       = @"896630";   //视频相册根id
NSString * const kVDMallFlashVideoId       = @"896706";   //快闪根id
NSString * const kVDMallPointVideoId       = @"896708";   //卡点根id

NSString * const kSDSudokuTypeImage        = @"71";
NSString * const kSDSudokuTypeOnlookers    = @"72";
NSString * const kSDSudokuTypeText         = @"73";
NSString * const kSDSudokuTypeJoin         = @"74";
NSString * const kTXMusicKey               = @"4ea24e33-e110-461a-bad0-070cdeec471a";//腾讯音乐库key

NSString * const kMemberSpecificTemplateH5ID             = @"891482";       //H5根分类id
NSString * const kMemberSpecificTemplateLightDesignID    = @"893757";       //海报根分类id
NSString * const kMemberSpecificTemplateFormID           = @"892960";       //表单根分类id
NSString * const kMemberSpecificTemplateVideoID          = @"896619";       //视频分分类id
NSString * const kMemberSpecificTemplateLongPageID       = @"897841";         //长页极简根分类id

NSString * const kMaxAdvertLongPageListBanner               = @"145";    //APP-长页作品列表页公告
NSString * const kSuperMemberBannerAdID                  = @"146";    //APP-超级会员顶部banner
NSString * const kSuperMemberRightsAdID                  = @"147";    //APP-超级会员权益介绍区

NSString * const kH5HotRecommendId                   = @"635";      //H5(默认)热门分类id
NSString * const kPerferencesSettingCategoryId       = @"141";      //完善信息-行业子分类id

NSString * const kBatchWaterCategoryId            = @"898410";      //批量水印分类id
NSString * const kMappingPictureListID            = @"898553";      //贴纸的list-id
#endif

//测
#if 0
NSString * const kHeaderUrl                = @"http://m1.yqxiu.cn";
NSString * const kImageHeaderUrl           = @"http://test.res.eqh5.com/";
NSString * const kTencentcdn               = @"http://video-test-1251586368.file.myqcloud.com"; // 腾讯视频地址
NSString * const kTencentimgcdn            = @"http://video-test-1251586368.image.myqcloud.com"; // 腾讯图片地址
NSString * const kSceneShareUrl            = @"http://m.yqxiu.cn/s/" ;  //参数code
NSString * const kBootJavascriptUrl        = @"http://as.yqxiu.cn";
NSString * const kUpdateAccountUrl         = @"http://www.yqxiu.cn";
NSString * const kDataServerUrl            = @"http://data.yqxiu.cn";
NSString * const kVipUrl                   = @"http://vip.yqxiu.cn";
NSString * const kXDPayHeaderUrl           = @"http://xiupay.yqxiu.cn";
NSString * const kShowerHeaderUrl          = @"http://mshow.yqxiu.cn";
NSString * const kCalendarHeaderUrl        = @"http://calendar.yqxiu.cn";
NSString * const kBigDataBuriedUrl         = @"http://datalog.yqxiu.cn/p.gif";
NSString * const kOldNewShareUrl           = @"http://www.yqxiu.cn";
NSString * const kUerServiceHeaderUrl      = @"http://passport.yqxiu.cn";//用户服务的域名
NSString * const kEasyFormPreUrl           = @"http://form.yqxiu.cn/fv";     //表单预览域名
NSString * const kLongpagePreUrl           = @"http://h5.yqxiu.cn";     //长页预览域名
NSString * const kWapHeadUrl               = @"http://wap.yqxiu.cn";    //积分wap页域名
NSString * const kUserApiHeadUrl           = @"http://assist-api.yqxiu.cn";     //用户注册后礼包、信息等
NSString * const kInvoiceHeaderUrl         = @"http://pay.yqxiu.cn";           //发票域名
NSString * const kMaxGDHeaderUrl           = @"http://iom-api.yqxiu.cn";        //中台广告（运营位）域名
NSString * const kMaxUserPerHeaderUrl      = @"http://muc.yqxiu.cn";       //中台信息补足页面域名

NSString * const kVideoImgFileHeaderUrl    = @"http://test.res.eqh5.com/";//视频工具中图片七牛文件头
NSString * const kVideoFileHeaderUrl       = @"http://test.res.eqh5.com/";//视频七牛文件头
NSString * const kVideoShareUrl            = @"http://share.video.yqxiu.cn/video/player/0/";//视频y分享地址
NSString * const kVideoTemplateShareUrl    = @"http://share.video.yqxiu.cn/video/player/";//视频y分享地址

NSString * const kCommunityHeaderUrl       = @"http://app.yqxiu.cn";   //用户社区域名
NSString * const kEasyFormLocalUrl         = @"http://form-editor-api.yqxiu.cn";   //表单本地预览会调用的
NSString * const kLworkApiUrl              = @"http://lwork-api.yqxiu.cn";  //积分任务

NSString * const kMallMusicID              = @"894024";         //商城音乐分类Id
NSString * const kNewMallFontID            = @"896668";         //新商城字体分类id
NSString * const kMallPictureID            = @"890103";         //商城图片分类id
NSString * const kLPMallPictureID          = @"890103";         //长页图片商城分类id
NSString * const kMallSoundID              = @"890104";         //商城音效分类id
NSString * const kMallBackgroundID         = @"890105";         //商城背景分类id
NSString * const kMallSingleTemplateID     = @"890477";         //商城单页模板分类id
//NSString * const kMusicFileterPriceRangeID = @"60000003";       //音乐筛选价格区间id
NSString * const kRecommendPageCode        = @"oR7bD9pTHY";     //推荐页专题模块唯一id
NSString * const kEasyFormSuperID          = @"891425";     //表单父类id
NSString * const kLightDesignCategoryID    = @"11000000";       //海报根分类id
NSString * const kStitchPicBackgroundId    = @"898992";         //拼图背景分类id

NSString * const kLDMallTemplateId         = @"891512";         //海报模板id
NSString * const kLDMallImageID            = @"896574";       //海报图片-包含付费素材id
NSString * const kLDMallPictureId          = @"891520";       //海报图片素材id
NSString * const kLDMallBackgroundId       = @"891516";       //海报背景素材id
NSString * const kLDMallShapeId            = @"891523";       //海报形状素材id
NSString * const kLDMallArtQRCodeId        = @"896448";       //海报艺术二维码id

NSString * const kVDMallMappingImage       = @"894046"; //视频贴图库
NSString * const kVDMallGifImage           = @"894050";  //视频商城gif
NSString * const kVDMallAlbumVideoId       = @"896452";   //视频相册根id
NSString * const kVDMallFlashVideoId       = @"896453";   //快闪根id
NSString * const kVDMallPointVideoId       = @"896454";   //卡点根id


//896442  视频商城根id

NSString * const kSDSudokuTypeImage        = @"53";
NSString * const kSDSudokuTypeOnlookers    = @"54";
NSString * const kSDSudokuTypeText         = @"55";
NSString * const kSDSudokuTypeJoin         = @"56";
NSString * const kTXMusicKey               = @"bc584f51-4218-494d-ad99-73b9b7cfcee5";//腾讯音乐库key

NSString * const kMemberSpecificTemplateH5ID             = @"890733";       //H5根分类id
NSString * const kMemberSpecificTemplateLightDesignID    = @"891512";       //海报根分类id
NSString * const kMemberSpecificTemplateFormID           = @"891425";       //表单根分类id
NSString * const kMemberSpecificTemplateVideoID          = @"896442";       //视频跟分类id
NSString * const kMemberSpecificTemplateLongPageID       = @"896630";         //长页极简跟分类id

NSString * const kMaxAdvertLongPageListBanner               = @"262";    //APP-长页作品列表页公告
NSString * const kSuperMemberBannerAdID                  = @"263";    //APP-超级会员顶部banner
NSString * const kSuperMemberRightsAdID                  = @"264";    //APP-超级会员权益介绍区

NSString * const kH5HotRecommendId                   = @"137";      //H5(默认)热门分类id
NSString * const kPerferencesSettingCategoryId       = @"85";      //完善信息-行业子分类id

NSString * const kBatchWaterCategoryId            = @"896683";      //批量水印分类id
NSString * const kMappingPictureListID            = @"896681";      //贴纸的list-id
#endif

//预发布
#if 0
NSString * const kHeaderUrl                = @"http://m1.eqxiu.com";
NSString * const kImageHeaderUrl           = @"http://res3.eqh5.com/";
NSString * const kTencentcdn               = @"http://video-1251586368.file.myqcloud.com"; // 腾讯视频地址
NSString * const kTencentimgcdn            = @"http://video-1251586368.image.myqcloud.com"; // 腾讯图片地址
NSString * const kSceneShareUrl            = @"http://m.eqxiu.com/s/";   //参数code
NSString * const kBootJavascriptUrl        = @"http://as.eqh5.com"; //因为编辑器给的是正式的版本号，预发布和线上的一致
NSString * const kUpdateAccountUrl         = @"http://www.eqxiu.com";
NSString * const kDataServerUrl            = @"http://data.eqxiu.com";
NSString * const kVipUrl                   = @"http://vip.eqxiu.cn";
NSString * const kXDPayHeaderUrl           = @"http://xiupay.eqxiu.com";
NSString * const kShowerHeaderUrl          = @"http://showker.eqxiu.com";
NSString * const kCalendarHeaderUrl        = @"http://calendar.eqxiu.com";
NSString * const kBigDataBuriedUrl         = @"http://datalog.eqxiu.com/p.gif";
NSString * const kOldNewShareUrl           = @"http://appweb.eqxiu.com";
NSString * const kUerServiceHeaderUrl      = @"http://passport.eqxiu.com";//用户服务的域名
NSString * const kEasyFormPreUrl           = @"https://form.ebdan.net/ls";     //表单预览域名
NSString * const kLongpagePreUrl           = @"https://h5.eqxiul.com";     //长页预览域名
NSString * const kWapHeadUrl               = @"http://wap.eqxiu.com";    //积分wap页域名
NSString * const kUserApiHeadUrl           = @"http://assist-api.eqxiu.com";     //用户注册后礼包、信息等
NSString * const kInvoiceHeaderUrl         = @"http://pay.eqxiu.com";           //发票域名
NSString * const kMaxGDHeaderUrl           = @"http://iom-api.eqxiu.com";        //中台广告（运营位）域名
NSString * const kMaxUserPerHeaderUrl      = @"http://muc.eqxiu.com";       //中台信息补足页面域名

NSString * const kVideoShareUrl            = @"https://a.veqxiu.com/video/player/0/";//视频作品分享地址
NSString * const kVideoTemplateShareUrl    = @"https://a.veqxiu.com/video/player/";//视频模板分享地址

NSString * const kCommunityHeaderUrl       = @"http://app.eqxiu.com";   //用户社区域名
NSString * const kEasyFormLocalUrl         = @"http://form-preview-api.eqxiu.com";   //表单本地预览会调用的
NSString * const kLworkApiUrl              = @"http://lwork-api.eqxiu.com";  //积分任务

NSString * const kMallMusicID              = @"890162";         //商城音乐分类Id
NSString * const kNewMallFontID            = @"897981";         //新商城字体分类id
NSString * const kMallPictureID            = @"889982";         //商城图片分类id
NSString * const kLPMallPictureID          = @"897582";         //长页图片商城分类id
NSString * const kMallSoundID              = @"890017";         //商城音效分类id
NSString * const kMallBackgroundID         = @"889998";         //商城背景分类id
NSString * const kMallSingleTemplateID     = @"890477";         //商城单页模板分类id
NSString * const kRecommendPageCode        = @"0zl7Stp2kM";     //推荐页专题模块唯一id
NSString * const kEasyFormSuperID          = @"892960";     //表单父类id
NSString * const kLightDesignCategoryID    = @"11000000";       //海报分类id
NSString * const kStitchPicBackgroundId    = @"898992";         //拼图背景分类id

NSString * const kLDMallTemplateId         = @"893757";         //海报模板id
NSString * const kLDMallImageID            = @"897507";       //海报图片-包含付费素材id
NSString * const kLDMallPictureId          = @"893820";       //海报图片素材id
NSString * const kLDMallBackgroundId       = @"893821";       //海报背景素材id
NSString * const kLDMallShapeId            = @"893822";       //海报形状素材id
NSString * const kLDMallArtQRCodeId        = @"896645";       //海报艺术二维码id

NSString * const kVideoImgFileHeaderUrl    = @"http://res3.eqh5.com/";//视频工具中图片七牛文件头
NSString * const kVideoFileHeaderUrl       = @"http://res4.eqh5.com/";//视频七牛文件头

NSString * const kVDMallMappingImage       = @"895862";
NSString * const kVDMallGifImage           = @"895888";
NSString * const kVDMallAlbumVideoId       = @"896630";   //视频相册根id
NSString * const kVDMallFlashVideoId       = @"896706";   //快闪根id
NSString * const kVDMallPointVideoId       = @"896708";   //卡点根id

NSString * const kSDSudokuTypeImage        = @"71";
NSString * const kSDSudokuTypeOnlookers    = @"72";
NSString * const kSDSudokuTypeText         = @"73";
NSString * const kSDSudokuTypeJoin         = @"74";
NSString * const kTXMusicKey               = @"bc584f51-4218-494d-ad99-73b9b7cfcee5";//腾讯音乐库key

NSString * const kMemberSpecificTemplateH5ID             = @"891482";       //H5根分类id
NSString * const kMemberSpecificTemplateLightDesignID    = @"893757";       //海报根分类id
NSString * const kMemberSpecificTemplateFormID           = @"892960";       //表单根分类id
NSString * const kMemberSpecificTemplateVideoID          = @"896619";       //视频分分类id
NSString * const kMemberSpecificTemplateLongPageID       = @"897841";         //长页极简跟分类id

NSString * const kMaxAdvertLongPageListBanner               = @"145";    //APP-长页作品列表页公告
NSString * const kSuperMemberBannerAdID                  = @"146";    //APP-超级会员顶部banner
NSString * const kSuperMemberRightsAdID                  = @"147";    //APP-超级会员权益介绍区

NSString * const kH5HotRecommendId                    = @"635";      //H5(默认)热门分类id
NSString * const kPerferencesSettingCategoryId        = @"141";      //完善信息-行业子分类id

NSString * const kBatchWaterCategoryId            = @"898410";      //批量水印分类id
NSString * const kMappingPictureListID            = @"898553";      //贴纸的list-id
#endif



NSInteger kChannel = 21;

//普通列表搜索code 样例：96171 图片：93401 字体：93044 音乐：93043 单页：96206 表单：62010 海报：96207 形状：93048 视频：9111815 艺术二维码：96207,长页-93102
NSString * const kLeaderboardSearchCode    =  @"96181";
NSString * const kSampleSearchCode         =  @"96171";
NSString * const kImageSearchCode          =  @"93041";
NSString * const kFontSearchCode           =  @"93044";
NSString * const kMusicSearchCode          =  @"93043";
NSString * const kSinglePageSearchCode     =  @"96206";
NSString * const kFormSearchCode           =  @"62010";
NSString * const kLightDSearchCode         =  @"96207";
NSString * const kShapeSearchCode          =  @"93048";
NSString * const kVideoSearchCode          =  @"9111815";
NSString * const kArtQRcodeSearchCode      =  @"96207";
NSString * const kLongPageSearchCode       =  @"93102";
//搜索界面搜索code 样例：92201 图片：93041 字体：93044 音乐：93043 单页：93046 表单：30410 海报：93047 形状：93048 视频：9111815,长页-93101

NSString * const kSearchCompositeSearchCode   =  @"92200";
NSString * const kSearchSampleSearchCode   =  @"92201";
NSString * const kSearchImageSearchCode    =  @"93041";
NSString * const kSearchFontSearchCode     =  @"93044";
NSString * const kSearchMusicSearchCode    =  @"93043";
NSString * const kSearchSinglePageSearchCode= @"93046";
NSString * const kSearchFormSearchCode     =  @"30410";
NSString * const kSearchLightDSearchCode   =  @"93047";
NSString * const kSearchShapeSearchCode    =  @"93048";
NSString * const kSearchVideoSearchCode    =  @"9111815";
NSString * const kSearchLongPageSearchCode =  @"93101";

NSString * const kAllSceneSearchCode       = @"98612";//APP-全部作品搜索code
NSString * const kUserPlatformCode         =  @"A020009";//ios端productCode

NSString * const kFontFileterPriceRangeID  = @"60000001";       //字体筛选价格区间id
NSString * const kMusicFileterPriceRangeID = @"60000003";       //音乐筛选价格区间id
NSString * const kImageFilterPriceRangeID  = @"60000004";       //图片筛选价格区间id
NSString * const kSampleFilterPriceRangeID = @"30000000";       //样例筛选价格区间id

#pragma mark 内购相关
NSString * const kInPurchasedErrorUrl      = @"/v3/app-pay/ios/param/backup";

