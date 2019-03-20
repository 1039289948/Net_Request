//
//  HZTextViewPlaceHolder.h
//  WhichZha
//
//  Created by Hozonauto on 2018/12/13.
//  Copyright © 2018 MoBiyun. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZTextViewPlaceHolder : UITextView

///占位文字
@property (nonatomic, copy) NSString *placeholder;
///占位文字颜色
@property (nonatomic, strong) UIColor *placeholderColor;

@end

NS_ASSUME_NONNULL_END
