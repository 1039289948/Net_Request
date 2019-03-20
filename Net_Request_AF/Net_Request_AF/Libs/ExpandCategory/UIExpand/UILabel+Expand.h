//
//  UILabel+Expand.h
//

#import <UIKit/UIKit.h>

@interface UILabel (Expand)

/**
 *  生成Label
 */
+ (instancetype)ex_labelWithFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)textColor TextAlignment:(NSTextAlignment)textAlignment Font:(UIFont *)font;


/**
 *  设置行间距
 */
- (void)ex_setLineSpacing:(CGFloat)lineSpacing;

- (void)ex_setTextColor:(UIColor *)color AndFont:(UIFont *)font;

/**
 设置行间距、字间距

 @param font 字体大小
 @param fontSpacing 字间距
 @param lineSpacing 行间距
 @param textColor 字体颜色
 */
-(void)ex_setSpacingFont:(UIFont*)font fontSpacing:(CGFloat)fontSpacing lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor;

/**
 富文本显示  图片放在第一位
 @param image 图片
 @param string 文字描述
 */
- (void)ex_setRichTextWith:(NSString *)image textLable:(NSString *)string;

@end
