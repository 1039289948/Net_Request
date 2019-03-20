//
//  UIImage+Expand.h
//

#import <UIKit/UIKit.h>

@interface UIImage (Expand)

+ (instancetype)ex_getImageWithName:(NSString *)name EdgeInsets:(UIEdgeInsets)edgeInsets;

- (instancetype)ex_getImageWithEdgeInsets:(UIEdgeInsets)edgeInsets;

/** 调整图片方向为Up */
- (instancetype)ex_adjustImageOrientationUp;

/**
 图片压缩指定大小
 */
+ (UIImage *)ex_compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength;

@end
