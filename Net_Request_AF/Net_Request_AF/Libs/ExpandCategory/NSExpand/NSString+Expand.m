//
//  NSString+Expand.m
//

#import "NSString+Expand.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSDate+Expand.h"
#include <CommonCrypto/CommonDigest.h>
#include <CommonCrypto/CommonHMAC.h>

static const NSString* urlExpString = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";


@implementation NSString (Expand)

- (NSString *)ex_removeSpecifiedString:(NSString *)string{
    
    NSArray *array = [self componentsSeparatedByString:string];
    
    return [array componentsJoinedByString:@""];
}

- (CGSize)ex_getContentSizeWithFont:(UIFont *)font AndWidth:(CGFloat)width;{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}

- (CGSize)ex_getContentSizeWithFont:(UIFont *)font AndHight:(CGFloat)hight {
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [self boundingRectWithSize:CGSizeMake(MAXFLOAT, hight)
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    return retSize;
}

+ (NSString *)ex_stringWithId:(id)value{
    NSString *strValue = @"";
    
    if(value == nil || value == [NSNull null] || [value isEqual:@"null"] || [value isEqual:@"<nil>"]){
        
    }else{
        if ([value isKindOfClass:[NSNumber class]])
            strValue = [NSString stringWithFormat:@"%@", value];
        else
            strValue = value;
        if ([value isKindOfClass:[NSDictionary class]]) {
            
        }
        strValue = [strValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    }
    
    return strValue;
}



+ (NSInteger)ex_integerWithId:(id)value{
    NSInteger intValue = 0;
    
    if(value == nil || value == [NSNull null]){
        
    }else
        intValue = [value integerValue];
    
    return intValue;
}

+ (long long)ex_longLongWithId:(id)value{
    long long intValue = 0;
    
    if(value == nil || value == [NSNull null]){
        
    }else
        intValue = [value longLongValue];
    
    return intValue;
}

+ (CGFloat)ex_floatWithId:(id)value{
    
    CGFloat fValue = 0;
    if(value == nil || value == [NSNull null]){
        
    }else {
        fValue = [value floatValue];
    }
    return fValue;
}
+ (double)ex_doubleWithId:(id)value{
    
    double fValue = 0;
    if(value == nil || value == [NSNull null]){
        
    }else {
        fValue = [value doubleValue];
    }
    return fValue;
}


+ (NSString *)ex_stringWithInteger:(NSInteger)value{
    return [NSString stringWithFormat:@"%zi",value];
}
+(NSString *)ex_stringWithDouble:(double)value{
    return [NSString stringWithFormat:@"%f",value];
}

/** 时间戳转->字符串 */
+ (NSString *)ex_getTimeStrWithTimeStamp:(double)stamp{
    
    NSDate *date            = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    [format setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *timeStr = [format stringFromDate:date];
    
    return timeStr;
}

/** 当前时间转时间戳（NSString）类型的 uinx */
+ (NSString *)ex_getNowTime{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}

/** 时间戳转->字符串 */
+ (NSString *)ex_getTimeStrWithTimeStamp:(double)stamp DateFormat:(NSString *)dateFormat{
    
    NSDate *date            = [NSDate dateWithTimeIntervalSince1970:stamp];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    
    [format setDateFormat:dateFormat];
    NSString *timeStr = [format stringFromDate:date];
    
    return timeStr;
}

/** 字符串转->时间戳 指定格式 */
+ (double)ex_getTimeStampWithTimeStr:(NSString *)str DateFormat:(NSString *)dateFormat{
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:dateFormat];
    NSDate *date = [format dateFromString:str];
    
    return [date timeIntervalSince1970];
}

+ (NSDate *)ex_getTimeStampDateWithTimeStr:(NSString *)str DateFormat:(NSString *)dateFormat{
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [format setDateFormat:dateFormat];
    
    return [format dateFromString:str];
}

+ (NSDate *)ex_DateFromTimeStamap:(double)timeStamap{
    //  /1000;传入的时间戳timeStamap如果是精确到毫秒的记得要/1000
    NSDate *Date=[NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)timeStamap];
    return Date;
}

+ (BOOL)ex_isPureInt:(NSString *)string{
    NSScanner *scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)ex_isPureFloat:(NSString *)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

- (BOOL)ex_isMobileString {
    
    if (self.length != 11)
        return false;
    
    if (![NSString ex_isPureInt:self])
        return false;
    
    if (![[self substringToIndex:1] isEqualToString:@"1"]) {
        return false;
    }
    
    return true;
}

- (BOOL)ex_isLegalString{
    NSString *str = [NSString ex_stringWithId:self];
    if ([str isEqualToString:@""]){
        return false;
    }
    return true;
}

- (BOOL)ex_isValidUrl{
    NSString *string = [NSString ex_stringWithId:self];
    
    if (string.length < 5) {
        return NO;
    }
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlExpString];
    if (![pred evaluateWithObject:string]) {
        return NO;
    }
    return YES;
}

