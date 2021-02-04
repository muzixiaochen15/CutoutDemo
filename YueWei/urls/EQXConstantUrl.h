//
//  EQXConstantUrl.h
//  YiQiXiu
//
//  Created by Sherry on 2019/7/25.
//  Copyright © 2019 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    //商品类型 1：图片 2：样例 3：音乐 4：字体 6：单页模版 7： 海报 8：图形 10：长页 11：表单 15:视频 99:综合
    kGoodsImageType = 1,
    kGoodsSampleType = 2,
    kGoodsMusicType = 3,
    kGoodsFontType = 4,
    kGoodsSingleSampleType = 6,
    kGoodsLightDesignType = 7,
    kGoodsShapeType = 8,
    kGoodsLongPageType = 10,
    kGoodsEasyFormType = 11,
    kGoodsVideoType = 15,
    kGoodsCompositeType = 99
};

extern NSString *const kHeaderUrl;
extern NSString *const kImageHeaderUrl;
extern NSString *const kTencentcdn; // 腾讯视频地址
extern NSString *const kTencentimgcdn; // 腾讯图片地址
extern NSString *const kSceneShareUrl;
extern NSString *const kBootJavascriptUrl;
extern NSString *const kUpdateAccountUrl;
extern NSString *const kDataServerUrl;
extern NSString *const kVipUrl;
extern NSString *const kXDPayHeaderUrl;
extern NSString * const kShowerHeaderUrl;
extern NSString * const kCalendarHeaderUrl;
extern NSString * const kBigDataBuriedUrl;
extern NSString * const kOldNewShareUrl;
extern NSString * const kUerServiceHeaderUrl;//用户服务的域名
extern NSString * const kEasyFormPreUrl;               //表单预览url
extern NSString * const kLongpagePreUrl;               //长页预览url
extern NSString * const kVideoShareUrl;         //视频y分享地址
extern NSString * const kVideoTemplateShareUrl;     //视频模板分享地址
extern NSString * const kWapHeadUrl;    //积分wap页域名
extern NSString * const kUserApiHeadUrl;     //用户注册后礼包、信息等
extern NSString * const kInvoiceHeaderUrl;           //发票域名
extern NSString * const kMaxGDHeaderUrl;        //中台广告（运营位）域名
extern NSString * const kMaxUserPerHeaderUrl;       //中台信息补足页面域名
extern NSString * const kCommunityHeaderUrl;   //用户社区域名
extern NSString * const kEasyFormLocalUrl;   //表单本地预览会调用的
extern NSString * const kLworkApiUrl;       //积分任务
extern NSString * const kMaxAdvertLongPageListBanner;//APP-长页作品列表页公告
extern NSString * const kSuperMemberBannerAdID;//APP-超级会员顶部banner
extern NSString * const kSuperMemberRightsAdID;//APP-超级会员权益介绍区
extern NSString * const kH5HotRecommendId;      //H5(默认)热门分类id
extern NSString * const kPerferencesSettingCategoryId;      //完善信息-行业子分类id


extern NSInteger kChannel;
extern NSString * const kFontFileterPriceRangeID;      //字体筛选价格区间id
extern NSString * const kMusicFileterPriceRangeID;          //音乐筛选价格区间id
extern NSString * const kImageFilterPriceRangeID;//图片筛选价格区间id
extern NSString * const kSampleFilterPriceRangeID ;  //样例筛选价格区间id

