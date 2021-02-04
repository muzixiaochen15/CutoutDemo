//
//  WsConstantUrl.m
//  YiQiXiu
//
//  Created by Sherry on 15/6/8.
//  Copyright(c) 2015年 Sherry. All rights reserved.
//

#import "WsConstantUrl.h"

#pragma mark 登录、注册等
NSString * const kLoginURL                 = @"/login";
NSString * const kRegisterUrl              = @"/eqs/phone/register";        //手机注册
NSString * const kFindPwdUrl               = @"/eqs/pwd/retrieve4app";         //找回密码
NSString * const kLoginOutUrl              = @"/logout";
NSString * const kCurrentLoginState        = @"/account/info";                     //登录状态
NSString * const kShanYanQuickLoginUrl     = @"/eqs/flashsdk/quick/login2";           //闪验快捷登录-换了极光登录-4.22.0-又换回去了

NSString * const kChangePwdUrl             = @"/user/pwd/change";       //修改密码
NSString * const kPhoneRegisterUrl         = @"/eqs/register/code";       //发送手机注册验证码
NSString * const kPhoneQuickLoginUrl       = @"/eqs/quick/login";           //手机号快捷登录
NSString * const kScanQRCodeLoginUrl       = @"/v2/user/qrcode/login";      //扫码确认登录
NSString * const kScanQRCodePCLoginUrl       = @"/v2/user/qrcode/set/pc/status";      //更新二维码状态(PC扫码登录)

NSString * const kUpdateQRCodeUrl          = @"/v2/user/qrcode/set/status"; //更新二维码状态
NSString * const kPhoneLoginGetToken       = @"/eqs/sms/token";           //手机号登录获取token
NSString * const kCancellactionUrl         = @"/user/account/cancel";         //账号注销
NSString * const kGetPhoneInfoUrl          = @"/v2/user/info/byphone";          //通过手机号，获取账号信息
NSString * const kGetThirdInfoUrl          = @"/v2/user/info/bythird";              //通过第三方获取账号信息
NSString * const kCancellationSendCodeUrl  = @"/v2/user/send/code";                 //注销验证手机号发送验证码
NSString * const kCancellationCheckUrl     = @"/v2/user/check/code";                //注销验证验证码
NSString * const kCancellationCheckPsdUrl  = @"/v2/user/check/password";            //注销验证密码
NSString * const kUntieOrginalAccountUrl   = @"/v2/user/unbind/third";              //解绑第三方原来绑定的账号
NSString * const kBindThirdUrl             = @"/v2/user/bind/third";                //解绑了原来的账号后绑定第三方账号
NSString * const kSendBindPhoneCodeUrl     = @"/v2/user/send/bind/code";            //发送绑定验证码
NSString * const kCheckBindCodeUrl         = @"/v2/user/check/bind/code";           //验证绑定验证码
NSString * const kBindPhoneUrl             = @"/v2/user/bind/phone";            //绑定手机号
NSString * const kUntieOriginalPhoneUrl    = @"/v2/user/unbind/phone";          //将手机号从原账号上解绑
NSString * const kExchangeBindingPhoneUrl  = @"/v2/user/exchange/phone";        //更换手机号，发短信
NSString * const kSetAccountPsdUrl         = @"/v2/user/set/pwd";               //账号z设置密码
NSString * const kSysParamSwitchUrl        = @"/v2/index/sys-param";             //获取系统参数
NSString * const kBindOrRelationCodeUrl    = @"/v2/user/bind_or_relation/phone/code";           //发送绑定/关联验证码
NSString * const kCheckBindOrRelationUrl   = @"/v2/user/bind_or_relation/phone/check";      //校验当前用户是否已绑定或关联手机号
NSString * const kBindOrRelationPhoneUrl   = @"/v2/user/bind_or_relation/phone";         //绑定或关联手机号
NSString * const kMerageAccountUrl         = @"/v2/user/merge/account";     //合并账号

NSString * const kUserLevelUrl             = @"/v2/user/score/level/info";
//获取用户等级对应权益列表
NSString * const kUserLevelRightsUrl       = @"/v2/user/score/level/benefit/list";
//获取用户积分、等级信息
NSString * const kUserIntegralHistoryUrl       = @"/v2/user/score/level/add/list";          //用户积分历史列表
NSString * const kReceiveMembershipRightsUrl   = @"/v2/benefit/member/receive";          //领取会员
NSString * const kUserWechatFollowedUrl        = @"/v2/user/info/wechatFollowed";           //用户是否关注公众号
NSString * const kUserOperatorsUrl             = @"/v2/user/operators";             //获取当前用户身份列表
NSString * const kUserRunasUrl                 = @"/eqs/runas";             //选择身份登录
NSString * const kUserStaffInfoUrl             = @"/v2/user/staff/info";        //获取当前(用户作为员工)员工信息
NSString * const kBusinessRandarUrl            = @"/v2/user/randar/login"; //商机雷达html
NSString * const kBossEyeUrl                   = @"/v2/user/boss/login";  //boss天眼

