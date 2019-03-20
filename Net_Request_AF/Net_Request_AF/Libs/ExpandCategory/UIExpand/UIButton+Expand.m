//
//  UIButton+Expand.m
//
//

#import "UIButton+Expand.h"
#import "UIColor+Expand.h"

@implementation UIButton (Expand)


+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                              Font:(UIFont *)font
                         TextColor:(UIColor *)color
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn = [[self class] buttonWithType:UIButtonTypeCustom];
    
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    
    btn.titleLabel.font = font;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame Title:(NSString *)title BcImg:(UIImage *)bcImg Radius:(CGFloat)radius Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:15];
    
    btn.layer.cornerRadius = radius;
    btn.layer.masksToBounds= true;
    
    [btn setBackgroundImage:bcImg forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                            NorImg:(UIImage *)norImg
                            selImg:(UIImage *)selImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:norImg forState:UIControlStateNormal];
    [btn setImage:selImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor ex_couponTitleFontColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12];
    btn.adjustsImageWhenHighlighted = false;
    if (action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    
    return btn;
}

+ (instancetype)ex_buttonRightWithFrame:(CGRect)frame
                                  Title:(NSString *)title
                                 NorImg:(UIImage *)norImg
                                 selImg:(UIImage *)selImg
                                 Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:norImg forState:UIControlStateNormal];
    [btn setImage:selImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.adjustsImageWhenHighlighted = false;
    
    CGFloat imageWith = btn.imageView.frame.size.width;
    CGFloat labelWidth = btn.titleLabel.bounds.size.width;
    
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, imageWith, 0, -(btn.frame.size.width - labelWidth - 22));
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, imageWith, 0, -(labelWidth - imageWith - 22));
    
    btn.titleLabel.textAlignment = NSTextAlignmentRight;
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                            NorImg:(UIImage *)norImg
                            selImg:(UIImage *)selImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:norImg forState:UIControlStateNormal];
    [btn setImage:selImg forState:UIControlStateSelected];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:15];
    [btn ex_setDistanceBetweenTitleAndImage:5];
    
    btn.adjustsImageWhenHighlighted = false;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                             space:(CGFloat)space
                        leftNorImg:(UIImage *)leftNorImg
                        leftSelImg:(UIImage *)leftSelImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:leftNorImg forState:UIControlStateNormal];
    [btn setImage:leftSelImg forState:UIControlStateSelected];
    
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:15];
    [btn ex_setDistanceBetweenTitleAndImage:5];
    
    btn.adjustsImageWhenHighlighted = false;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn ex_setDistanceBetweenTitleAndImage:space];
    
    return btn;
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                       rightNorImg:(UIImage *)rightNorImg
                       rightSelImg:(UIImage *)rightSelImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:rightNorImg forState:UIControlStateNormal];
    [btn setImage:rightSelImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:15];
    btn.adjustsImageWhenHighlighted = false;
    
    CGFloat imageWidth = btn.imageView.bounds.size.width;
    CGFloat labelWidth = btn.titleLabel.bounds.size.width;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth, 0, -labelWidth);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                             space:(CGFloat)space
                       rightNorImg:(UIImage *)rightNorImg
                       rightSelImg:(UIImage *)rightSelImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:rightNorImg forState:UIControlStateNormal];
    [btn setImage:rightSelImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:15];
    btn.adjustsImageWhenHighlighted = false;
    
    CGFloat imageWidth = btn.imageView.bounds.size.width;
    CGFloat labelWidth = btn.titleLabel.bounds.size.width;
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space / 2, 0, -labelWidth);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth + space / 2);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}



+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             space:(CGFloat)space
                             Title:(NSString *)title
                         topNorImg:(UIImage *)topNorImg
                         topSelImg:(UIImage *)topSelImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:topNorImg forState:UIControlStateNormal];
    [btn setImage:topSelImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:14];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    btn.adjustsImageWhenHighlighted = false;
    
    CGFloat imageWith = btn.imageView.frame.size.width;
    CGFloat imageHeight = btn.imageView.frame.size.height;
    CGFloat labelWidth = btn.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = btn.titleLabel.intrinsicContentSize.height;
    
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             space:(CGFloat)space
                             Title:(NSString *)title
                      bottomNorImg:(UIImage *)bottomNorImg
                      bottomSelImg:(UIImage *)bottomSelImg
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    
    [btn setImage:bottomNorImg forState:UIControlStateNormal];
    [btn setImage:bottomSelImg forState:UIControlStateSelected];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:14];
    btn.adjustsImageWhenHighlighted = false;
    
    
    CGFloat imageWith = btn.imageView.frame.size.width;
    CGFloat imageHeight = btn.imageView.frame.size.height;
    CGFloat labelWidth = btn.titleLabel.intrinsicContentSize.width;
    CGFloat labelHeight = btn.titleLabel.intrinsicContentSize.height;
    
    
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
    btn.titleEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
    
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return btn;
    
}



+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                            NorImg:(UIImage *)norImg
                             BcImg:(UIImage *)bcImg
                            Radius:(CGFloat)radius
                            Target:(id)target Action:(SEL)action{
    
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:15];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    btn.layer.cornerRadius = radius;
    btn.layer.masksToBounds= true;
    
    [btn setImage:norImg forState:UIControlStateNormal];
    [btn setBackgroundImage:bcImg forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}

- (void)ex_setTitle:(NSString *)title AndFont:(UIFont *)font AndTitleColor:(UIColor *)color{
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateNormal];
    
    self.titleLabel.font = font;
}

- (void)ex_setDistanceBetweenTitleAndImage:(CGFloat)distance {
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, distance/2.f)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, distance/2.f, 0, 0)];
}

#pragma mark - 默认按钮样式
+ (instancetype)ex_defaultPurpleButtonWithFrame:(CGRect)frame
                                          Title:(NSString *)title
                                         Target:(id)target Action:(SEL)action{
    UIButton *btn          = [[self class] buttonWithType:UIButtonTypeCustom];
    [btn setFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font    = [UIFont systemFontOfSize:14];
    btn.adjustsImageWhenHighlighted = false;
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}


+ (instancetype)ex_buttonWithTitle:(NSString *)title withFont:(CGFloat)fontSize TextColor:(UIColor *)textColor backColor:(UIColor *)backColor Target:(id)target Action:(SEL)action{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:title forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn setBackgroundColor:backColor forState:UIControlStateNormal];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


- (void)ex_setRightImageDistance:(CGFloat)distance{
    
    CGFloat imageWidth = self.imageView.bounds.size.width;
    CGFloat labelWidth = self.titleLabel.bounds.size.width;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + distance / 2, 0, -labelWidth);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth + distance / 2);
}

/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    [self setBackgroundImage:[UIButton jk_b_imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)jk_b_imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
