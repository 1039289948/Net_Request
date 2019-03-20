//
//  Category.h
//  WisdomFrontDesk_PadHD
//
//  Created by bokaPM on 16/6/13.
//  Copyright © 2016年 iOSMax. All rights reserved.
//

#ifndef Category_h
#define Category_h

#import "UIFont+Expand.h"


#import "NSString+Expand.h"
#import "NSDate+Expand.h"
#import "NSArray+Expand.h"

#import "UIImage+Expand.h"
#import "UIView+Expand.h"
#import "UILabel+Expand.h"
#import "UIButton+Expand.h"
#import "UIImageView+Expand.h"
#import "UITextField+Expand.h"
#import "UILabel+Copy.h"
#import "UINib+Expand.h"

#import "NSMutableAttributedString+Expand.h"
#import "NSString+JSONToDictionary.h"
#import "UITableView+Expand.h"
#import "UIColor+Expand.h"
#import "MBProgressExpand.h"

#endif /* Category_h */


/**
 * HUD 停留时间
 */
#define HUD_SHOW_AFTER_HIDE 2

/**
 * HUD 停留时间(页面跳转)
 */
#define HUD_SHOW_TIME 0

/**
 *  LoadTag
 */
#define LoadTag (10086)

//打印
#ifdef DEBUG
#define NLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
//#define NLog(...) NSLog(__VA_ARGS__)
#else
#define NLog(...)
#endif


/**
 *  懒加载
 */
#define M_LazyLoadMutableArray(obj, method) - (NSMutableArray *)method {\
if (obj == nil) {obj = [NSMutableArray array];}\
return obj;}

#define M_LazyLoadMutableDictionary(obj, method) - (NSMutableDictionary *)method {\
if (obj == nil) {obj = [NSMutableDictionary dictionary];}\
return obj;}

#define HL_LAZELOAD(Cls, var) -(Cls*)var {if (!_##var) _##var = ({Cls* c = [Cls new];c;});return _##var;}
//m_scale_width

/**
 设计图是以iPhone6开发
 */
#define M_SCALE_WIDTH(obj) (mainScreen_Width/375)*obj
#define M_SCALE_HEIGHT(obj) (mainScreen_Height/667)*obj

/**
 *  IndexPath
 */
#define M_IndexPath(section, row) ([NSIndexPath indexPathForRow:row inSection:section])

/**
 *  IndexSet
 */
#define M_IndexSet(section) ([[NSIndexSet alloc] initWithIndex:section])

//RGB颜色
#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//字体
#define M_FONT_SYSTEM(font) ([UIFont systemFontOfSize:font])
#define M_FONT_BOLD(font)   ([UIFont boldSystemFontOfSize:font])

//当前View宽度
#define CurrentViewWidth (CGRectGetWidth(self.frame))

//当前View高度
#define CurrentViewHeight (CGRectGetHeight(self.frame))


#define mainScreen_Width ([[UIScreen mainScreen] bounds].size.width)

#define mainScreen_Height ([[UIScreen mainScreen] bounds].size.height)

#define kApplicationStatusBarHeight  [UIApplication sharedApplication].statusBarFrame.size.height

#define WS __weak typeof(self) ws = self;



#pragma mark - 常用宏
/**
 *  APP编号
 */
#define APPID @"931167309"

/**
 *  APP苹果下载地址
 */
#define IPHONE_DOWNLOAD_URL @"https://itunes.apple.com/us/app/fm365-mei-rong-mei-fa-mei/id905626963?l=zh&ls=1&mt=8"

#define kRedirectURI @"https://www.sina.com"

/**
 *是否为iPad版
 */
#define ISPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"] ? YES : NO)
/**
 *是否为iPhone X
 */
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

/**
 *是否>=IOS8系统
 */
#define ISIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)

/**
 *  3.5寸屏
 */
#define IS_IPHONE_35 ([UIScreen mainScreen].bounds.size.height == 480.f)

/**
 *  4.0寸屏
 */
#define IS_IPHONE_40 ([UIScreen mainScreen].bounds.size.height == 568.f)

/**
 *  4.7寸屏
 */
#define IS_IPHONE_47 ([UIScreen mainScreen].bounds.size.height == 667.f)

/**
 *  5.5寸屏
 */
#define IS_IPHONE_55 ([UIScreen mainScreen].bounds.size.height == 736.f)

/**
 *  5.8寸屏
 */
#define IS_IPHONE_58 ([UIScreen mainScreen].bounds.size.height == 812.f)

#define isiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)  

/**
 *  Cell高度
 */
#define TabCellH (mainScreen_Width == 320 ? 44 : 50)

/**
 *  新建预约 left 边距
 */
#define top_left 20

/**
 *  新建预约 title 宽度
 */
#define title_Width 200
/**
 *  新建预约 title 高度
 */
#define title_Height 30

/*
 * 3分钟内不需要输入pin码
 */
#define kPinIntervalTime         3       //分钟
