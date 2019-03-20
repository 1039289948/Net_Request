//
//  ReqApiTagList.h
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking.h>

typedef NS_ENUM(NSInteger, ReqStatusType) {
    ReqStatusTypeSuccess,
    ReqStatusTypeFailed,
    /**
     * 登录过期
     */
    ReqStatusTypeExceed,
    ReqStatusTypeTimeOut
};

typedef NS_ENUM(NSInteger, ReqApiTag) {
    /**获取App Store信息*/
    ReqApiTagGetAppStoreInfo,
    /**获取App Store信息*/
    ReqApiTagGetAppStore,
    /**获取收藏的经销商*/
    MobiReqApiTag_get_collection_dealer,
};



typedef NS_ENUM(NSInteger, URL_TYPE) {
    
    /**
     *  网络请求URL不带任何参数
     */
    URL_TYPE_NORMAL,
    /**
     *  网络请求带拼接参数普通（?key=value&key=value）
     */
    URL_TYPE_PARAMETER_NORMAL,
    /**
     *  网络请求带拼接参数（/:key<value>）
     */
    URL_TYPE_PARAMETER_CODE,
    
};


/**
 *  设置网络请求URL类库
 */
@interface ReqApiTagList : NSObject


/**
 拼接网络请求URL
 
 @param tag 接口类型_API
 @param typeDic 拼接参数
 @param urlType URL拼接方式
 */
+(NSString *)createRequestUrl_Tag:(ReqApiTag)tag typeDic:(NSDictionary *)typeDic urlType:(URL_TYPE)urlType;

/**
 拼接网络请求URL
 
 @param tag 接口类型_API
 */

+(NSString *)createRequestUrl_Tag:(ReqApiTag)tag value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue;



@end

