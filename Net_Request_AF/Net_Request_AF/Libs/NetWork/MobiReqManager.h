//
//  MobiReqManager.h
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReqApiTagList.h"

@class MBProgressHUD;


typedef void(^HttpReqSuccess)(id result, MBProgressHUD *hud, ReqApiTag tag);
typedef void(^HttpReqfailure)(id error, MBProgressHUD *hud, ReqApiTag tag);

@protocol  HttpRequsetDelegate <NSObject>
- (void)httpRequestStart:(ReqApiTag)tag hud:(MBProgressHUD *)hud;
- (void)httpRequestCompleted:(ReqApiTag)tag data:(id)data message:(NSString *)message hud:(MBProgressHUD *)hud;
- (void)httpRequestError:(ReqApiTag)tag message:(NSString *)message hud:(MBProgressHUD *)hud;

@end


/**
 *  封装的网络请求管理类库
 */
@interface MobiReqManager : NSObject


/**
 请求接口成功回调
 */
@property (copy, nonatomic) HttpReqSuccess m_manager_success;

/**
 请求接口失败回调
 */
@property (copy, nonatomic) HttpReqfailure m_manager_failure;


/**
 网络请求单例实例化
 
 @return MobiReqManager
 */
+(MobiReqManager *)sharedInstance;

/**
 get请求（没有任何参数的 get 请求
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 */
-(void)get_Normal_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text delegate:(id<HttpRequsetDelegate>)delegate;

/**
 get请求（带有参数的 get 请求 < ?key=value&key=value >）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param parameter URL拼接参数
 */
-(void)get_Key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter delegate:(id<HttpRequsetDelegate>)delegate;

/**
 get请求（带有参数的 get 请求  /:key<value>  ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param parameter 拼接参数
 */
-(void)get_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter delegate:(id<HttpRequsetDelegate>)delegate;

/**
 get请求（带有参数的 get 请求  /:key<value> ?key=value&key=value ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param value 拼接参数(:key<value>)
 @param keyValue 拼接参数(?key=value&key=value)
 */
-(void)get_all_type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue delegate:(id<HttpRequsetDelegate>)delegate;

/**
 post请求（没有任何拼接参数的post请求）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 */
-(void)post_Normal_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate;

/**
 post请求（带有拼接参数的post请求<?key=value&key=value>）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 */
-(void)post_key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate;

/**
 post请求（带有拼接参数的post请求 /:key<value>/:key<value> ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 */
-(void)post_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate;

/**
 post请求（带有参数的 post 请求  /:key<value> ?key=value&key=value ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param value 拼接参数(:key<value>)
 @param keyValue 拼接参数(?key=value&key=value)
 @param body 请求参数
 */
-(void)post_all_type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate;

/**
 put请求（默认的put请求）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 */
-(void)put_normal_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate;

/**
 put请求（带有拼接参数的put请求<?key=value&key=value>）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 */
-(void)put_key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate;

/**
 put请求（带有拼接参数的put请求 /:key<value>/:key<value> ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 */
-(void)put_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate;

/**
 put请求（带有参数的 put 请求  /:key<value> ?key=value&key=value ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param value 拼接参数(:key<value>)
 @param keyValue 拼接参数(?key=value&key=value)
 */
-(void)put_All_Type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue delegate:(id<HttpRequsetDelegate>)delegate;



/**
 del请求（带有拼接参数的del请求<?key=value&key=value>）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body post请求参数
 @param parameters URL拼接参数
 */
-(void)del_key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate;

/**
 del请求（带有拼接参数的del请求 /:key<value>/:key<value> ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param body del请求参数
 @param parameters URL拼接参数
 */
-(void)del_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate;

/**
 dele请求（带有参数的 dele 请求  /:key<value> ?key=value&key=value ）
 
 @param tag 接口类型_API
 @param view 当前view
 @param text HUD提示框信息（默认：数据加载中请稍后...）
 @param value 拼接参数(:key<value>)
 @param keyValue 拼接参数(?key=value&key=value)
 @param body 请求参数
 */
-(void)dele_all_type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate;


- (void)requestSuccessDelegate:(ReqApiTag)tag result:(id)result hud:(MBProgressHUD *)hud code:(NSInteger)code erMsg:(NSString *)erMsg;
- (void)requestFailureDelegate:(ReqApiTag)tag error:(id)error hud:(MBProgressHUD *)hud;

@end

