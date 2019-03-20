//
//  UIColor+Expand.m
//  MbyCSApp
//
//  Created by Mobiyun on 2017/12/4.
//  Copyright © 2017年 冀凯旋. All rights reserved.
//

#import "UIColor+Expand.h"
#import "Category.h"

@implementation UIColor (Expand)

+(UIColor *)ex_navBackgroundColor{
    return RGBA(255, 255, 255, 1);
}
+ (UIColor *)ex_loginBackgoroundColor{
    return RGBA(24, 24, 24, 1);
}
+(UIColor *)ex_userNameFontColor{
    return RGB(255, 255, 255);
}
#pragma mark 品牌颜色（160.24.48）
+(UIColor *)ex_brandColor{
    return RGBA(0, 96, 127, 1);
}
+(UIColor *)ex_navFontColor{
    return RGB(255, 255, 255);
}
#pragma mark 线的颜色（238, 239, 241,）
+ (UIColor *)ex_lineColor{
    return RGBA(238, 238, 238, 1);
}
+ (UIColor *)ex_whiteBackgroundColor{
    return RGBA(255, 255, 255, 1);
}

+(UIColor *)ex_whiteFontColor{
    return RGBA(255, 255, 255, 1);
}
#pragma 灰色按钮 218, 219, 226
+(UIColor *)ex_grayBackgroundColor{
    return RGBA(218, 219, 226, 1);
}
#pragma mark UITableView背景颜色灰白色（高亮灰）
+ (UIColor *)ex_tableViewBackgroundColor{
    return RGB(242, 243, 244);
}
#pragma mark UITableview线的颜色灰白色（高亮灰）
+ (UIColor *)ex_tableViewLineBackgroundColor{
    return RGB(244, 244, 244);
}
#pragma mark UITableView组头的字体颜色
+ (UIColor *)ex_tableViewGroupFontColor{
    return RGB(187, 189, 199);
}
#pragma mark 黑色字体（51,51,51）
+ (UIColor *)ex_labelBlackFontColor{
    return RGBA(51, 51, 51, 1);
}
#pragma mark 指示器颜色（160 24 48）
+ (UIColor *)ex_redLineBackgroundColor{
    return RGB(160, 24, 48);
}
#pragma mark 浅粉色颜色（246 234 236）
+ (UIColor *)ex_pinkBackgroundColor{
    return RGB(246, 234, 236);
}
#pragma mark 无数据背景颜色（242 243 244）
+ (UIColor *)ex_noDataBackgroundColor{
    return RGB(242, 243, 244);
}






////////////////////////////////
+(UIColor *)ex_tipAlertLabBackgroundColor{
    return RGBA(246, 234, 236, 1);
}
+(UIColor *)ex_tipAlertLabFontColor{
    return RGBA(160, 24, 48, 1);
}
#pragma mark 卡券标题字体颜色（74 79 84）
+ (UIColor *)ex_couponTitleFontColor{
    return RGB(74, 79, 84);
}
#pragma mark 卡券时间字体颜色（129 131 141）
+(UIColor *)ex_couponTimeFontColor{
    return RGB(129, 131, 141);
}
#pragma mark 卡券状态字体颜色（187 189 199）
+(UIColor *)ex_couponStatuFontColor{
    return RGB(187, 189, 199);
}
#pragma mark 收藏黑色字体（74 79 84）
+(UIColor *)ex_collectLabelBlackFontColor{
    return RGB(74, 79, 84);
}
#pragma mark 收藏灰色字体（129 131 141）
+(UIColor *)ex_collectLabelGaryFontColor{
    return RGB(129, 131, 141);
}
#pragma mark 收藏-附件-灰色字体（100.100.100)
+(UIColor *)ex_collectAccessoryGaryFontColor{
    return RGB(100, 100, 100);
}
#pragma mark 积分灰色字体（155，155，155）
+ (UIColor *)ex_integralLabelGaryFontColor{
    return RGB(155, 155, 155);
}
#pragma mark 违章查询红色背景颜色（134.9.31）
+(UIColor *)ex_illegalRedBackgroundColor{
    return RGB(134, 9, 31);
}

@end
