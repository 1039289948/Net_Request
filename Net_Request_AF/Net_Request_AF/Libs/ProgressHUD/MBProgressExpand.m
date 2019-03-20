//
//  MBProgressExpand.m
//  Net_Request_AF
//
//  Created by MoBiyun on 2019/3/18.
//  Copyright © 2019 jikaixuan. All rights reserved.
//

#import "MBProgressExpand.h"
#import <MBProgressHUD.h>

static const NSTimeInterval afterDelay = 2.0;
static NSString * const defaultMessage = @"正在加载...";
static NSString * const defaultSuccess = @"加载完成";
static NSString * const defaultError = @"加载失败";

@interface MBProgressExpand ()
@property (strong, nonatomic) MBProgressHUD *m_exHUD;
@end

@implementation MBProgressExpand


+ (MBProgressExpand *)sharedInstance{
    
    static MBProgressExpand *sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[MBProgressExpand alloc] init];
    });
    
    return sharedInstance;
}

-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}


- (MBProgressHUD *)iniView:(UIView *)view{
    
    if (view == nil) {
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    if (self.m_exHUD) {
        self.m_exHUD.removeFromSuperViewOnHide = true;
        [self.m_exHUD hideAnimated:true];
        self.m_exHUD = nil;
    }
    self.m_exHUD = [MBProgressHUD showHUDAddedTo:view animated:true];
    self.m_exHUD.label.textColor = [UIColor whiteColor];
    self.m_exHUD.label.font = [UIFont systemFontOfSize:14.0];
    self.m_exHUD.removeFromSuperViewOnHide = true;
    self.m_exHUD.contentColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.f];
    self.m_exHUD.bezelView.color = [UIColor colorWithWhite:0.f alpha:1];
    self.m_exHUD.bezelView.layer.cornerRadius = 15;
    
    self.m_exHUD.backgroundView.style = MBProgressHUDBackgroundStyleBlur;
    self.m_exHUD.backgroundView.color = [UIColor colorWithWhite:0.0f alpha:0.2f];
    
    return self.m_exHUD;
}

/**
 数据加载中
 
 @param message 加载信息
 */
+ (MBProgressHUD *)ex_loading:(NSString *)message{
    MBProgressHUD *hud = [[MBProgressExpand sharedInstance] iniView:nil];
    if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
        hud.label.text = defaultMessage;
    }else{
        hud.label.text = message;
    }
    return hud;
}


/**
 数据加载中
 
 @param message 加载信息提示
 @param view 当前view
 */
+(MBProgressHUD *)ex_loading:(NSString *)message toView:(UIView *)view{
    [self ex_hideHUDForView:view];
    MBProgressHUD *hud = [[MBProgressExpand sharedInstance] iniView:nil];
    if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
        hud.label.text = defaultMessage;
    }else{
        hud.label.text = message;
    }
    return hud;
}

/**
 加载成功

 @param message 加载成功信息显示
 */
+(void)ex_showSuccess:(NSString *)message{
    MBProgressHUD *hud = [[MBProgressExpand sharedInstance] iniView:nil];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
        hud.label.text = defaultSuccess;
    }else{
        hud.label.text = message;
    }
    hud.removeFromSuperViewOnHide = true;
    [hud hideAnimated:true afterDelay:afterDelay];
}

/**
 加载成功HUD

 @param message 成功提示信息
 @param hud MBProgressHUD
 */
+ (void)ex_showSuccess:(NSString *)message hud:(MBProgressHUD *)hud{
    if (hud == nil) {
        [self ex_showSuccess:message];
    }else{
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
            hud.label.text = defaultSuccess;
        }else{
            hud.label.text = message;
        }
        hud.removeFromSuperViewOnHide = true;
        [hud hideAnimated:true afterDelay:afterDelay];
    }
}

/**
 加载成功HUD

 @param message 加载成功信息显示
 @param view 当前view
 */
+(void)ex_showSuccess:(NSString *)message toView:(UIView *)view{
    MBProgressHUD *hud = [[MBProgressExpand sharedInstance] iniView:view];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
        hud.label.text = defaultSuccess;
    }else{
        hud.label.text = message;
    }
    hud.removeFromSuperViewOnHide = true;
    [hud hideAnimated:true afterDelay:afterDelay];
}

/**
 加载成功HUD

 @param message 成功信息
 @param view 当前view
 @param hud MBProgressHUD
 */
+ (void)ex_showSuccess:(NSString *)message toView:(UIView *)view hud:(MBProgressHUD *)hud{
    if (hud == nil) {
        [self ex_showSuccess:message toView:view];
    }else{
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:@"Checkmark"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
            hud.label.text = defaultSuccess;
        }else{
            hud.label.text = message;
        }
        hud.removeFromSuperViewOnHide = true;
        [hud hideAnimated:true afterDelay:afterDelay];
    }
}

/**
 加载失败HUD

 @param message 失败信息
 */
+ (void)ex_showError:(NSString *)message{
    MBProgressHUD *hud = [[MBProgressExpand sharedInstance] iniView:nil];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"hud_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
        hud.label.text = defaultError;
    }else{
        hud.label.text = message;
    }
    hud.removeFromSuperViewOnHide = true;
    [hud hideAnimated:true afterDelay:afterDelay];
}

/**
 加载失败HUD

 @param message 失败信息
 @param view 当前view
 */
+ (void)ex_showError:(NSString *)message toView:(UIView *)view{
    MBProgressHUD *hud = [[MBProgressExpand sharedInstance] iniView:view];
    hud.mode = MBProgressHUDModeCustomView;
    UIImage *image = [[UIImage imageNamed:@"hud_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
        hud.label.text = defaultError;
    }else{
        hud.label.text = message;
    }
    hud.removeFromSuperViewOnHide = true;
    [hud hideAnimated:true afterDelay:afterDelay];
}


/**
 加载失败HUD

 @param message 失败信息
 @param hud MBProgressHUD
 */
+ (void)ex_showError:(NSString *)message hud:(MBProgressHUD *)hud{
    if (hud == nil) {
        [self ex_showError:message];
    }else{
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:@"hud_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
            hud.label.text = defaultError;
        }else{
            hud.label.text = message;
        }
        hud.removeFromSuperViewOnHide = true;
        [hud hideAnimated:true afterDelay:afterDelay];
    }
    
}

/**
 加载失败HUD

 @param message 失败信息
 @param view 当前view
 @param hud MBProgressHUD
 */
+ (void)ex_showError:(NSString *)message toView:(UIView *)view hud:(MBProgressHUD *)hud{
    if (hud == nil) {
        [self ex_showError:message toView:view];
    }else{
        hud.mode = MBProgressHUDModeCustomView;
        UIImage *image = [[UIImage imageNamed:@"hud_error"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        hud.customView = [[UIImageView alloc] initWithImage:image];
        hud.square = YES;
        if (message == nil || message.length == 0 || [message isEqual:[NSNull null]]) {
            hud.label.text = defaultError;
        }else{
            hud.label.text = message;
        }
        hud.removeFromSuperViewOnHide = true;
        [hud hideAnimated:true afterDelay:afterDelay];
    }
}







/**
 *  手动关闭MBProgressHUD
 */
+ (void)ex_hideHUD{
    [self ex_hideHUDForView:nil];
}
/**
 *  @param view    显示MBProgressHUD的视图
 */
+ (void)ex_hideHUDForView:(UIView *)view{
    if (view == nil){
        view = [[UIApplication sharedApplication].windows lastObject];
    }
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
