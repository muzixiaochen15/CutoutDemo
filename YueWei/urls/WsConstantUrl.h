//
//  WsConstantUrl.h
//  YiQiXiu
//
//  Created by Sherry on 15/6/8.
//  Copyright (c) 2015年 Sherry. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark 登录、注册等
extern NSString *const kLoginURL;
extern NSString *const kRegisterUrl;
extern NSString *const kFindPwdUrl; //找回密码
extern NSString *const kLoginOutUrl;
extern NSString *const kCurrentLoginState;
extern NSString *const kShanYanQuickLoginUrl;           //闪验快捷登录-换了闪验SDK_iOS_v2.3.1.2_2020.04.17
extern NSString *const kChangePwdUrl;
extern NSString *const kPhoneRegisterUrl;   //发送手机注册验证码
extern NSString *const kPhoneQuickLoginUrl; //手机号快捷登录
extern NSString *const kScanQRCodeLoginUrl; //扫码确认登录
extern NSString *const kScanQRCodePCLoginUrl; //更新二维码状态(PC扫码登录)
extern NSString *const kUpdateQRCodeUrl;    //更新二维码状态
extern NSString *const kPhoneLoginGetToken; //手机号登录获取token
extern NSString * const kCancellactionUrl;         //账号注销
extern NSString * const kGetPhoneInfoUrl;          //通过手机号，获取账号信息
extern NSString * const kGetThirdInfoUrl;              //通过第三方获取账号信息
extern NSString * const kCancellationSendCodeUrl;                 //注销验证手机号发送验证码
extern NSString * const kCancellationCheckUrl;                //注销验证验证码
extern NSString * const kCancellationCheckPsdUrl;            //注销验证密码
extern NSString * const kUntieOrginalAccountUrl;              //解绑第三方原来绑定的账号
extern NSString * const kBindThirdUrl;                //解绑了原来的账号后绑定第三方账号
extern NSString * const kSendBindPhoneCodeUrl;            //发送绑定验证码
extern NSString * const kCheckBindCodeUrl;           //验证绑定验证码
extern NSString * const kBindPhoneUrl;            //绑定手机号
extern NSString * const kUntieOriginalPhoneUrl;          //将手机号从原账号上解绑
extern NSString * const kExchangeBindingPhoneUrl;        //更换手机号，发短信
extern NSString * const kSetAccountPsdUrl;               //账号z设置密码
extern NSString * const kSysParamSwitchUrl;             //获取系统参数
extern NSString * const kBindOrRelationCodeUrl;           //发送绑定/关联验证码
extern NSString * const kCheckBindOrRelationUrl;      //校验当前用户是否已绑定或关联手机号
extern NSString * const kBindOrRelationPhoneUrl;         //绑定或关联手机号
extern NSString * const kMerageAccountUrl;     //合并账号

extern NSString * const kUserLevelUrl;              //获取用户积分、等级信息
extern NSString * const kUserLevelRightsUrl;        //获取用户等级对应权益列表
extern NSString * const kUserIntegralHistoryUrl;          //用户积分历史列表
extern NSString * const kReceiveMembershipRightsUrl;  ////领取会员
extern NSString * const kUserWechatFollowedUrl;           //用户是否关注公众号
extern NSString * const kUserOperatorsUrl;             //获取当前用户身份列表
extern NSString * const kUserRunasUrl;             //选择身份登录
extern NSString * const kUserStaffInfoUrl;        //获取当前(用户作为员工)员工信息
extern NSString * const kBusinessRandarUrl;       //商机雷达html
extern NSString * const kBossEyeUrl;              //boss天眼
#pragma mark 设置信息
extern NSString *const kDeviceTokenUrl;      //上传deviceToken
extern NSString *const kNewVersionUrl;       //查看新版本
extern NSString *const kOtherAppLoginUrl;    //关联第三方账号并注册
extern NSString *const kOtherWeChatAppLoginUrl;
extern NSString *const kBindAccountUrl; //微信、QQ、微博绑定邮箱账号
extern NSString * const kAppleLoginUrl;       //苹果账号登录

