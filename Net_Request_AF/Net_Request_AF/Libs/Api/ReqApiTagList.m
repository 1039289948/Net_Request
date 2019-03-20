//
//  ReqApiTagList.m
//  TestProjectDome
//
//  Created by Mobiyun on 2017/7/3.
//  Copyright © 2017年 Mobiyun. All rights reserved.
//

#import "ReqApiTagList.h"
#import "ApiHostManager.h"


@implementation ReqApiTagList


+(NSString *)createRequestUrl_Tag:(ReqApiTag)tag typeDic:(NSDictionary *)typeDic urlType:(URL_TYPE)urlType{
    
    switch (tag) {
            case ReqApiTagGetAppStoreInfo:
            return [NSString stringWithFormat:@"%@%@", JAVA_API_HOST, [self creatnewOpenUrl:typeDic type:urlType url:@"customer/getCustomer"]];
        case ReqApiTagGetAppStore:
            return [NSString stringWithFormat:@"%@%@",JAVA_API_HOST,[self creatnewOpenUrl:typeDic type:urlType url:@"/cities"]];
        case MobiReqApiTag_get_collection_dealer:
            return [NSString stringWithFormat:@"%@%@",@"http://csapp-api-j-dev.themobiyun.com",[self creatnewOpenUrl:typeDic type:urlType url:@"/sys/userinvoice/list"]];
        default:
            return @"";
    }
}

+ (NSString *)createRequestUrl_Tag:(ReqApiTag)tag value:(NSDictionary *)value keyValue:(NSDictionary *)keyValue{
    
    switch (tag) {
//        case ReqApiTagListGet_SpList:
//            return [NSString stringWithFormat:@"%@%@", JAVA_API_HOST, [self creatnewOpenUrl:value keyValue:keyValue url:@"app_sp/list/:lng/:lat"]];
//        case ReqApiTagListGet_DealerList:
//            return [NSString stringWithFormat:@"%@%@", JAVA_API_HOST, [self creatnewOpenUrl:value keyValue:keyValue url:@"app_dealer/list/:lng/:lat"]];
//        case ReqApiTagListBound_Account:
//            return [NSString stringWithFormat:@"%@%@", JAVA_API_HOST, [self creatnewOpenUrl:value keyValue:keyValue url:@"third/bind/ios/:platform_type"]];
//        case ReqApiTagListGet_userDynamicList:
//            return [NSString stringWithFormat:@"%@%@", JAVA_API_HOST, [self creatnewOpenUrl:value keyValue:keyValue url:@"customer/focusList/:focusType"]];
        default:
            return @"";
    }
}


/**
 普通的URL拼接
 */
+(NSString *)creatnewOpenUrl:(NSDictionary *)dic type:(URL_TYPE)type url:(NSString *)url{
    
    __block NSString *returnUrl = [self asTrim:url];
    
    /**
     *  网络请求URL不带任何参数
     */
    if (type == URL_TYPE_NORMAL) {
        url = @"";
    }
    /**
     *  网络请求带拼接参数（/:key<value>）
     */
    if (type == URL_TYPE_PARAMETER_CODE) {
        
        if (dic != nil && [dic count] != 0) {
            
            NSArray <NSString *> *allKeys = dic.allKeys;
            
            [allKeys enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![obj isKindOfClass:[NSString class]]) {
                    obj = [NSString stringWithFormat:@"%zi",(NSInteger)obj];
                }
                returnUrl = [returnUrl stringByReplacingOccurrencesOfString:[self asTrim:obj] withString:[self asTrim:dic[obj]]];
                
            }];
        }
    }
    
    /**
     *  网络请求带拼接参数普通（?key=value&key=value）
     */
    
    if (type == URL_TYPE_PARAMETER_NORMAL) {
        
        if (dic != nil && [dic count] != 0) {
            NSArray <NSString *> *allKeys = dic.allKeys;
            [allKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![obj isKindOfClass:[NSString class]]) {
                    obj = [NSString stringWithFormat:@"%zi",(NSInteger)obj];
                }
                if (idx == 0) {
                    returnUrl = [NSString stringWithFormat:@"%@?%@=%@",returnUrl, [self asTrim:obj], [self asTrim:dic[obj]]];
                }else{
                    returnUrl = [NSString stringWithFormat:@"%@&%@=%@", returnUrl, [self asTrim:obj], [self asTrim:dic[obj]]];
                }
            }];
        }
    }
    returnUrl = [self ex_stringByAppden:returnUrl];
    returnUrl = [returnUrl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    returnUrl = [returnUrl stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
    
    return [returnUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}

/**
 特殊的URL拼接（:key(value)?key=value&key=value）
 
 
 */
+ (NSString *)creatnewOpenUrl:(NSDictionary *)value keyValue:(NSDictionary *)keyValue url:(NSString *)url{
    
    __block NSString *returnUrl = [self asTrim:url];
    
    if (value != nil && [value count] != 0) {
        
        NSArray <NSString *> *allKeys = value.allKeys;
        
        [allKeys enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            returnUrl = [returnUrl stringByReplacingOccurrencesOfString:[self asTrim:obj] withString:[self asTrim:value[obj]]];
            
            if ([allKeys count] == idx + 1) {
                if (keyValue != nil && [keyValue count] != 0) {
                    
                    NSArray <NSString *> *key_values = keyValue.allKeys;
                    [key_values enumerateObjectsUsingBlock:^(NSString * _Nonnull value_obj, NSUInteger value_idx, BOOL * _Nonnull value_stop) {
                        if (value_idx == 0) {
                            returnUrl = [NSString stringWithFormat:@"%@?%@=%@",returnUrl, [self asTrim:value_obj], [self asTrim:keyValue[value_obj]]];
                        }else{
                            returnUrl = [NSString stringWithFormat:@"%@&%@=%@", returnUrl, [self asTrim:value_obj], [self asTrim:keyValue[value_obj]]];
                        }
                        
                    }];
                }
            }
            
        }];
    }
    returnUrl = [self ex_stringByAppden:returnUrl];
    returnUrl = [returnUrl stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    returnUrl = [returnUrl stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]];
    
    return [returnUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

+ (id) asTrim:(id)obj{
    
    NSString *value = @"";
    
    if ([obj isKindOfClass:[NSArray class]]) {
        return [NSString stringWithFormat:@"[%@]",[obj componentsJoinedByString:@","]];
    }
    if ([obj isEqual:[NSNull null]] || obj == nil) {
        
        value = @"";
    }else{
        if (![obj isKindOfClass:[NSString class]]) {
            value = [NSString stringWithFormat:@"%@",obj];
        }else{
            value = obj;
        }
    }
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    return value;
}


/**
 网络请求拼接品牌、用户ID

 @param url 拼接前URL
 @return 拼接后的URL
 */
+ (NSString *)ex_stringByAppden:(NSString *)url{
    
    return url;
}



@end