#pragma mark 设置信息
NSString * const kDeviceTokenUrl           = @"/v2/index/push/ios/save";                   //上传deviceToken
NSString * const kNewVersionUrl            = @"/v2/index/app/version";                   //查看新版本
NSString * const kOtherAppLoginUrl         = @"/eqs/relAccountByMobile" ;      //关联第三方QQ账号并注册
NSString * const kOtherWeChatAppLoginUrl   = @"/eqs/app/wechat-mp" ;      //关联第三方微信账号并注册
NSString * const kBindAccountUrl           = @"/eqs/bindAccount";  //微信、QQ、微博绑定邮箱账号
NSString * const kAppleLoginUrl            = @"/eqs/apple/login";       //苹果账号登录
NSString * const kDomainListUrl            = @"/v2/index/domains";      //域名列表

NSString * const kAllMessageUrl            = @"/v2/user/msg/new/list"  ;             //所有消息 unread:true 默认false是否只查未读可选
NSString * const kMarkReqdUrl              = @"/v2/user/msg/mark-read";              //标记消息为已读 ids 标志为已读的消息ID列表
NSString * const kMsgFrontReqUrl              = @"/v2/user/msg/front";              //站内信消息列表
NSString * const kMsgAllMarkReadUrl           = @"/v2/user/msg/all/mark-read";     //站内信消息全部置为已读
NSString * const kDeleteMsgUrl            = @"/v2/user/msg/delete";               //删除消息
NSString * const kMsgPushSettingUrl       = @"/v2/user/msg/push/get";       //获取推送设置
NSString * const kMsgSettingPushUrl       = @"/v2/user/msg/push/set";        //设置推送
NSString * const kMsgMarkRead             = @"/v2/user/msg/mark-read";       //标记已读
NSString * const kNewMsgCount             = @"/v2/user/msg/unread/count";    //消息数量
//用户信息
NSString * const kUserInfoUrl              = @"/v2/user/info";                  //用户完整信息
NSString * const kSaveUserInfoUrl          = @"/v2/user/save";        //保存用户信息 name phone tel sex 1:男 2：女 qq headImg:头像
NSString * const kGetSubAccountUrl         = @"/v2/user/sub/list";           //获取子账号列表
NSString * const kGetDepartmentUrl         = @"/v2/user/tag/list";           //获取部门列表
NSString * const kUserUnfoCountUrl         = @"/v2/user/info/count";        //获取用户订单、优惠券、收藏个数
NSString * const kMemberInfoUrl            = @"/v2/member/info";            //获取用户会员信息
NSString * const kMemberSaveListUrl        = @"/v2/member/use/product/detail"; //会员省钱列表

#pragma mark 关于秀点
NSString * const kXiuDianCountUrl          = @"/v2/user/xd";                    //我的秀点
NSString * const kXiuDianIncomeUrl         = @"/v2/user/xdlog";                 //我的秀点收支日志
NSString * const kSceneSafeguardUrl        = @"/v3/scene/static/detail";     //作品保障详情
NSString * const kSceneSafeguardStatusUrl  = @"/v3/scene/static/status/";  //作品保障状态
NSString * const kSceneSafeguardCancelUrl  = @"/v3/scene/cancel/static/";  //保障关闭
NSString * const kSceneSafeguardOpenUrl    = @"/v3/scene/staticeze/";      //保障开启
NSString * const kVerifyRechargeUrl        = @"/m/pay/iap/receipt/verify";  //充值成功后验证
NSString * const kBuyTemplateUrl           = @"/m/mall/fodder/buy";         //购买模板


#pragma mark 我的作品
NSString * const KAllSceneUrl              = @"/v3/works/new/list";              //所有作品
NSString * const kSearchAllSceneUrl        = @"/v3/works/list";     //全部作品列表搜索
NSString * const kMyScenceUrl              = @"/v3/scene/my?";                 //我的作品
NSString * const kBannerUrl                = @"/v2/index/banners?";                 //广告栏
NSString * const kSceneClientUrl           = @"/v3/scene/data/";             //作品表单数据
NSString * const kSceneMessageUrl          = @"/v3/scene/msg/data/";         //作品留言数据
NSString * const kSceneElementsUrl         = @"/v3/scene/elements/deal";  //作品表单和留言
NSString * const kEasyFormMessageBoardUrl  = @"/v3/lp/msg/list";           //表单留言信息列表
NSString * const KSceneDataAnalysis        = @"/fs/data/analysis";        //报表分析
NSString * const kSceneFormShareSuccess    = @"/v3/lp/data/share";        //报表分析分享成功
NSString * const kScenePresented           = @"/api/v3.1/editor/transfer"; //作品转赠
NSString * const kSceneMsgDeleteUrl        = @"/v3/scene/msg/data/delete"; //作品留言删除
NSString * const kEasyFormMsgDeleteUrl     = @"/v3/lp/msg/delete"; //表单作品留言删除
NSString * const kEasyFormMsgChoiceSetUrl  = @"/v3/lp/msg/choice/set"; //表单作品添加取消精选
NSString * const kSceneDeleteUrl           = @"/v3/scene/delete?";               //删除作品
NSString * const kSceneOnUrl               = @"/v3/scene/on?";                    //打开作品
NSString * const kSceneCopyUrl             = @"/v3/scene/copy-scene?" ;                  //复制作品
NSString * const kSceneDeletePageUrl       = @"/v3/scene/delete/page/" ;              //删除某页
NSString * const kScenePublishUrl          = @"/v3/scene/publish?id=";                 //发布作品
NSString * const kSceneAuditListUrl        = @"/v3/scene/wait/check";                //等待审核的作品列表
NSString * const kSceneAuditRemindUrl      = @"/v3/scene/buy/remind/sms";             //开启审核提醒服务
NSString * const kSceneAuditTimeLimitUrl   = @"/v3/scene/sms/remind/time";            //作品审核过期时间
NSString * const kSceneAuditTimeUrl        = @"/v2/user/privilege/profile";               //审核次数
NSString * const kSceneAuditLogUrl         = @"/v3/scene/check/remark/";            //审核日志
NSString * const kSecneDeleteDataUlr       = @"/v3/scene/data/delete";                    //删除作品数据
NSString * const kSecneHasAuditedUrl       = @"/v2/order/consumer/verify";  //已申请过审核
NSString * const kSceneRecyleListUrl       = @"/v3/scene/recycle/list";         //作品回收站列表
NSString * const kSceneRecyleRevokeUrl     = @"/v3/scene/recycle/revoke";       //作品从回收站放回原处
NSString * const kGetSceneDetialUrl         = @"/api/v3.1/editor/detail";       //获取作品详情

