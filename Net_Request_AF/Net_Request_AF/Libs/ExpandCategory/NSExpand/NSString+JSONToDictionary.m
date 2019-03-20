//
//  NSString+JSONToDictionary.m
//  HomeDo
//
//  Created by Lynn on 15/12/8.
//  Copyright © 2015年 Lynn. All rights reserved.
//

#import "NSString+JSONToDictionary.h"

@implementation NSString (JSONToDictionary)

- (NSDictionary *)toDictionaryWithError:(NSError **)_error {
    
    if (self == nil)
        return nil;
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if(error && _error) *_error = error;
    
    return dic;
}

+ (NSString*)jsonStringWithData:(id)object{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}
@end
