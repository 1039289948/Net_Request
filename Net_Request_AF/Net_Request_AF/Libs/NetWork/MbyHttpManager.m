//
//  MbyHttpManager.m
//  LRoverObject
//
//  Created by lms on 2017/11/7.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MbyHttpManager.h"
#import "AppDelegate.h"
#import "Category.h"
#import <CoreFoundation/CoreFoundation.h>
#import "MobiReqManager.h"

static MbyHttpManager *sharedInstance = nil;

@interface MbyHttpManager ()
@property (strong, nonatomic) NSMutableDictionary *m_task_map;

/**
 请求接口成功回调
 */
@property (copy, nonatomic) HttpReqMangerSuccess m_manager_success;

/**
 请求接口失败回调
 */
@property (copy, nonatomic) HttpReqMangerFailure m_manager_failure;


@property (assign, nonatomic) ReqStatusType m_req_status;
@property (assign, nonatomic) NSInteger m_req_count;
@property (strong, nonatomic) NSOperationQueue *m_queues;


@end

@implementation MbyHttpManager


+ (instancetype)sharedHttpManager{
    static dispatch_once_t _once;
    dispatch_once(&_once, ^{ sharedInstance = [[MbyHttpManager alloc] init]; });
    return sharedInstance;
}

#pragma mark - 检测网络连接
+ (void)reach{
    //AFNetworkReachabilityStatusUnknown = -1 未知, NotReachable = 0 无连接, ReachableViaWWAN = 1 4G, ReachableViaWiFi = 2 wifi
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];//检测管理器的单例
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {

    }];
}

- (id)init {
    if (self = [super init]) {
        self->_m_task_map = [NSMutableDictionary new];
        self->_m_req_count = 0;
        self->_m_queues = [[NSOperationQueue alloc] init];
        self->_m_queues.maxConcurrentOperationCount = 1;

    }
    return self;
}

-(AFHTTPSessionManager *)m_manager{
    
    _m_manager = [AFHTTPSessionManager manager];//超时默认60秒
    _m_manager.requestSerializer = [AFJSONRequestSerializer serializer];//发送json
    _m_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _m_manager.requestSerializer.timeoutInterval = 30.0;
    _m_manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                            @"text/json", @"text/javascript",
                                                            @"text/html", @"text/plain",
                                                            @"image/jpeg", @"image/png",
                                                            @"application/octet-stream", nil];
    _m_manager.securityPolicy.allowInvalidCertificates = YES;
    [_m_manager.securityPolicy setValidatesDomainName:NO];
    

    return _m_manager;
}