#pragma mark 上传
NSString * const kGetQNTokenUrl            = @"/v2/file/uptokens";          //获得七牛token
NSString * const kGetNoWaterMarkTokenUrl   = @"/v3/print/cover/token";          //获得无水印图片token
NSString * const kSaveQNInfoUrl            = @"/v2/file/info/save";         //七牛上传回调
NSString * const kGetSceneGroupsUrl        = @"/v3/scene/group/my";       //获取作品分组

#pragma mark 作品创建
NSString * const kSceneDetailSceneIdUrl    = @"/v3/scene/detail/";            //获取作品信息
NSString * const kSampleDetailSceneIdUrl   = @"/v3/scene/sample/detail";   //获取模板(原名样例)信息
NSString * const kSceneIdFromTopicUrl      = @"/m/app/scene/id/list";         //通过专题id获取模板(原名样例)ID
NSString * const kSceneTempletFromTopicUrl = @"/v3/scene/page/list";         //通过专题id获取模板页信息
NSString * const  kTopicListUrl            = @"/v2/app/category/detail";        //分类详情
NSString * const  kFontListUrl             = @"/m/app/scene/text/list";        //字库列表
NSString * const kIsPayedUrl               = @"/m/scene/tpl/paid";//判断用户是否已购买过该模板(原名样例)或模板
//NSString * const kCreateHomeUrl            = @"/v2/index/settings";//创作页获取专题、模板(原名样例)等
NSString * const kSceneSpecialList         = @"/v2/special/list";        //新-获取主题下专题列表
NSString * const kRecomendPageListUrl      = @"/v3/app-product/composite/recommend";         //首页“最新推荐”列表
NSString * const kOldBeltNewUserUrl        = @"/v2/special/details/with/old_belt_new";          //获取专题下商品详细信息列表包含老带新活动信息
NSString * const kUseOldBeltTemplateUrl    = @"/v2/mall/products/deal/with/old_belt_new";       //老带新活动批量使用商品
NSString * const kAudioToTextUrl           = @"/v3/app-audio-to-text/execute";//语音转文字
NSString * const kAudioToTextResultUrl     = @"/v3/app-audio-to-text/execute/result";//语音转文字结果查询
NSString * const kWordSayingStyle          = @"/v3/app-audio-to-text/style/list"; //字说字画风格
NSString * const kWordSayingCreate         = @"/v3/scene/blank/create";   //字说空白创建作品
#pragma mark 新的相册和贺卡接口
NSString * const kRequestTopicListNewUrl   = @"/v2/app/category/list";       //专题列表
NSString * const kTopicPropertyUrl         = @"/v2/app/category/property";      //获取app分类属性


#pragma mark 作品编辑
NSString * const kScenePageNumUrl          = @"/v3/scene/page/list" ;           //获取作品页数(sceneId 参数)
NSString * const kSaveScenePageForSaveUrl  = @"/v3/scene/page/increment-save" ;     //保存作品所有页面
NSString * const kSaveH5ZipElementUrl      = @"/api/v3.1/scene/save";             //H5保存作品数据，（压缩）

NSString * const kCreateNewPageUrl         = @"/v3/scene/page/create/";          //创建新页面 新页面前的参数pageid
NSString * const kTempletUrl               = @"/v3/scene/page/tpl/";            //模板内容 pageid
NSString * const kScenePageManageUrl       = @"/v3/scene/page/manage";         //页面管理，删除or排序
NSString * const kSceneCheckWords          = @"/v3/scene/check/words";         //违禁词

