//
//  MbyHttpManager.h
//  LRoverObject
//
//  Created by lms on 2017/11/7.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "ApiHostManager.h"
#import "ReqApiTagList.h"
#import <MBProgressHUD.h>

typedef void(^HttpReqMangerSuccess)(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg);
typedef void(^HttpReqMangerFailure)(NSError* error, MBProgressHUD *hud);

@interface MbyHttpManager : NSObject

@property (strong, nonatomic) MBProgressHUD *HUD;
@property (strong, nonatomic) AFHTTPSessionManager *m_manager;
@property (strong, nonatomic) AFHTTPSessionManager *m_HZmanager;
@property (strong, nonatomic) AFHTTPSessionManager *m_PILEmanager;

+ (void)reach;
+ (instancetype)sharedHttpManager;

/**获取网络请求方法
 * url   接口方法
 * method       请求方法 get/post/put/delete
 * parameters   参数对象
 * hud   弹框提示
 **/

- (void)request:(NSString *)url
         method:(HttpRequestMethod)method
     requestTag:(ReqApiTag)tag
     parameters:(id)parameters
            hud:(MBProgressHUD *)hud
        success:(HttpReqMangerSuccess)success
         failed:(HttpReqMangerFailure)failure;


@end