extern NSString *const kDomainListUrl;  //域名列表
extern NSString *const kAllMessageUrl; //所有消息 unread:true 默认false是否只查未读可选
extern NSString *const kMarkReqdUrl; //标记消息为已读 ids 标志为已读的消息ID列表
extern NSString *const kMsgFrontReqUrl; //站内信消息列表
extern NSString *const kMsgAllMarkReadUrl; //站内信消全部置为已读
extern NSString *const kUserInfoUrl;   //用户完整信息
extern NSString *const kSaveUserInfoUrl; //保存用户信息 name phone tel sex 1:男
extern NSString *const kDeleteMsgUrl;   //删除消息
extern NSString *const kMsgPushSettingUrl;//推送设置
extern NSString *const kMsgSettingPushUrl;//设置推送
extern NSString *const kMsgMarkRead;      //标记已读
extern NSString *const kNewMsgCount;      //消息数量
/** 获取子账号 */
extern NSString *const kGetSubAccountUrl;
/** 获取部门列表 */
extern NSString *const kGetDepartmentUrl;
// 2：女 qq headImg:头像
extern NSString * const kUserUnfoCountUrl;        //获取用户订单、优惠券、收藏个数
extern NSString * const kMemberInfoUrl;            //获取用户会员信息
extern NSString * const kMemberSaveListUrl;        //会员省钱列表

#pragma mark 关于秀点
extern NSString *const kXiuDianCountUrl;      //我的秀点
extern NSString *const kXiuDianIncomeUrl;     //我的秀点收支日志
extern NSString *const kVerifyRechargeUrl;    //验证充值
extern NSString *const kBuyTemplateUrl;       //购买模板

#pragma mark 数据推广
extern NSString *const kSceneSafeguardUrl;   //保障详情
extern NSString *const kSceneSafeguardStatusUrl;  //作品保障状态
extern NSString * const kSceneSafeguardCancelUrl; //保障关闭
extern NSString * const kSceneSafeguardOpenUrl;   //保障开启
#pragma mark 我的作品
extern NSString *const kMyScenceUrl;          //我的作品
extern NSString *const KAllSceneUrl;          //所有作品
extern NSString *const kSearchAllSceneUrl;     //全部作品列表搜索
extern NSString *const kBannerUrl;            //广告栏

extern NSString *const kSceneClientUrl;       //作品表单数据
extern NSString *const kSceneMessageUrl;      //作品留言数据
extern NSString *const kSceneElementsUrl;     //作品表单和留言
extern NSString *const kEasyFormMessageBoardUrl;     //表单留言信息列表
extern NSString *const KSceneDataAnalysis;   //报表分析
extern NSString *const kSceneFormShareSuccess;//报表分享成功
extern NSString *const kScenePresented; //作品转赠
extern NSString *const kSceneMsgDeleteUrl;    //作品留言删除
extern NSString *const kEasyFormMsgDeleteUrl; //表单作品留言删除
extern NSString *const kEasyFormMsgChoiceSetUrl; //表单作品留言添加取消精选
extern NSString *const kSceneDeleteUrl;       //删除作品
extern NSString *const kSceneOnUrl;           //关闭作品
extern NSString *const kSceneCopyUrl;         //复制作品
extern NSString *const kSceneDeletePageUrl;   //删除某页
extern NSString *const kScenePublishUrl;      //发布作品
extern NSString *const kSceneAuditListUrl;    //等待审核的作品列表
extern NSString *const kSceneAuditRemindUrl;  //开启审核服务
extern NSString *const kSceneAuditTimeLimitUrl;//作品审核过期时间
extern NSString *const kSceneAuditTimeUrl;     //审核次数
extern NSString *const kSceneAuditLogUrl;      //审核日志

extern NSString *const kSecneDeleteDataUlr;   //删除作品数据
/** 获取作品分组 */
extern NSString *const kGetSceneGroupsUrl;
extern NSString * const kSecneHasAuditedUrl;
extern NSString * const kSceneRecyleListUrl;         //作品回收站列表
extern NSString * const kSceneRecyleRevokeUrl;       //作品从回收站放回原处
extern NSString * const kGetSceneDetialUrl;       //获取作品详情