#pragma mark 作品设置
NSString * const kMyMp3ListUrl             = @"/v2/file/list";              //我的音乐列表
NSString * const kSaveSceneSetUrl          = @"/v3/scene/settings/save";         //保存作品设置
NSString * const kRemoveLastPageUrl        = @"/v3/scene/trailer/page/desc"; //购买秀点去广告
NSString * const kH5RemovePageEndUrl       = @"/v3/scene/remove/end/page"; //H5去广告免费购买
NSString * const kEFormRemovePageEndUrl    = @"/v3/lp/remove/end/page"; //表单去广告免费购买
NSString * const kLPRemovePageEndUrl       = @"/v3/app-h5-lp/remove/end/page"; //长页去广告免费购买
NSString * const kPCH5RemovePageEndUrl     = @"/v3/scene/remove/pc/ad"; //h5作品PC预览去广告
NSString * const kPCEFormRemovePageEndUrl  = @"/v3/lp/remove/pc/ad"; //表单作品PC预览去广告
NSString * const KPCLPageRemovePageEndUrl  = @"/v3/app-h5-lp/remove/pc/ad"; //长页作品PC预览去广告
NSString * const kPCVideoRemovePageEndUrl  = @"/v3/video/remove/pc/ad"; //视频作品PC预览去广告


#pragma mark 关于客户
NSString * const kMyCLientListUrl          = @"/v2/customer/data";                   //我的客户数据列表
NSString * const kClientEditUrl            = @"/v2/customer/save";                    //客户修改保存
NSString * const kClientDeleteUrl          = @"/v2/customer/delete";                   //删除客户
NSString * const kClientSenceDataUrl       = @"/v3/scene/formField";                 //作品表单元素
NSString * const kClientImportUrl          = @"/v2/customer/imps/";                      //从作品中导入客户
NSString * const kClientPhoneImportUrl     = @"/v2/customer/batch-save";                   //手机号批量导入
NSString * const kClientSceneDataUrl       = @"/v3/scene/stat/unimport/list"; //统计未导入数据的作品

#pragma mark 我的图片
NSString * const kUserPictureListUrl          =@"/v2/file/userList";       //查询个人图片

#pragma mark 消息推送
NSString * const kMessageTimeUrl            = @"/v2/user/msg/push/time/get";      //获取用户消息推送时间段
NSString * const kSetMessageTimeUrl         = @"/v2/user/msg/push/time/set";      //设置用户消息推送时间段
NSString * const kGetMessageOpenUrl         = @"/v3/scene/push/board/list";       //获取用户开启表单、留言板推送的作品
NSString * const kOpenCloseDataMsgUrl       = @"/v3/scene/form/open";        //开启、关闭作品表单消息推送
NSString * const kOpenCloseBoardMsgUrl      = @"/v3/scene/msg/board/open";       //开启、关闭作品留言板消息推送
NSString * const kUnbundlingTokenUrl        = @"/v2/index/unbind/ios/token";     //解绑token
NSString * const kOpenMsgPushUrl            = @"/v3/scene/sms/open";         //开启短信推送
NSString * const kUploadJPushMsgUrl         = @"/v2/user/msg/jpush/read";            //标记已读推送消息上传给u服务器
NSString * const kGetPushReminderUrl        =  @"/v2/user/msg/push/reminder/get";       //获取push消息提醒通知
NSString * const kPushMsgReminderUrl        =  @"/v2/user/msg/push/reminder/set";       //push消息通知提醒上报

#pragma mark 用户中心
NSString * const kBindingPhoneUrl           = @"/user/bind/phone/code";      //绑定手机
NSString * const kUnRelationUrl             = @"/user/unbind/third";       //解绑
NSString * const kPhoneVerifyUrl            = @"/user/bind/phone";     //手机验证
NSString * const kYQXBindThirdUrl           = @"/user/bind/third";        //移动端 - 易企秀账号绑定第三方账号
NSString * const kResetPasswordUrl          = @"/eqs/pwd/reset";        //重置密码
NSString * const kPhoneResetPwdUrl          = @"/eqs/reset/code";       //手机重置密码发送验证码
NSString * const kcheckPhoneCodeUrl         = @"/eqs/check/phone/code";     //校验手机验证码

#pragma mark 本地预览相关
NSString * const kModelVersionNumUrl        = @"/v3/scene/tpl/new-version";      //获取本地预览模板版本号

#pragma mark 字体

