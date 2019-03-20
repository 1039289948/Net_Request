//
//  NSString+Expand.h
//  BeautyReception
//
//  Created by iOSMax on 16/3/9.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Expand)

/**
 *  获得移除指定字符串后的新字符串
 */
- (NSString *)ex_removeSpecifiedString:(NSString *)string;

/**
 *  指定 宽度 Font 获取高度
 */
- (CGSize)ex_getContentSizeWithFont:(UIFont *)font AndWidth:(CGFloat)width;

- (CGSize)ex_getContentSizeWithFont:(UIFont *)font AndHight:(CGFloat)hight;

/**
 字符串转字典

 @param jsonString json格式的字符串
 @return 字典
 */
+ (NSDictionary *)ex_dictionaryWithJsonString:(NSString *)jsonString;
/**
 *  字符串 NSNull nil处理
 */
+ (NSString *)ex_stringWithId:(id)value;
+ (NSInteger)ex_integerWithId:(id)value;
+ (long long)ex_longLongWithId:(id)value;
+ (CGFloat)ex_floatWithId:(id)value;
+ (double)ex_doubleWithId:(id)value;
+ (NSString *)ex_stringWithInteger:(NSInteger)value;
+ (NSString *)ex_stringWithDouble:(double)value;

/** 时间戳转->字符串 */
+ (NSString *)ex_getTimeStrWithTimeStamp:(double)stamp;

/** 当前时间转时间戳（NSString）类型的 uinx */
+ (NSString *)ex_getNowTime;

/**
 *  时间戳转字符串
 *
 *  @param stamp 时间戳
 *  @param dateFormat    转化格式 如yyyy-MM-dd HH:mm:ss,即2015-07-15 15:00:00
 *
 *  @return 返回字符串格式时间
 */
+ (NSString *)ex_getTimeStrWithTimeStamp:(double)stamp DateFormat:(NSString *)dateFormat;

/** 字符串转->时间戳 指定格式 */
+ (double)ex_getTimeStampWithTimeStr:(NSString *)str DateFormat:(NSString *)dateFormat;

+ (NSDate *)ex_getTimeStampDateWithTimeStr:(NSString *)str DateFormat:(NSString *)dateFormat;

//时间戳转UTCDate
+ (NSDate *)ex_DateFromTimeStamap:(double)timeStamap;

/** 判断是否int类型数字 */
+ (BOOL)ex_isPureInt:(NSString *)string;

/** 判断是否Float数字 */
+ (BOOL)ex_isPureFloat:(NSString *)string;

/**
 *  是否是 手机号码
 *
 *  @return 是 返回 nil 否 返回error
 */
- (BOOL)ex_isMobileString;

/** 判断是否为 非 @"", nil, NSNull 合法 返回true 不合法 false */
- (BOOL)ex_isLegalString;

/** 网址验证 */
- (BOOL)ex_isValidUrl;


/** MD5加密 */
- (NSString *)ex_md5Security;

/** 手机号 *密文 */
- (NSString *)ex_mobileSecurity;
/**
 *  安全的截取
 */
- (NSString *)ex_subStringToIndex:(NSInteger)index;

- (NSMutableAttributedString *)ex_getAttStringWithAttributeInfo:(NSDictionary *)info InRange:(NSRange)range;

/**
 拼接URL
 */
+ (NSString *)ex_setTimeSpUrl:(NSString *)url;
/**
 删除空格
 */
+ (NSString *)ex_deleSpace:(id)value;

/**
 判断字符串是否有非法字符
 */
+ (BOOL)ex_JudgeTheillegalCharacter:(id)value;

/**
 字典转字符串
 */
+ (NSString *)ex_dicChangeStr:(NSDictionary *)value;

/**
 设置不同字体
 */
+ (NSMutableAttributedString *)setStringFont:(NSString *)string andFont:(CGFloat)font;
+ (NSMutableAttributedString *)ex_sysFont:(NSString *)string andFont:(CGFloat)font;
+ (NSMutableAttributedString *)ex_boldFont:(NSString *)string andFont:(CGFloat)font;

/**
 字典key值升序排序
 */
+ (NSString*)stringWithDict:(NSDictionary*)dict;

+ (NSString *)ex_hexStringFromString:(NSString *)string;

+(NSString *)HmacSha1:(NSString *)key data:(NSString *)data;

///判断为空
- (BOOL)isEqualNull;

@end