//搜索code 样例：96171 图片：93401 字体：93044 音乐：93043 单页：96206 表单：62010 海报：96207 形状：93048 长页-93102
extern NSString * const kLeaderboardSearchCode;
extern NSString * const kSampleSearchCode;
extern NSString * const kImageSearchCode ;
extern NSString * const kFontSearchCode;
extern NSString * const kMusicSearchCode ;
extern NSString * const kSinglePageSearchCode;
extern NSString * const kFormSearchCode;
extern NSString * const kLightDSearchCode;
extern NSString * const kShapeSearchCode;
extern NSString * const kVideoSearchCode;
extern NSString * const kArtQRcodeSearchCode;
extern NSString * const kLongPageSearchCode;
//搜索code 样例：92201 图片：93041 字体：93044 音乐：93043 单页：93046 表单：30410 海报：93047 形状：93048 长页-93101
extern NSString * const kSearchCompositeSearchCode;
extern NSString * const kSearchSampleSearchCode;
extern NSString * const kSearchImageSearchCode;
extern NSString * const kSearchFontSearchCode ;
extern NSString * const kSearchMusicSearchCode ;
extern NSString * const kSearchSinglePageSearchCode;
extern NSString * const kSearchFormSearchCode;
extern NSString * const kSearchLightDSearchCode;
extern NSString * const kSearchShapeSearchCode;
extern NSString * const kSearchVideoSearchCode;
extern NSString * const kSearchLongPageSearchCode;

extern NSString * const kAllSceneSearchCode;//APP-全部作品搜索code

extern NSString * const kUserPlatformCode;

extern NSString * const kMallMusicID;         //商城音乐分类Id
extern NSString * const kNewMallFontID;       //新商城字体分类id
extern NSString * const kMallPictureID;         //商城图片分类id
extern NSString * const kLPMallPictureID;      //长页图片商城分类id
extern NSString * const kMallSoundID;         //商城音效分类id
extern NSString * const kMallBackgroundID;         //商城背景分类id
extern NSString * const kMallSingleTemplateID;         //商城单页模板分类id
//extern NSString * const kMusicFileterPriceRangeID;       //音乐筛选价格区间id
extern NSString * const kRecommendPageCode;     //推荐页专题模块唯一id
extern NSString * const kEasyFormSuperID; //表单父类id
extern NSString * const kLightDesignCategoryID;       //海报分类id
extern NSString * const kStitchPicBackgroundId;       //拼图背景分类id
extern NSString * const kLDMallTemplateId;         //海报模板id
extern NSString * const kLDMallImageID;       //海报图片-包含付费素材id
extern NSString * const kLDMallPictureId;       //海报图片素材id
extern NSString * const kLDMallBackgroundId;    //海报背景素材id
extern NSString * const kLDMallShapeId;       //海报形状素材id
extern NSString * const kLDMallArtQRCodeId;       //海报艺术二维码id

////九宫格类型
extern NSString * const kSDSudokuTypeImage;       //图片
extern NSString * const kSDSudokuTypeOnlookers;   //围观
extern NSString * const kSDSudokuTypeText;        //文字
extern NSString * const kSDSudokuTypeJoin;       //拼

extern NSString * const kVDMallMappingImage; //视频相册贴图库
extern NSString * const kVDMallGifImage; //视频商城gif
extern NSString * const kVDMallAlbumVideoId;   //视频相册根id
extern NSString * const kVDMallFlashVideoId;   //快闪根id
extern NSString * const kVDMallPointVideoId;   //卡点根id

extern NSString * const kTXMusicKey;//腾讯音乐库key

extern NSString * const kMemberSpecificTemplateH5ID; //H5根分类id
extern NSString * const kMemberSpecificTemplateLightDesignID; //海报根分类id
extern NSString * const kMemberSpecificTemplateFormID;//表单根分类id
extern NSString * const kMemberSpecificTemplateVideoID;       //视频分分类id
extern NSString * const kMemberSpecificTemplateLongPageID;         //长页极简跟分类id

extern NSString * const kBatchWaterCategoryId;      //批量水印分类id
extern NSString * const kMappingPictureListID;      //贴纸的list-id
#pragma mark 内购相关
extern NSString * const kInPurchasedErrorUrl;

extern NSString *const kVideoImgFileHeaderUrl;//视频工具中图片七牛文件头
extern NSString *const kVideoFileHeaderUrl;//视频七牛文件头