NSString * const kFontByFontFamilyUrl       = @"/v2/font/list/family";           //根据fontFamily 获取字体
NSString * const kPreDownloadFontUrl       = @"/v2/guarantee/data/list";           //六款托底字体
#pragma mark 模板
NSString * const kTemplateListUrl           = @"/v3/scene/page/mlist";               //获取模板页列表模板页接口－返回结果不带elements元素
NSString * const kTemplateTopicListUrl      = @"/v3/scene/page/element/list";            //有模板(原名样例)、专题的作品获取模板页列表
#pragma mark 样例收藏
NSString * const kTemplateFavoriteList      = @"/v2/mall/favorite/list";  //收藏列表
NSString * const kAddTemplateFavorite       = @"/v2/mall/favorite/add";  //添加收藏
NSString * const kDeleteTemplateFavorite    = @"/v2/mall/favorite/delete";  //删除收藏
NSString * const kCheckSceneFavoriteStatus  = @"/v2/mall/favorite/check";   //检查收藏状态
NSString * const kProductListUrl            = @"/v2/user/list/goods";          //获取商品列表
NSString * const kMemberRedemptionCode      = @"/v3/app-pay/goods/exchange";    //会员兑换码兑换
#pragma mark 短信推广
NSString * const  kSurplusMsgUrl             = @"/v2/user/msg/count";                    //获取剩余短信条数
NSString * const  kSendMsgUrl                = @"/m/p/sms/batchSend";                //短信推广
NSString * const  kBuyMsgCountUrl            = @"/v2/user/msg/buy";                      //购买短信条数

#pragma mark 商城相关
NSString * const kGoodsTypeUrl               = @"/v2/mall/category";                        //商品分类
NSString * const kGoodsListUrl               = @"/v3/app-product/list";                      //商品列表
NSString * const kMemberUseProductListUrl    = @"/v2/member/use/product/list";                      //会员消费记录

NSString * const kGoodsStatusUrl             = @"/v2/mall/product/verify";                      //商品购买状态
NSString * const kGoodsSearchUrl             = @"/v3/app-product/search";                          //商品搜索
NSString * const kCompositeSearchUrl         = @"/v3/app-product/composite/search";                          //综合搜索

NSString * const kGoodsPlaceOrderUrl         = @"/pay/order/create";                 //秀点下订单（域名kXDPayHeaderUrl）
NSString * const kGoodsOrderPaymentUrl       = @"/pay/order/payment";                //秀点付款 （域名kXDPayHeaderUrl）
NSString * const kGoodsCallbackUrl           = @"/v3/app-product/callback/verify";          //免费callback验证订单
NSString * const kGoodsCallbackIdsUrl           = @"/v2/mall/callbackIds/verify";          //验证商城多个callbackID 是否成功

NSString * const kGoodsPaidUrl               = @"/v2/user/pro/list";                      //获取用户已购商品
NSString * const kGoodsFreePaidUrl           = @"/m/font/remark/purchased";          //免费字体购买
NSString * const kSceneSpecialUrl            = @"/v2/special/details";         //获取专题下商品列表信息
NSString * const kHotWordsUrl                = @"/v3/app-product/hot/words";//获取热词列表
NSString * const kGoodsDetailUrl             = @"/v2/mall/product/detail";           //根据ID获取商品信息
NSString * const kGoodsNewVerifyUrl          = @"/v2/mall/pay/order/verify";          //新--保存订单【调用商城callback】
NSString * const kGoodsPaidCBVerifyUrl       = @"/v2/pay/callback/verify";             //付费商品callback验证

NSString * const kGoodsFreeDealUrl           = @"/v3/app-product/deal";            //免费或已购商品使用接口-2.9.7版本之后
NSString * const kPopBoxProductIdsUrl           = @"/v2/mall/productIds/deal";            //推荐页弹窗领1-多个取样例接口

NSString * const kGoodsChannelCategoryUrl    = @"/v3/app-category/list";         //根据前端分类ID获取子分类列表(4.6.0后
NSString * const kCategoryDetialListUrl      = @"/v3/app-category/children";        //根据id获取直接关联的下级分类以及子分类
NSString * const kSpecialPageDetailsUrl      = @"/v2/special/page/details";             //分页获取专题下商品列表
NSString * const kObtainUserRightsUrl        = @"/v2/benefit/coupon/list";        //获取用户权益列表
NSString * const kReceiveEquityCouponUrl     = @"/v2/benefit/coupon/receive";        //领取权益优惠券
NSString * const kMallCategoryAttUrl         = @"/v3/app-category/attrs/list";           //根据分类id获取属性、属性值（分类列表页面使用）
NSString * const kProductImgSearchUrl        = @"/v3/app-product/img/search";       //商品形似列表-根据图片找相似

