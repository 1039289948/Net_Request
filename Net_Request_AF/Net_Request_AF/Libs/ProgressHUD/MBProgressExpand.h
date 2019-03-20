//
//  MBProgressExpand.h
//  Net_Request_AF
//
//  Created by MoBiyun on 2019/3/18.
//  Copyright © 2019 jikaixuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MBProgressHUD;
@interface MBProgressExpand : NSObject

/**
 网络请求HUD实例化
 
 @return MobiReqManager
 */
+(MBProgressExpand *)sharedInstance;


/**
 加载中的HUD-默认当前Windows窗口

 @param message 提示信息
 @return MBProgressHUD
 */
+ (MBProgressHUD *)ex_loading:(NSString *)message;

/**
 加载中的HUD-自定义窗口

 @param message 提示信息
 @param view 当前view
 @return MBProgressHUD
 */
+ (MBProgressHUD *)ex_loading:(NSString *)message toView:(UIView *)view;

+ (void)ex_showSuccess:(NSString *)message;
+ (void)ex_showSuccess:(NSString *)message toView:(UIView *)view;

+ (void)ex_showSuccess:(NSString *)message hud:(MBProgressHUD *)hud;
+ (void)ex_showSuccess:(NSString *)message toView:(UIView *)view hud:(MBProgressHUD *)hud;

+ (void)ex_showError:(NSString *)message ;
+ (void)ex_showError:(NSString *)message toView:(UIView *)view;

+ (void)ex_showError:(NSString *)message hud:(MBProgressHUD *)hud;
+ (void)ex_showError:(NSString *)message toView:(UIView *)view hud:(MBProgressHUD *)hud;


+ (void)ex_hideHUD;
+ (void)ex_hideHUDForView:(UIView *)view;

@end
