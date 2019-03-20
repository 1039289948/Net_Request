//
//  UIColor+Expand.h
//  MbyCSApp
//
//  Created by Mobiyun on 2017/12/4.
//  Copyright © 2017年 冀凯旋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Expand)

/**
 导航条背景颜色

 @return UIcolor
 */
+ (UIColor *)ex_navBackgroundColor;

/**
 导航条字体颜色
 
 @return UIcolor
 */
+ (UIColor *)ex_navFontColor;

/**
 设置中心的昵称字体颜色
 
 @return UIcolor
 */
+ (UIColor *)ex_userNameFontColor;

/**
 登录页面背景颜色

 @return UIcolor
 */
+ (UIColor *)ex_loginBackgoroundColor;

/**
 线的颜色（238, 239, 241）

 @return UIcolor
 */
+ (UIColor *)ex_lineColor;

/**
 纯白色背景

 @return UIcolor
 */
+ (UIColor *)ex_whiteBackgroundColor;
/**
 品牌颜色（160.24.48）

 @return UIcolor
 */
+(UIColor *)ex_brandColor;

/**
 灰色按钮背景颜色（218, 219, 226）

 @return UIcolor
 */
+ (UIColor *)ex_grayBackgroundColor;

/**
 纯白色字体颜色

 @return UIcolor
 */
+ (UIColor *)ex_whiteFontColor;

/**
 UITableView背景颜色灰白色（高亮灰）

 @return UIcolor
 */
+ (UIColor *)ex_tableViewBackgroundColor;

/**
 UITableview线的颜色灰白色（高亮灰）

 @return UIcolor
 */
+ (UIColor *)ex_tableViewLineBackgroundColor;

/**
 UITableView组头的字体颜色

 @return UIcolor
 */
+ (UIColor *)ex_tableViewGroupFontColor;

/**
 黑色字体（51,51,51）

 @return UIcolor
 */
+ (UIColor *)ex_labelBlackFontColor;

/**
 指示器颜色（160 24 48）
 
 @return UIcolor
 */
+ (UIColor *)ex_redLineBackgroundColor;

/**
 浅粉色颜色（246 234 236）

 @return UIcolor
 */
+ (UIColor *)ex_pinkBackgroundColor;
/**
 无数据背景颜色（242 243 244）
 
 @return UIcolor
 */
+ (UIColor *)ex_noDataBackgroundColor;


//////////////////////////////////////////////////////////////////////////////////////////////////

/**
 tipAlertLab背景颜色

 @return UIcolor
 */
+ (UIColor *)ex_tipAlertLabBackgroundColor;

/**
 tipAlertLab字体颜色

 @return UIcolor
 */
+ (UIColor *)ex_tipAlertLabFontColor;

/**
 卡券标题字体颜色（74 79 84）

 @return UIcolor
 */
+ (UIColor *)ex_couponTitleFontColor;

/**
 卡券时间字体颜色（129 131 141）
 
 @return UIcolor
 */
+ (UIColor *)ex_couponTimeFontColor;

/**
 卡券状态字体颜色（187 189 199）
 
 @return UIcolor
 */
+ (UIColor *)ex_couponStatuFontColor;

/**
 收藏黑色字体（74 79 84）
 
 @return UIcolor
 */
+ (UIColor *)ex_collectLabelBlackFontColor;

/**
 收藏灰色字体（129 131 141）
 
 @return UIcolor
 */
+ (UIColor *)ex_collectLabelGaryFontColor;

/**
 收藏-附件-灰色字体（100.100.100）
 
 @return UIcolor
 */
+ (UIColor *)ex_collectAccessoryGaryFontColor;

/**
 积分灰色字体（155，155，155）

 @return UIcolor
 */
+ (UIColor *)ex_integralLabelGaryFontColor;

/**
 违章查询红色背景颜色（134.9.31）

 @return UIcolor
 */
+ (UIColor *)ex_illegalRedBackgroundColor;


@end