#pragma mark 大数据相关
NSString * const kDataTodayPVUrl             = @"/v3/statistic/scene/view/today/data";    //
NSString * const kDataTotalPVUrl             = @"/api/eqx/scene/total/puv/";    //
NSString * const kNewDataTotalPVUrl          = @"/v3/statistic/scene/view/total/data";
NSString * const kSceneViewAllDayDataUrl     = @"/v3/statistic/scene/view/all/day/data";
NSString * const kDataQrctotalPVUrl          = @"/api/eqx/scene/total/qrctotal/";//
NSString * const kDataHourListUrl            = @"/api/eqx/scene/sceneHourLists/";
NSString * const kDataSceneMonth             = @"/api/eqx/scene/sceneMonth/";
NSString * const kNewDataSceneMonth          = @"/v3/statistic/scene/view/month/data";
NSString * const kNewDataSceneTime           = @"/v3/statistic/scene/view/time/out/data";//访问时长和退出率统计
NSString * const kDataSceneListUrl           = @"/api/eqx/scene/sceneLists/";
NSString * const kNewDataHourListUrl         = @"/v3/statistic/scene/view/hour/data";
NSString * const kNewDataSceneListUrl        = @"/v3/statistic/scene/view/day/data";
NSString * const kDataQrchoursUrl            = @"/api/eqx/scene/total/qrchours/";
NSString * const kDataShareTypeUrl           = @"/api/eqx/scene/total/sharetype/";
NSString * const kDataShareToUrl             = @"/v3/statistic/scene/weixin/share/to/data";
NSString * const kDataShareFromUrl           = @"/v3/statistic/scene/weixin/view/from/data";
NSString * const kDataRegionUrl              = @"/api/eqx/scene/total/region/";
NSString * const kNewDataRegionUrl           = @"/v3/statistic/scene/province/data";
NSString * const kDataDeviceUrl              = @"/api/eqx/scene/total/device/";
NSString * const kNewDataDeviceUrl           = @"/v3/statistic/scene/brand/data";
NSString * const kDataPlatformUrl            = @"/api/eqx/scene/total/platform/";
NSString * const kNewDataPlatformUrl         = @"/v3/statistic/scene/device/data";
NSString * const kChannelTemplateRecommdUrl  = @"/v3/app-product/channel/recommend";        //大数据商品推荐-不分页

#pragma mark 优惠券
NSString * const kCouponListUrl              = @"/v2/user/coupon/list";             //用户优惠券列表
NSString * const kVerifyCouponUrl            = @"/v2/user/coupon/verify/available";             //支付确认-查询优惠券列表，过滤掉不可用优惠券
#pragma mark 频道
NSString * const kChannelListUrl             = @"/v2/mall/channel/list";         //获取频道列表
NSString * const kChannelProductUrl          = @"/v2/mall/channel/products/new";        //获取频道下商品

#pragma mark 秀客小店
NSString * const kShowerShopUrl              = @"/mobile";         //秀客小店
NSString * const kBoolShowker                = @"/v2/index/bool/showker";        //秀客账号-判断是否editor 账号
NSString * const kShowkerInfoUrl             = @"/v2/index/info/showker";       //秀客信息


#pragma mark 营销日历
NSString * const kMarketingCalendarUrl       = @"/marketing-home-wap.html";        //营销日历

#pragma mark 猜你喜欢
NSString * const kGuessYouLikeUrl            = @"/v2/user/products/you-like/new";       //猜你喜欢

#pragma mark 红包
NSString *const kgetRedBagParameter           = @"/v2/index/share-doc";        //红包参数
NSString *const kgetRedBagSwitch              = @"/v2/index/red/packet/switch"; //获取分享红包开关
#pragma mark 新手礼包
NSString *const kNewUserGiftBag               = @"/v2/index/gift/des";          //新手礼包

#pragma mark 审核相关
NSString * const kAuditSignatreUrl            = @"/v2/pay/urgent/audit/xd";            //获取加急审核付费秀点数
NSString * const kAuditPayInfoUrl             = @"/v3/app-xd-consume/signature";            //获取支付签名

NSString * const kAuditSceneListUrl           = @"/v3/scene/list";                      //未审核、审核中、审核未通过作品

#pragma mark  小会员相关
NSString * const kMemberSignatureUrl          = @"/v2/member/signature";            //会员签名&创建业务订单
NSString * const kMemberCreateOrderUrl        = @"/pay/third/order/promotion";         //创建订单接口
NSString * const kMemberBuyProductUrl         = @"/v2/member/product/deal";          //会员购买“会员免费”商品
NSString * const kMemberBuyCallBackUrl        = @"/v2/member/callback/verify";      //会员购买“会员免费”商品回调验证
NSString * const kMemberGiveStatisticUrl      = @"/v2/member/give/statistic";           //赠送会员统计
NSString * const kMemberCancelInfoUrl         = @"/v2/renewal/goods/list";          //获取续费商品信息
NSString * const kMemberCancelGoodsUrl        = @"/v2/renewal/goods/cancel";        //取消自动续费订阅
NSString * const kAutomaticCompletionUrl      = @"/v3/app-product/auto/complete";//搜索自动补全接口

NSString * const kGetCollectionUrl            = @"/v2/mall/productCollect";//获取作品集ID

#pragma mark 会员
NSString * const kCreativePaySignatureUrl      = @"/v3/app-pay/signature";              //会员获取签名
NSString * const kCreativePayCheckUrl          = @"/v3/app-pay/ios/check";          //会员校验
NSString * const kVerifyFailedReceipt          = @"/v3/app-pay/ios/multi/commodity/check"; //补偿
NSString * const kRenwalMemberCheckUrl         = @"/v3/app-pay/renewal/ios/check";          //会员自动续费校验
#pragma mark 用户积分等级相关

NSString * const kGetUserLevel                 = @"/v2/user/score/level/info";//获取用户积分、等级信息
NSString * const KGetScoreTaskUrl              = @"/m/integral/getTask";    //获取积分任务