#pragma mark 上传
extern NSString *const kGetQNTokenUrl;  //获得七牛token
extern NSString *const kGetNoWaterMarkTokenUrl;  //获取无水印token
extern NSString *const kSaveQNInfoUrl;  //七牛上传回调

#pragma mark 作品创建
extern NSString *const kSceneDetailSceneIdUrl;  //获取作品信息
extern NSString *const kSampleDetailSceneIdUrl;//获取模板(原名样例)信息
extern NSString *const kSceneIdFromTopicUrl; //通过专题id获取模板(原名样例)ID
extern NSString *const kSceneTempletFromTopicUrl;
extern NSString *const kTopicListUrl;         //专题列表
extern NSString *const kFontListUrl;          //字库列表
extern NSString *const kIsPayedUrl;
//extern NSString * const kCreateHomeUrl;//创作页获取专题、模板(原名样例)等
extern NSString * const kSceneSpecialList;        //新-获取主题下专题列表
extern NSString * const kRecomendPageListUrl;         //首页“最新推荐”列表
extern NSString * const kOldBeltNewUserUrl;          //获取专题下商品详细信息列表包含老带新活动信息
extern NSString * const kUseOldBeltTemplateUrl;       //老带新活动批量使用商品
extern NSString * const kAudioToTextUrl;              //语音转文字
extern NSString * const kAudioToTextResultUrl;        //语音转文字结果查询
extern NSString * const kWordSayingStyle;             //字说字画风格
extern NSString * const kWordSayingCreate;            //字说空白创建作品


#pragma mark 新的相册和贺卡接口
extern NSString * const kRequestTopicListNewUrl;       //专题列表
extern NSString * const kTopicPropertyUrl;      //获取app分类属性

#pragma mark 作品编辑
extern NSString *const kScenePageNumUrl; //获取作品页数(sceneId 参数)
extern NSString *const kSaveScenePageForSaveUrl;//保存作品所有页面
extern NSString * const kSaveH5ZipElementUrl;             //H5保存作品数据，（压缩）

extern NSString *const kCreateNewPageUrl; //创建新页面 新页面前的参数pageid
extern NSString *const kTempletUrl;        //模板内容 pageid
extern NSString * const kScenePageManageUrl;
extern NSString * const kSceneCheckWords;

#pragma mark 作品设置
extern NSString *const kMyMp3ListUrl;     //我的音乐列表
extern NSString *const kSaveSceneSetUrl;  //保存作品设置
extern NSString *const kRemoveLastPageUrl;  //购买秀点去广告
extern NSString *const kRemovePageEndUrl; //去广告免费购买
extern NSString *const kH5RemovePageEndUrl;  //H5去广告免费购买
extern NSString *const kEFormRemovePageEndUrl; //表单去广告免费购买
extern NSString *const kLPRemovePageEndUrl; //长页去广告免费购买
extern NSString *const kPCH5RemovePageEndUrl; //h5作品PC预览去广告
extern NSString *const kPCEFormRemovePageEndUrl; //表单作品PC预览去广告
extern NSString *const KPCLPageRemovePageEndUrl; //长页作品PC预览去广告
extern NSString *const kPCVideoRemovePageEndUrl; //视频作品PC预览去广告


#pragma mark 关于客户
extern NSString *const kMyCLientListUrl;    //我的客户数据列表
extern NSString *const kClientEditUrl;      //客户修改保存
extern NSString *const kClientDeleteUrl;    //删除客户
extern NSString *const kClientSenceDataUrl; //作品表单元素
extern NSString *const kClientImportUrl;    //从作品中导入客户
extern NSString *const kClientPhoneImportUrl;//手机号批量导入
extern NSString *const kClientSceneDataUrl; //统计未导入数据的作品

#pragma mark 我的图片
extern NSString *const kUserPictureListUrl; //查询个人图片