- (NSString *)ex_md5Security {
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)ex_mobileSecurity{
    if (self.length != 11) {
        if (self.length != 0)
            NSLog(@"手机号处理错误：%@", self);
        
        return self;
    }
    
    NSMutableString *mutStr = [self mutableCopy];
    
    [mutStr replaceCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    
    return mutStr;
}

- (NSString *)ex_subStringToIndex:(NSInteger)index {
    if (self.length <= index)
        return self;
    
    return [self substringToIndex:index];
}

- (NSMutableAttributedString *)ex_getAttStringWithAttributeInfo:(NSDictionary *)info InRange:(NSRange)range{
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:self];
    
    [info enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [attStr addAttribute:key value:obj range:range];
    }];
    
    return attStr;
}

+ (NSString *)ex_setTimeSpUrl:(NSString *)url{
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[[NSDate date] ex_dateAfterDay:2] timeIntervalSince1970]];
    NSString *urlString = [NSString stringWithFormat:@"%@?v=%@",url,timeSp];
    return urlString;
}

+ (NSString *)ex_deleSpace:(id)value{
    
    NSMutableString *str = [[NSMutableString alloc]initWithFormat:@"%@", [NSString ex_stringWithId:value]];
    
    return [str stringByReplacingOccurrencesOfString:@" " withString:@""];
}

+ (BOOL)ex_JudgeTheillegalCharacter:(id)value{
    
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:[NSString ex_stringWithId:value]]) {
        return true;
    }
    return false;
}

+ (NSMutableAttributedString *)setStringFont:(NSString *)string andFont:(CGFloat)font {
    if ([NSString ex_stringWithId:string].length == 0) {
        return [[NSMutableAttributedString alloc]initWithString:@""];
    }
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:string];
    [attriString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"MHeiPRC" size:font] range:NSMakeRange(0, string.length)];

    return attriString;
}

+ (NSMutableAttributedString *)ex_sysFont:(NSString *)string andFont:(CGFloat)font {
    if ([NSString ex_stringWithId:string].length == 0) {
        return [[NSMutableAttributedString alloc]initWithString:@""];
    }
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:string];
    [attriString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"MHeiPRC" size:font] range:NSMakeRange(0, string.length)];
    
    return attriString;
}

+ (NSMutableAttributedString *)ex_boldFont:(NSString *)string andFont:(CGFloat)font {
    if ([NSString ex_stringWithId:string].length == 0) {
        return [[NSMutableAttributedString alloc]initWithString:@""];
    }
    UIFont *custom = [UIFont fontWithName:@"CJNgaiPRC-Bold" size:font];
    
    if (custom) {
        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc]initWithString:string];
        [attriString addAttribute:NSFontAttributeName value:custom range:NSMakeRange(0, string.length)];
        return attriString;
    }
    return [[NSMutableAttributedString alloc]initWithString:@""];
}


+ (NSString *)HmacSha1:(NSString *)key data:(NSString *)data{
    
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    //Sha256:
    // unsigned char cHMAC[CC_SHA256_DIGEST_LENGTH];
    //CCHmac(kCCHmacAlgSHA256, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    //sha1
    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
                                          length:sizeof(cHMAC)];
    
    NSString *hash = [HMAC base64EncodedStringWithOptions:0];//将加密结果进行一次BASE64编码。
    return hash;
    
}

+ (NSString *)stringWithDict:(NSDictionary*)dict{
    
    NSArray *arrPrimary = dict.allKeys;
    NSArray *arrKey = [arrPrimary sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
        NSComparisonResult result = [obj1 compare:obj2];
        return result==NSOrderedDescending;//NSOrderedAscending 倒序
    }];
    NSString*str =@"";
    for (NSString *s in arrKey) {
        id value = dict[s];
        if([value isKindOfClass:[NSDictionary class]]) {
            value = [self stringWithDict:value];
        }
        if([str length] !=0) {
            str = [str stringByAppendingString:@"&"];
        }
        str = [str stringByAppendingFormat:@"%@=%@",s,value];
    }
    NSLog(@"str:%@",str);
    return str;

}

+ (NSString *)ex_hexStringFromString:(NSString *)string{
    NSData *myD = [string dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[myD bytes];
    NSLog(@"%s", bytes);
    //下面是Byte 转换为16进制。
    NSString *hexStr=@"";
    for(int i=0;i<[myD length];i++){
        NSString *newHexStr = [NSString stringWithFormat:@"%x",bytes[i]&0xff];///16进制数
        if([newHexStr length]==1)
            hexStr = [NSString stringWithFormat:@"%@0%@",hexStr,newHexStr];
        else
            hexStr = [NSString stringWithFormat:@"%@%@",hexStr,newHexStr];
    }
    return hexStr;
}

+ (NSString *)ex_dicChangeStr:(NSDictionary *)value{
    if (value == nil) {
        return @"";
    }
    NSError *parseError;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:value options:NSJSONWritingPrettyPrinted error:&parseError];
    if (parseError) {
        return @"";
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary *)ex_dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (BOOL)isEqualNull {
    
    if ([self isKindOfClass:[NSNull class]] || [self isEqual:[NSNull null]] || self == nil) {
        return YES;
    }
    return NO;
}



@end