#pragma mark 海报
NSString * const kLightDesignAddScore                 = @"/v3/print/down_add_score";//海报下载作品加积分
NSString * const kDownloadAppAddScore                 = @"/v2/user/score/add_for_install";//app下载加积分
NSString * const kOpenPushSwitchAddScore              = @"/v2/user/score/add_for_open_push";//开启推送加积分
NSString * const kBrowsingPageAddScore                = @"/v2/user/score/add";//浏览页面加积分
//获取全部等级列表

#pragma mark 运营活动
NSString * const kActivityListUrl             = @"/v2/activity/list";   //活动列表
NSString * const kActivitySubscribeUrl        = @"/v2/activity/subscribe"; //订阅活动

#pragma mark 日签
NSString * const kDaySignInUrl                   = @"/v3/user/sign/add";            //签到
NSString * const kDaySignStateUrl                = @"/v3/user/sign/check";            //检查签到状态
NSString * const kDaySignListUrl                 = @"/v3/user/sign/list";            //签到列表
NSString * const kDaySignTemplateUrl             = @"/v3/user/sign/product";            //日签模板
NSString * const kCheckInReceiveTempleUrl        = @"/v3/app-product/deal/with/sign";            //领取模板
NSString * const kDaySignReminderSetUrl          = @"/v3/user/sign/reminder";             //设置日签提醒
NSString * const kDaySignCheckStateUrl           = @"/v3/user/sign/reminder/check";             //检查用户签到状态
NSString * const kOneClickPickUpUrl              = @"/v3/app-product/productIds/deal/with/sign";             //日签一键领取

#pragma mark 第三方音乐相关
NSString * const kTXMusicCategoryUrl             = @"/api/v3/category/list";          //获取腾讯音乐的分类
NSString * const kTXMusicListUrl                 = @"/api/v3/song/list";         //获取腾讯音乐列表
NSString * const kTXMusicPlayPathUrl             = @"/api/v3/song/play/url";     //获取腾讯音乐播放地址
NSString * const kTXMusicReportListenUrl         = @"/v3/app-music/report/listen";      //腾讯音乐上报，听歌数据
NSString * const kTXMusicReportOperateUrl        = @"/v3/app-music/report/operate";      //腾讯音乐上报，用户行为

NSString * const kTXMusicZipReportUrl            = @"/api/v3/report/zip/data";
NSString * const kTXMusicUncompressReportUrl     = @"/api/v3/report/data";          //腾讯音乐上报（无压缩数据）

#pragma mark 新用户相关
NSString * const kUserTagListUrl                 = @"/user/activation/tag_list";        //获取标签列表
NSString * const kUploadOccupationUrl            = @"/user/activation/job_tag";         //上传新用户岗位信息
NSString * const kUploadUsageAUrl                = @"/user/activation/use_tag";          //上传新用户用途信息
NSString * const kUploadIndustryAUrl             = @"/user/activation/trade_tag";          //上传新用户行业信息
NSString * const kUploadInformationUrl           = @"/user/activation/user_info";           //上传用户其他补充信息
NSString * const kShowkerOrderListUrl            = @"/v2/user/share/order/list";            //秀客分成记录

#pragma mark 无水印
NSString * const kWaterMarkDownloadRemainingsUrl             = @"/v3/print/down/free/times";          //海报-今日剩余免费下载次数
NSString * const kWaterMarkDownloadDeductionsUrl            = @"/v3/print/down/times/reduce";          //海报-下载次数扣减
NSString * const kGetWaterMarkImageUrl                      = @"/v3/print/cover/pure/get" ;             //无水印图片获取
NSString * const kSetWaterMarkImageUrl                      = @"/v3/print/cover/pure/set" ;             //无水印图片设置
NSString * const kGetWaterMarkImageUploadUrl                = @"/v3/print/cover/upload" ;             //无水印图片上传七牛
NSString * const kGetPrintCoverIsMark                       =@"/v3/print/cover/is-mark";//作品封面是否有水印


#pragma mark 中台广告位
NSString * const kIomAdvertAdMapUrl                     = @"/iom/advert/find-admap-bymediaids";     //中台广告位（map返回数据）
NSString * const kIomAdvertAdListUrl                    = @"/iom/advert/find-adlist-bymediaids-forapp";      //中台广告位（list返回数据）


#pragma mark 用户社区
NSString * const kCommunityCategoryListUrl           = @"/api/ecology/v3.3/channel/list";       //用户社区频道列表
NSString * const kCommunityDetialUrl                 = @"/api/ecology/v3.3/channel/elements";       //用户社区某一频道详细内容

#pragma mark wap商城
NSString * const kWapMallPreviewUrl                  = @"/wpmall/detail/";  //wap商城模板预览链接


NSString * const kH5LimitPageNumberUrl               = @"/v3/scene/avail/count";


#pragma mark 自定义加载logo
NSString * const kSetSceneLoadingLogoUrl             = @"/v3/scene/set/loading/logo";       //作品设置自定义logo


#pragma mark 去广告权益详情
NSString * const kRemoveAdDetailUrl                   = @"/v3/works/ad/benefit/info";       //去广告权益详情