#pragma mark 消息推送
extern NSString *const kMessageTimeUrl;    //获取用户消息推送时间段
extern NSString *const kSetMessageTimeUrl; //设置用户消息推送时间段
extern NSString *const kGetMessageOpenUrl; //获取用户开启表单、留言板推送的作品
extern NSString *const kOpenCloseDataMsgUrl; //开启、关闭作品表单消息推送
extern NSString *const kOpenCloseBoardMsgUrl; //开启、关闭作品留言板消息推送
extern NSString *const kUnbundlingTokenUrl; //解绑token
extern NSString * const kOpenMsgPushUrl;//开启短信推送
extern NSString * const kUploadJPushMsgUrl;            //标记已读推送消息上传给u服务器
extern NSString * const kGetPushReminderUrl;       //获取push消息提醒通知
extern NSString * const kPushMsgReminderUrl;       //push消息通知提醒上报

#pragma mark 用户中心
extern NSString *const kBindingPhoneUrl; //绑定手机
extern NSString *const kUnRelationUrl;   //解绑
extern NSString *const kPhoneVerifyUrl;  //手机验证
extern NSString *const kYQXBindThirdUrl; //移动端 - 易企秀账号绑定第三方账号
extern NSString *const kResetPasswordUrl;  //重置密码
extern NSString *const kPhoneResetPwdUrl;  //手机重置密码发送验证码
extern NSString *const kcheckPhoneCodeUrl; //校验手机验证码

#pragma mark 本地预览相关
extern NSString *const kModelVersionNumUrl; //获取本地预览模板版本号

#pragma mark 字体
extern NSString * const kFontByFontFamilyUrl;           //根据fontFamily 获取字体
extern NSString * const kPreDownloadFontUrl;           //六款托底字体
#pragma mark 模板
extern NSString * const kTemplateListUrl;     //获取模板页列表
extern NSString * const kTemplateTopicListUrl; //有模板(原名样例)、专题的作品获取模板页列表
#pragma mark 样例收藏
extern NSString * const kTemplateFavoriteList; //收藏列表
extern NSString * const kAddTemplateFavorite;  //添加收藏
extern NSString * const kDeleteTemplateFavorite; //删除收藏
extern NSString * const kCheckSceneFavoriteStatus; //检查收藏
#pragma mark 关于广告
extern NSString * const kProductListUrl;
extern NSString * const kMemberRedemptionCode;
#pragma mark 短信推广
extern NSString * const  kSurplusMsgUrl;              //获取剩余短信条数
extern NSString * const  kSendMsgUrl;                //短信推广
extern NSString * const  kBuyMsgCountUrl;             //购买短信条数


#pragma mark 商城相关
extern NSString * const kGoodsTypeUrl;                        //商品分类
extern NSString * const kGoodsListUrl;
extern NSString * const kMemberUseProductListUrl;             //会员消费记录
extern NSString * const kGoodsStatusUrl;                      //商品购买状态
extern NSString * const kGoodsSearchUrl;                          //商品搜索
extern NSString * const kCompositeSearchUrl;                          //综合搜索

extern NSString * const kGoodsPlaceOrderUrl;                 //秀点下订单（域名kXDPayHeaderUrl）
extern NSString * const kGoodsOrderPaymentUrl;                //秀点付款 （域名kXDPayHeaderUrl）
extern NSString * const kGoodsCallbackUrl;          //callback验证订单
extern NSString * const kGoodsCallbackIdsUrl;          //验证商城多个callbackID 是否成功
extern NSString * const kGoodsPaidUrl;                      //获取用户已购商品
extern NSString * const kGoodsFreePaidUrl;          //免费字体购买
extern NSString * const kSceneSpecialUrl;           //获取专题下的商品列表信息
extern NSString * const kHotWordsUrl;                //获取热词列表
extern NSString * const kGoodsDetailUrl;           //根据ID获取商品信息
extern NSString * const kGoodsNewVerifyUrl;          //新--保存订单【调用商城callback】
extern NSString * const kGoodsPaidCBVerifyUrl;             //付费商品callback验证
extern NSString * const kGoodsFreeDealUrl;            //免费或已购商品使用接口-2.9.7版本之后
extern NSString * const kPopBoxProductIdsUrl;            //推荐页弹窗领1-多个取样例接口
extern NSString * const kGoodsChannelCategoryUrl;         //根据分类ID获取末级包含商品的子分类列表
extern NSString * const kCategoryDetialListUrl;        //根据id获取直接关联的下级分类以及子分类
extern NSString * const kSpecialPageDetailsUrl;             //分页获取专题下商品列表

