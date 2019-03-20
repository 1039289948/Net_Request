//
//  MobiReqManager.m
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "MobiReqManager.h"
#import "Category.h"
#import "MbyHttpManager.h"
#import "ApiHostManager.h"

#define ERROR_MESSAGE @"网络连接失败！请检查网络设置"


@interface MobiReqManager ()

@property (strong, nonatomic) UIWindow *windows;
@property (weak, nonatomic) MBProgressHUD *HUD;
@property(nonatomic, weak) id<HttpRequsetDelegate> delegate;


@end

@implementation MobiReqManager


+(MobiReqManager *)sharedInstance{
    
    static MobiReqManager *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MobiReqManager alloc] init];
    });
    
    return sharedInstance;
}

-(instancetype)init{
    
    if (self = [super init]) {
        
    }
    return self;
}
- (UIWindow *)windows{
    
    if (_windows == nil) {
        UIApplication *app = [UIApplication sharedApplication];
        if ([app.delegate respondsToSelector:@selector(window)]){
            _windows = [app.delegate window];
        }else{
            _windows = [app keyWindow];
        }
    }
    return _windows;
}

- (void)setM_manager_success:(HttpReqSuccess)m_manager_success{
    self->_m_manager_success = m_manager_success;
}
- (void)setM_manager_failure:(HttpReqfailure)m_manager_failure{
    self->_m_manager_failure = m_manager_failure;
}



-(void)get_Normal_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:nil urlType:URL_TYPE_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodGET
                                     requestTag:tag
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}

- (void)get_Normal_RequestApi:(ReqApiTag)tag requestUrl:(NSString *)url thisView:(UIView *)view waitText:(NSString *)text delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:url
                                         method:HttpRequestMethodGET
                                     requestTag:tag
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
}
 



-(void)get_Key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameter urlType:URL_TYPE_PARAMETER_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodGET
                                     requestTag:tag
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}

-(void)get_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text parameter:(NSDictionary *)parameter delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameter urlType:URL_TYPE_PARAMETER_CODE];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodGET
                                     requestTag:tag
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}

- (void)get_all_type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag value:value keyValue:keyValue];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodGET
                                     requestTag:tag
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}


-(void)post_Normal_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:nil urlType:URL_TYPE_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
    
}

-(void)post_key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
}

-(void)post_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_CODE];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
}

- (void)post_all_type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag value:value keyValue:keyValue];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPOST
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
}


- (void)put_normal_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:nil urlType:URL_TYPE_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPUT
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}

- (void)put_key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPUT
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}


- (void)put_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_CODE];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPUT
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}


- (void)put_All_Type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag value:value keyValue:keyValue];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodPUT
                                     requestTag:tag
                                     parameters:nil
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}


- (void)del_key_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_NORMAL];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodDELETE
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}

- (void)del_Value_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text body:(NSDictionary *)body parameters:(NSDictionary *)parameters delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag typeDic:parameters urlType:URL_TYPE_PARAMETER_CODE];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodDELETE
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}

- (void)dele_all_type_RequestApi:(ReqApiTag)tag thisView:(UIView *)view waitText:(NSString *)text value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue body:(NSDictionary *)body delegate:(id<HttpRequsetDelegate>)delegate{
    
    self.delegate = delegate;
    self.HUD = [MBProgressExpand ex_loading:text toView:view];
    NSString *URL = [ReqApiTagList createRequestUrl_Tag:tag value:value keyValue:keyValue];
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestStart:hud:)]) {
        [self.delegate httpRequestStart:tag hud:self.HUD];
    }
    WS
    [[MbyHttpManager sharedHttpManager] request:URL
                                         method:HttpRequestMethodDELETE
                                     requestTag:tag
                                     parameters:body
                                            hud:self.HUD
                                        success:^(id result, MBProgressHUD *hud, NSInteger code, NSString *erMsg) {
                                            [ws requestSuccessDelegate:tag result:result hud:hud code:code erMsg:erMsg];
                                        } failed:^(NSError *error, MBProgressHUD *hud) {
                                            [ws requestFailureDelegate:tag error:error hud:hud];
                                        }];
    
}


#pragma mark 成功回调代理
- (void)requestSuccessDelegate:(ReqApiTag)tag result:(id)result hud:(MBProgressHUD *)hud code:(NSInteger)code erMsg:(NSString *)erMsg {
    if (code == 200 || code == 20000 || code == 0) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestCompleted:data:message:hud:)]) {
            [self.delegate httpRequestCompleted:tag data:result message:erMsg ?:@"" hud:hud];
        }
    }else{
        if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestError:message:hud:)]) {
            [self.delegate httpRequestError:tag message:erMsg ?:@"" hud:hud];
            [MBProgressExpand ex_showError:erMsg hud:hud];
        }
    }
}
#pragma mark 失败回调代理
- (void)requestFailureDelegate:(ReqApiTag)tag error:(id)error hud:(MBProgressHUD *)hud{
    if (self.delegate && [self.delegate respondsToSelector:@selector(httpRequestError:message:hud:)]) {
        [self.delegate httpRequestError:tag message:ERROR_MESSAGE hud:hud];
        [MBProgressExpand ex_showError:nil hud:hud];
    }
}


@end
