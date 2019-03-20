//
//  ViewController.m
//  Net_Request_AF
//
//  Created by MoBiyun on 2019/3/18.
//  Copyright © 2019 jikaixuan. All rights reserved.
//

#import "ViewController.h"
#import "Category.h"
#import "Category.h"
#import "MobiReqManager.h"

@interface ViewController ()<HttpRequsetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 40, 30, 20);
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn setTitle:@"加载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (void)login{
    [[MobiReqManager sharedInstance] get_Normal_RequestApi:MobiReqApiTag_get_collection_dealer thisView:self.navigationController.view waitText:@"加载中" delegate:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [[MobiReqManager sharedInstance] get_Normal_RequestApi:ReqApiTagGetAppStore thisView:self.navigationController.view waitText:@"加载中" delegate:self];
//        [[MobiReqManager sharedInstance] get_Normal_RequestApi:ReqApiTagGetAppStore thisView:self.navigationController.view waitText:@"加载中" delegate:self];
//        [[MobiReqManager sharedInstance] get_Normal_RequestApi:ReqApiTagGetAppStore thisView:self.navigationController.view waitText:@"加载中" delegate:self];
    });
   

//    [MBProgressExpand ex_loading:@"1234567ewrewr"];
//    [MBProgressExpand ex_showError:@"加载完成"];
//    [MBProgressHUD ex_loading:@"990099213123" toView:self.view];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressExpand ex_loading:@"加载另一个" toView:self.view];
//        [MBProgressExpand ex_hideHUD];
//    });
    
}

- (void)httpRequestStart:(ReqApiTag)tag hud:(MBProgressHUD *)hud{
    NSLog(@"*******************start********************");
    NSLog(@"%zi",tag);
    NSLog(@"%@",hud);
}

- (void)httpRequestCompleted:(ReqApiTag)tag data:(id)data message:(NSString *)message hud:(MBProgressHUD *)hud{
    NSLog(@"*******************success********************");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [MBProgressExpand ex_showSuccess:@"加载完成" hud:hud];
    });
    NSLog(@"%zi",tag);
    NSLog(@"%@",hud);
    NSLog(@"%@",data);
    NSLog(@"%@",message);

}
- (void)httpRequestError:(ReqApiTag)tag message:(NSString *)message hud:(MBProgressHUD *)hud{
    NSLog(@"*******************error********************");
    NSLog(@"%zi",tag);
    NSLog(@"%@",hud);
    NSLog(@"%@",message);

}


@end