extern NSString * const kObtainUserRightsUrl;        //获取用户权益
extern NSString * const kReceiveEquityCouponUrl;        //领取权益优惠券
extern NSString * const kMallCategoryAttUrl;           //根据分类id获取属性、属性值（分类列表页面使用）
extern NSString * const kProductImgSearchUrl;       //商品形似列表-根据图片找相似

#pragma mark 大数据相关
extern NSString * const kDataTodayPVUrl;    //
extern NSString * const kDataTotalPVUrl;    //
extern NSString * const kNewDataTotalPVUrl;    //
extern NSString * const kSceneViewAllDayDataUrl;    //
extern NSString * const kDataQrctotalPVUrl;//
extern NSString * const kDataHourListUrl;
extern NSString * const kDataQrchoursUrl;
extern NSString * const kDataSceneMonth;
extern NSString * const kNewDataSceneMonth;
extern NSString * const kNewDataSceneTime;   //访问时长和退出率统计
extern NSString * const kDataSceneListUrl;
extern NSString * const kNewDataHourListUrl;
extern NSString * const kNewDataSceneListUrl;

extern NSString * const kDataShareTypeUrl;
extern NSString * const kDataShareToUrl;
extern NSString * const kDataShareFromUrl;
extern NSString * const kDataRegionUrl;
extern NSString * const kNewDataRegionUrl;
extern NSString * const kDataDeviceUrl;
extern NSString * const kNewDataDeviceUrl;
extern NSString * const kDataPlatformUrl;
extern NSString * const kNewDataPlatformUrl;
extern NSString * const kChannelTemplateRecommdUrl;        //大数据商品推荐-不分页

#pragma mark 优惠券
extern NSString * const kCouponListUrl;                //用户优惠券列表
extern NSString * const kVerifyCouponUrl;             //支付确认-查询优惠券列表，过滤掉不可用优惠券


#pragma mark 频道
extern NSString * const kChannelListUrl;         //获取频道列表
extern NSString * const kChannelProductUrl;        //获取频道下商品

#pragma mark 秀客小店
extern NSString * const kShowerShopUrl;         //秀客小店
extern NSString * const kBoolShowker;        //秀客账号-判断是否editor 账号
extern NSString * const kShowkerInfoUrl;       //秀客信息

#pragma mark 营销日历
extern NSString * const kMarketingCalendarUrl;        //营销日历
#pragma mark 猜你喜欢
extern NSString * const kGuessYouLikeUrl;       //猜你喜欢
#pragma mark 红包
extern NSString * const kgetRedBagParameter;      //红包参数
extern NSString * const kgetRedBagSwitch;         //获取分享红包开关
#pragma mark - 新手礼包
extern NSString *const kNewUserGiftBag;          //新手礼包


#pragma mark 审核相关
extern NSString * const kAuditSignatreUrl;         //获取加急审核付费秀点数
extern NSString * const kAuditPayInfoUrl;            //获取支付签名
extern NSString * const kAuditSceneListUrl;          //未审核和审核未通过作品

#pragma mark  小会员相关
extern NSString * const kMemberSignatureUrl;            //会员签名&创建业务订单
extern NSString * const kMemberCreateOrderUrl;         //创建订单接口
extern NSString * const kMemberBuyProductUrl;          //会员购买“会员免费”商品
extern NSString * const kMemberBuyCallBackUrl;      //会员购买“会员免费”商品回调验证
extern NSString * const kAutomaticCompletionUrl;      //搜索自动补全
extern NSString * const kMemberGiveStatisticUrl;           //赠送会员统计
extern NSString * const kRenwalMemberCheckUrl;          //会员自动续费校验
extern NSString * const kMemberCancelInfoUrl;          //获取续费商品信息
extern NSString * const kMemberCancelGoodsUrl;        //取消自动续费订阅

