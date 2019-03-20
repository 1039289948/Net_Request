//
//  UIImage+Expand.m
//

#import "UIImage+Expand.h"

@implementation UIImage (Expand)

+ (instancetype)ex_getImageWithName:(NSString *)name EdgeInsets:(UIEdgeInsets)edgeInsets{
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:edgeInsets];
    
    return image;
}

- (instancetype)ex_getImageWithEdgeInsets:(UIEdgeInsets)edgeInsets{
    UIImage *img = [self resizableImageWithCapInsets:edgeInsets];
    return img;
}

- (instancetype)ex_adjustImageOrientationUp{
    
    // 图片处理
    if (self.imageOrientation != UIImageOrientationUp)
    {
        CGAffineTransform transform = CGAffineTransformIdentity;
        switch (self.imageOrientation) {
            case UIImageOrientationDown:
            case UIImageOrientationDownMirrored:
                transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
                transform = CGAffineTransformRotate(transform, M_PI);
                break;
                
            case UIImageOrientationLeft:
            case UIImageOrientationLeftMirrored:
                transform = CGAffineTransformTranslate(transform, self.size.width, 0);
                transform = CGAffineTransformRotate(transform, M_PI_2);
                break;
                
            case UIImageOrientationRight:
            case UIImageOrientationRightMirrored:
                transform = CGAffineTransformTranslate(transform, 0, self.size.height);
                transform = CGAffineTransformRotate(transform, -M_PI_2);
                break;
            case UIImageOrientationUp:
            case UIImageOrientationUpMirrored:
                break;
        }
        
        switch (self.imageOrientation) {
            case UIImageOrientationUpMirrored:
            case UIImageOrientationDownMirrored:
                transform = CGAffineTransformTranslate(transform, self.size.width, 0);
                transform = CGAffineTransformScale(transform, -1, 1);
                break;
                
            case UIImageOrientationLeftMirrored:
            case UIImageOrientationRightMirrored:
                transform = CGAffineTransformTranslate(transform, self.size.height, 0);
                transform = CGAffineTransformScale(transform, -1, 1);
                break;
            case UIImageOrientationUp:
            case UIImageOrientationDown:
            case UIImageOrientationLeft:
            case UIImageOrientationRight:
                break;
        }
        
        CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                                 CGImageGetBitsPerComponent(self.CGImage), 0,
                                                 CGImageGetColorSpace(self.CGImage),
                                                 CGImageGetBitmapInfo(self.CGImage));
        CGContextConcatCTM(ctx, transform);
        switch (self.imageOrientation) {
            case UIImageOrientationLeft:
            case UIImageOrientationLeftMirrored:
            case UIImageOrientationRight:
            case UIImageOrientationRightMirrored:
                CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
                break;
                
            default:
                CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
                break;
        }
        
        CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
        UIImage *img = [UIImage imageWithCGImage:cgimg];
        CGContextRelease(ctx);
        CGImageRelease(cgimg);
        
        return img;
    }
    
    return self;
}

+ (UIImage *)ex_compressImageSize:(UIImage *)image toByte:(NSUInteger)maxLength {
    UIImage *resultImage = image;
    NSData *data = UIImageJPEGRepresentation(resultImage, 1);
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        // Use image to draw (drawInRect:), image is larger but more compression time
        // Use result image to draw, image is smaller but less compression time
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, 1);
        
    }
    return resultImage;
}


@end