#pragma mark 去广告流量包开启
NSString * const kOpenRemoveAdUrl                     = @"/v3/works/ad/open";       //开启去广告权益

#pragma mark 去广告流量包关闭
NSString * const kCloseRemoveAdUrl                     = @"/v3/works/ad/close";       //关闭去广告权益

#pragma mark 盲盒
NSString * const kPrizesListUrl                     = @"/api/base/a/r/list";       //奖品列表
NSString * const kActivityDetailsUrl                = @"/api/base/a/r/detail";       //活动详情
NSString * const kRewardUrl                         = @"/api/base/a/r/grant";       //下发奖励
NSString * const kGetPrizeRecordUrl                 = @"/api/base/a/r/my";       //获取的奖品记录

#pragma mark 素材管理-图片
NSString * const kCheckIfIsFavoriteUrl              = @"/v2/mall/favorite/check"; //检查图片是否收藏
NSString * const kPhotoAddFavoriteUrl               = @"/v2/mall/favorite/add"; //图片添加收藏
NSString * const kPhotoCancelFavoriteUrl            = @"/v2/mall/favorite/delete"; //图片取消收藏
NSString * const kMaterialImageGroupListUrl         = @"/v2/user/file/tag/list"; //通过类型获取文件夹列表
NSString * const kMaterialImageGroupDelete          = @"/v2/user/file/tag/delete"; //删除文件夹(tag标签)
NSString * const kMaterialImageGroupRename          = @"/v2/user/file/tag/update"; //更新文件夹名称(tag标签)
NSString * const kMaterialImageGroupCreate          = @"/v2/user/file/tag/create"; //新建文件(tag标签)
NSString * const kMaterialImageDelete             = @"/v2/user/file/delete"; //批量删除全部文件夹图片
NSString * const kMaterialImageRemove             = @"/v2/user/file/remove"; //批量删除自定义文件夹图片

NSString * const kMaterialImageMove             = @"/v2/user/file/move"; //批量移动图片
NSString * const kSceneVisitLimit             = @"/v3/scene/set/access"; //作品设置访问限制
#pragma mark 在线音乐裁剪
NSString * const kOnLineMusicCutUrl                 = @"/v2/user/file/crop";        //音频裁切
NSString * const kMusicCutStatusSearchUrl           = @"/v2/user/file/task/status";         //裁剪任务状态查询

#pragma mark 短信内容校验
NSString * const kMessageCheckUrl                   = @"/v2/user/sms/check";        //短信内容审核&计算
NSString * const kSaveMessageSetUrl                 = @"/v2/user/sms/notice/save";      //群发短信-保存设置
NSString * const kCancelSendMessageUrl              = @"/v2/user/sms/notice/cancel";        //群发短信-取消发送
NSString * const kMessageSetListUrl                 = @"/v2/user/sms/notice/page/list";          //群发短信-设置&list列表
NSString * const kMessageReceiverListUrl            = @"/v2/user/sms/receiver/page/list";       //群发短信-接收人列表(分页)

#pragma mark 首页行业设置相关
NSString * const kGetRecommendKeywordUrl             = @"/v3/app-product/recommend/tag";        //查询推荐行业
NSString * const kSetRecommendKeywordUrl             = @"/v3/app-product/recommend/tag/set";        //设置推荐行业
NSString * const kGetHomeModelListUrl                = @"/v3/module/recommend/list";   //首页模块列表-推荐页(包含行业推荐)
NSString * const kGetIndustryListUrl                 = @"/v3/app-product/recommend/tag/list";   //推荐行业标签列表


#pragma mark 红包
NSString * const kCreateRedOrderUrl                 = @"/m/recharge/order/create";    //红包下单，xiupay
NSString * const kGetRedPayInfoUrl                  = @"/m/recharge/pay/qrcode/create";       //【充值】获取红包支付信息
NSString * const kSetH5RedPacketUrl                 = @"/v3/scene/redpack/save";        //H5设置红包
NSString * const kGetH5RedPacketDeitalUrl           = @"/v3/scene/redpack/config";      //获取红包配置信息
NSString * const kGetH5RedPacketSummaryUrl          = @"/v3/scene/redpack/data/summary";        //红包领取概况
NSString * const kGetH5RedPacketDataListUrl         = @"/v3/scene/redpack/data/list";           //红包领取详情
NSString * const kDeleteH5RedPacketElementUrl       = @"/v3/scene/redpack/delete";      //删除红包组件，终止活动


NSString * const kUserMemberRightsList      = @"/v2/user/member/benefit/category/list";       // 用户会员权益列表

NSString * const kVoucherList      = @"/v2/user/exchange/list";       // 兑换券列表

NSString * const kVoucherReceive   = @"/v2/user/exchange/receive";    // 兑换券领取

NSString * const kVoucherGet   = @"/v2/user/exchange/exec";    // 兑换券领取

NSString * const kMemberPendingPaymentOrderConversion   = @"/orders/pop";    //会员待支付订单转化接口

NSString * const kGetPayMentInfo   = @"/v2/user/goods/get";    //获取支付商品信息