extern NSString * const kGetCollectionUrl;      //获取作品集ID

#pragma mark 会员
extern NSString * const kCreativePaySignatureUrl;              //会员获取签名
extern NSString * const kCreativePayCheckUrl;          //会员校验
extern NSString * const kVerifyFailedReceipt;//补偿
#pragma mark 用户积分等级相关
extern NSString * const kGetUserLevel;          //获取用户积分、等级信息
extern NSString * const KGetScoreTaskUrl;    //获取积分任务

#pragma mark 海报相关
extern NSString * const kLightDesignAddScore;          //海报下载作品加积分

extern NSString * const kDownloadAppAddScore;          //app下载加积分

extern NSString * const kBrowsingPageAddScore;         //浏览页面加积分


extern NSString * const kOpenPushSwitchAddScore;          //开启推送加积分

#pragma mark 运营活动
extern NSString * const kActivityListUrl;   //活动列表
extern NSString * const kActivitySubscribeUrl; //订阅活动



#pragma mark 日签
extern NSString * const kDaySignInUrl;           //签到
extern NSString * const kDaySignStateUrl;      //检查签到状态
extern NSString * const kDaySignListUrl;            //签到列表
extern NSString * const kDaySignTemplateUrl;            //日签模板
extern NSString * const kCheckInReceiveTempleUrl;            //领取模板
extern NSString * const kDaySignReminderSetUrl;            //设置日签提醒
extern NSString * const kDaySignCheckStateUrl;            //日签签到状态检测
extern NSString * const kOneClickPickUpUrl;            //日签一键领取

#pragma mark 第三方音乐相关
extern NSString * const kTXMusicCategoryUrl;          //获取腾讯音乐的分类
extern NSString * const kTXMusicListUrl;         //获取腾讯音乐列表
extern NSString * const kTXMusicPlayPathUrl;     //获取腾讯音乐播放地址
extern NSString * const kTXMusicReportListenUrl;      //腾讯音乐上报，听歌数据
extern NSString * const kTXMusicReportOperateUrl;      //腾讯音乐上报，用户行为

extern NSString * const kTXMusicZipReportUrl;
extern NSString * const kTXMusicUncompressReportUrl;          //腾讯音乐上报（无压缩数据）4.18.0

#pragma mark 新用户相关
extern NSString * const kUserTagListUrl;        //获取标签列表
extern NSString * const kUploadOccupationUrl;         //上传新用户岗位信息
extern NSString * const kUploadUsageAUrl;          //上传新用户用途信息
extern NSString * const kUploadIndustryAUrl;          //上传新用户行业信息
extern NSString * const kUploadInformationUrl;           //上传用户其他补充信息
extern NSString * const kShowkerOrderListUrl;            //秀客分成记录

extern NSString *const kWaterMarkDownloadDeductionsUrl;      //海报-今日剩余免费下载次数
extern NSString *const kWaterMarkDownloadRemainingsUrl;      //海报-下载次数扣减
extern NSString *const kGetWaterMarkImageUrl;//无水印图片获取
extern NSString *const kSetWaterMarkImageUrl;//无水印图片设置

extern NSString *const kGetWaterMarkImageUploadUrl;//无水印图片上传七牛
extern NSString *const kGetPrintCoverIsMark;//作品封面是否有水印

#pragma mark 中台广告位
extern NSString * const kIomAdvertAdMapUrl;     //中台广告位（map返回数据）
extern NSString * const kIomAdvertAdListUrl;      //中台广告位（list返回数据）

#pragma mark 用户社区
extern NSString * const kCommunityCategoryListUrl;       //用户社区频道列表
extern NSString * const kCommunityDetialUrl;       //用户社区某一频道详细内容