- (void)request:(NSString *)url
         method:(HttpRequestMethod)method
     requestTag:(ReqApiTag)tag
     parameters:(id)parameters
            hud:(MBProgressHUD *)hud
        success:(HttpReqMangerSuccess)success
         failed:(HttpReqMangerFailure)failure{
    self->_m_manager_success = success;
    self->_m_manager_failure = failure;
//    NLog(@"打印URL:{\n%@\n}\n",url);
//    NLog(@"请求参数:{\n%@\n}\n",parameters);
    if (self.m_req_status == ReqStatusTypeExceed) {
        self.m_req_count ++;
    }
    if (method == HttpRequestMethodGET){
//        [self refreshTokenOperationCompelete:^(BOOL isfinsh) {
//            NSLog(@"网络请求开始");
//            if (isfinsh) {
//
//            }else{
//
//            }
//        }];
        NSURLSessionDataTask *task = [[self m_manager] GET:url
                                                parameters:parameters progress:nil
                                                   success:^(NSURLSessionDataTask *task, id responseObject){
                                                       NSError *error = nil;
                                                       NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
                                                       [self login_required_msg:responseObject sessionDataTask:task requsetTag:tag];
                                                       //                               NLog(@"请求数据：%@",dic);
                                                       if (!error) {
                                                           id data = dic[@"data"];
                                                           if (data == nil || [data isEqual:[NSNull null]]) {
                                                               data = @"";
                                                           }
                                                           success(data, hud, [NSString ex_integerWithId:dic[@"code"]],[NSString ex_stringWithId:dic[@"message"]]);
                                                       }else{
                                                           NSLog(@"JSON数据解析错误");
                                                           failure(error, hud);
                                                       }
                                                   }
                                                   failure:^(NSURLSessionDataTask *task, NSError *error){
                                                       failure(error, hud);
                                                       NLog(@"网络请求错误信息%@",error);
                                                   }];
        [task resume];
    }
    if (method == HttpRequestMethodPOST) {
        NSURLSessionDataTask *task = [[self m_manager] POST:url
                                                 parameters:parameters
                                                   progress:nil
                                                    success:^(NSURLSessionDataTask *task, id responseObject){
                                                        NSError *error = nil;
                                                        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
                                                        //                           NLog(@"请求数据：%@",dic);
                                                        if (!error) {
                                                            id data = dic[@"data"];
                                                            if (data == nil || [data isEqual:[NSNull null]]) {
                                                                data = @"";
                                                            }
                                                            success(data, hud, [NSString ex_integerWithId:dic[@"code"]],[NSString ex_stringWithId:dic[@"message"]]);
                                                        }else{
                                                            NSLog(@"JSON数据解析错误");
                                                            failure(error, hud);
                                                        }
                                                    }
                                                    failure:^(NSURLSessionDataTask *task, NSError *error){
                                                        failure(error, hud);
                                                        NLog(@"网络请求错误信息%@",error);
                                                    }];
        [task resume];
    }
    if (method == HttpRequestMethodPUT) {
        NSURLSessionDataTask *task = [[self m_manager] PUT:url
                                                parameters:parameters
                                                   success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                       NSError *error = nil;
                                                       NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
                                                       if (!error) {
                                                           id data = dic[@"data"];
                                                           if (data == nil || [data isEqual:[NSNull null]]) {
                                                               data = @"";
                                                           }
                                                           success(data, hud, [NSString ex_integerWithId:dic[@"code"]],[NSString ex_stringWithId:dic[@"message"]]);
                                                       }else{
                                                           NSLog(@"JSON数据解析错误");
                                                           failure(error, hud);
                                                       }
                                                   } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                       failure(error, hud);
                                                       NLog(@"网络请求错误信息%@",error);
                                                   }];
        [task resume];
    }
    
    if (method == HttpRequestMethodDELETE) {
        NSURLSessionDataTask *task = [[self m_manager] DELETE:url
                                                   parameters:parameters
                                                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                                          NSError *error = nil;
                                                          NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
                                                          if (!error) {
                                                              id data = dic[@"data"];
                                                              if (data == nil || [data isEqual:[NSNull null]]) {
                                                                  data = @"";
                                                              }
                                                              success(data, hud, [NSString ex_integerWithId:dic[@"code"]],[NSString ex_stringWithId:dic[@"message"]]);
                                                          }else{
                                                              NSLog(@"JSON数据解析错误");
                                                              failure(error, hud);
                                                          }
                                                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                                          failure(error, hud);
                                                          NLog(@"网络请求错误信息%@",error);
                                                      }];
        [task resume];
    }
    if (method == HttpRequestMethodSaveImage) {
        NSURLSessionDataTask *task = [[self m_manager] POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
            
            NSData *file = parameters[@"file"];
            NSString *fileName = parameters[@"fileName"];
            [formData appendPartWithFileData:file
                                        name:@"file"
                                    fileName:fileName
                                    mimeType:@"image/jpeg"];
        } progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSError *error = nil;
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
            if (!error) {
                id data = dic[@"data"];
                if (data == nil || [data isEqual:[NSNull null]]) {
                    data = @"";
                }
                success(data, hud, [NSString ex_integerWithId:dic[@"code"]],[NSString ex_stringWithId:dic[@"message"]]);
            }else{
                NSLog(@"JSON数据解析错误");
                failure(error, hud);
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error, hud);
            NLog(@"网络请求错误信息%@",error);
        }];
        [task resume];
    }
    
}

- (void)login_required_msg:(id)responseObject sessionDataTask:(NSURLSessionDataTask *)task requsetTag:(ReqApiTag)tag{
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
    if (!error) {
        NSLog(@"%@",dic);
        NSInteger code = [NSString ex_integerWithId:dic[@"code"]];
        if (code == 401) {
            NSLog(@"登录过期，重新登录");
            self.m_req_status = ReqStatusTypeExceed;
            [self.m_task_map setObject:task forKey:@(tag)];
            NSLog(@"%zi",self.m_task_map.allKeys.count);
        }
    }else{
   
        
    }
  
}

- (void)requsetAgain:(NSURLSessionDataTask *)task requsetTag:(ReqApiTag)tag code:(NSInteger)code{
   
    NSURLSession * session = [NSURLSession sharedSession];
    NSMutableURLRequest *req = [task.originalRequest mutableCopy];
    [req setValue:@"" forHTTPHeaderField:@"Authorization"];
    
    NSURLSessionDataTask *run_task =  [session dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
    }];
    [run_task resume];
}

#pragma mark 更新token操作
- (void)refreshTokenOperationCompelete:(void(^)(BOOL isfinsh))compelete{
    
    if (self.m_req_status == ReqStatusTypeExceed) {
        compelete(false);
    }else{
        NSLog(@"开始执行更新token");
        [[self m_manager] GET:@"http://api-csapp-web-dev.themobiyun.com/cs2Api/app/cities"
                   parameters:nil progress:nil
                      success:^(NSURLSessionDataTask *task, id responseObject){
                          NSError *error = nil;
                          NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
                          NSLog(@"更新token");
                          compelete(true);
                          if (!error) {
                              id data = dic[@"data"];
                              if (data == nil || [data isEqual:[NSNull null]]) {
                                  data = @"";
                              }
                          }else{
                              NSLog(@"JSON数据解析错误");
                          }
                      }
                      failure:^(NSURLSessionDataTask *task, NSError *error){
                          NLog(@"网络请求错误信息%@",error);
                      }];
    }
}




@end

