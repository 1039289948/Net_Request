//
//  ApiHostManager.h
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#ifndef ApiHostManager_h
#define ApiHostManager_h

// 网络请求方法
typedef enum {
    HttpRequestMethodPOST,  // 
    HttpRequestMethodGET,   //
    HttpRequestMethodPUT,   //
    HttpRequestMethodDELETE, // 删
    HttpRequestMethodSaveImage, // 保存图片
} HttpRequestMethod;

// 网络请求方法
typedef enum {
    ReqMsgType_GetMsg,   //获取消息
    ReqMsgType_SendMsg   // 发送消息
} ReqMsgType;


#if DEBUG
    #define JAVA_API_HOST @"http://api-csapp-web-dev.themobiyun.com/cs2Api/app" //测试环境
#else
    #define JAVA_API_HOST @"https://customer-api.chehezhi.cn/hznz/" //正式环境
#endif

#define customer_url @"customer/" //测试客户信息
#define vehiclecontrolservice_url @"vehiclecontrolservice/" //测试远程控车
#define vehicledataservice_url @"vehicledataservice/" //测试车辆信息查询

/**
 版本更新检测
 */
#define DOWN_VERSION_JSON @"https://web.themobiyun.com/downloads/notify/app_version.json"


#endif /* ApiHostManager_h */