#pragma mark wap商城
extern NSString * const kWapMallPreviewUrl;   //wap商城模板预览链接


extern NSString * const kH5LimitPageNumberUrl;   //h5编辑器限制页数


#pragma mark 自定义加载logo
extern NSString * const kSetSceneLoadingLogoUrl;       //作品设置自定义logo
extern NSString * const kRemoveAdDetailUrl;       //去广告权益详情
extern NSString * const kOpenRemoveAdUrl;       //去广告流量包开启
extern NSString * const kCloseRemoveAdUrl;       //去广告流量包关闭
#pragma mark 盲盒
extern NSString * const kPrizesListUrl;       //奖品列表
extern NSString * const kPrizesListUrl;       //奖品列表
extern NSString * const kActivityDetailsUrl;       //活动详情
extern NSString * const kRewardUrl;       //下发奖励
extern NSString * const kGetPrizeRecordUrl;       //获取的奖品记录
#pragma mark 素材管理-图片
extern NSString * const kCheckIfIsFavoriteUrl;      //检查是否收藏
extern NSString * const kPhotoAddFavoriteUrl;      //图片添加收藏
extern NSString * const kPhotoCancelFavoriteUrl;   //图片取消收藏
extern NSString * const kMaterialImageGroupListUrl;   //图片取消收藏
extern NSString * const kMaterialImageGroupDelete; //删除文件夹(tag标签)
extern NSString * const kMaterialImageGroupRename; //更新文件夹名称(tag标签)
extern NSString * const kMaterialImageGroupCreate; //新建文件(tag标签)
extern NSString * const kMaterialImageDelete; //批量删除全部文件夹图片
extern NSString * const kMaterialImageRemove; //批量删除自定义文件夹图片
extern NSString * const kMaterialImageMove; //批量移动图片

extern NSString * const kSceneVisitLimit; //作品设置访问限制
#pragma mark 在线音乐裁剪
extern NSString * const kOnLineMusicCutUrl;        //音频裁切
extern NSString * const kMusicCutStatusSearchUrl;         //裁剪任务状态查询
#pragma mark 短信内容校验
extern NSString * const kMessageCheckUrl;        //短信内容审核&计算
extern NSString * const kSaveMessageSetUrl;      //群发短信-保存设置
extern NSString * const kCancelSendMessageUrl;        //群发短信-取消发送
extern NSString * const kMessageSetListUrl;          //群发短信-设置&list列表
extern NSString * const kMessageReceiverListUrl;       //群发短信-接收人列表(分页)

#pragma mark 首页行业设置相关
extern NSString * const kGetRecommendKeywordUrl;        //查询推荐行业
extern NSString * const kSetRecommendKeywordUrl;        //设置推荐行业
extern NSString * const kGetHomeModelListUrl;   //首页模块列表-推荐页(包含行业推荐)
extern NSString * const kGetIndustryListUrl;   //推荐行业标签列表

#pragma mark 红包
extern NSString * const kCreateRedOrderUrl;    //红包下单，xiupay
extern NSString * const kGetRedPayInfoUrl;       //【充值】获取红包支付信息
extern NSString * const kSetH5RedPacketUrl;        //H5设置红包
extern NSString * const kGetH5RedPacketDeitalUrl;      //获取红包配置信息
extern NSString * const kGetH5RedPacketSummaryUrl;        //红包领取概况
extern NSString * const kGetH5RedPacketDataListUrl;           //红包领取详情
extern NSString * const kDeleteH5RedPacketElementUrl;      //删除红包组件，终止活动


extern NSString * const kUserMemberRightsList;   // 用户会员权益列表
extern NSString * const kVoucherList;   // 兑换券列表
extern NSString * const kVoucherReceive;   // 兑换券领取
extern NSString * const kVoucherGet;   // 兑换券领取
extern NSString * const kMemberPendingPaymentOrderConversion;   //会员待支付订单转化接口
extern NSString * const kGetPayMentInfo;   //会员待支付订单转化接口
