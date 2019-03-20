//
//  UIButton+Expand.h
//
//

#import <UIKit/UIKit.h>

@interface UIButton (Expand)



/**
 设置文字按钮
 
 @param frame 坐标位置
 @param title 按钮文字
 @param font 文字大小
 @param color 文字颜色
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                              Font:(UIFont *)font
                         TextColor:(UIColor *)color
                            Target:(id)target Action:(SEL)action;

/**
 设置带有背景图片，文字按钮
 
 @param frame 坐标位置
 @param title 按钮文字
 @param bcImg 按钮背景图片
 @param radius 切圆半径
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                             BcImg:(UIImage *)bcImg
                            Radius:(CGFloat)radius
                            Target:(id)target Action:(SEL)action;

/**
 设置图片按钮
 
 @param frame 坐标位置
 @param norImg 未点击时图片
 @param selImg 点击时图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                            NorImg:(UIImage *)norImg
                            selImg:(UIImage *)selImg
                            Target:(id)target Action:(SEL)action;

/**
 设置左边图片的文字按钮(文字靠右顶格)
 
 @param frame 坐标位置
 @param title 按钮文字
 @param norImg 未点击时图片
 @param selImg 点击时图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonRightWithFrame:(CGRect)frame
                                  Title:(NSString *)title
                                 NorImg:(UIImage *)norImg
                                 selImg:(UIImage *)selImg
                                 Target:(id)target Action:(SEL)action;


/**
 设置左边图片的文字按钮
 
 @param frame 坐标位置
 @param title 按钮文字
 @param norImg 未点击时图片
 @param selImg 点击后的图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                            NorImg:(UIImage *)norImg
                            selImg:(UIImage *)selImg
                            Target:(id)target Action:(SEL)action;

/**
 设置左边图片的文字按钮 可设置间隔距离
 
 @param frame 坐标位置
 @param title 按钮文字
 @param space 间距
 @param leftNorImg 未点击时图片
 @param leftSelImg 点击后的图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                             space:(CGFloat)space
                        leftNorImg:(UIImage *)leftNorImg
                        leftSelImg:(UIImage *)leftSelImg
                            Target:(id)target Action:(SEL)action;

/**
 设置右边图片的文字按钮
 
 @param frame 坐标位置
 @param title 按钮文字
 @param rightNorImg 未点击时图片
 @param rightSelImg 点击后的图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                       rightNorImg:(UIImage *)rightNorImg
                       rightSelImg:(UIImage *)rightSelImg
                            Target:(id)target Action:(SEL)action;

/**
 设置右边图片的文字按钮 可设置间隔距离
 
 @param frame 坐标位置
 @param title 按钮文字
 @param space 间距
 @param rightNorImg 未点击时图片
 @param rightSelImg 点击后的图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                             space:(CGFloat)space
                       rightNorImg:(UIImage *)rightNorImg
                       rightSelImg:(UIImage *)rightSelImg
                            Target:(id)target Action:(SEL)action;

/**
 设置上边图片下面文字按钮
 
 @param frame 坐标位置
 @param space 按钮之间间隔
 @param title 按钮文字
 @param topNorImg 未点击时图片
 @param topSelImg 点击后的图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             space:(CGFloat)space
                             Title:(NSString *)title
                         topNorImg:(UIImage *)topNorImg
                         topSelImg:(UIImage *)topSelImg
                            Target:(id)target Action:(SEL)action;

/**
 设置上边文字下面图片按钮
 
 @param frame 坐标位置
 @param title 按钮文字
 @param bottomNorImg 未点击时图片
 @param bottomSelImg 点击后的图片
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             space:(CGFloat)space
                             Title:(NSString *)title
                      bottomNorImg:(UIImage *)bottomNorImg
                      bottomSelImg:(UIImage *)bottomSelImg
                            Target:(id)target Action:(SEL)action;

/**
 设置带有文字、背景图片、图片的按钮
 
 @param frame 坐标位置
 @param title 按钮文字
 @param norImg 图片按钮
 @param bcImg 按钮背景图片
 @param radius 切圆半径
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithFrame:(CGRect)frame
                             Title:(NSString *)title
                            NorImg:(UIImage *)norImg
                             BcImg:(UIImage *)bcImg
                            Radius:(CGFloat)radius
                            Target:(id)target Action:(SEL)action;

/**
 设置带有文字大小、文字颜色、背景颜色的按钮
 
 @param title 按钮文字
 @param fontSize 文字大小
 @param textColor 文字颜色
 @param backColor 背景颜色
 @param target self
 @param action 点击事件
 @return UIbutton
 */
+ (instancetype)ex_buttonWithTitle:(NSString *)title
                          withFont:(CGFloat)fontSize
                         TextColor:(UIColor *)textColor
                         backColor:(UIColor *)backColor
                            Target:(id)target Action:(SEL)action;



- (void)ex_setTitle:(NSString *)title AndFont:(UIFont *)font AndTitleColor:(UIColor *)color;

/**
 *  设置按钮img 和 title 间距
 *
 *  @param distance 间距
 */
- (void)ex_setDistanceBetweenTitleAndImage:(CGFloat)distance ;

/**
 设置右边图片
 
 @param distance 间距
 */
- (void)ex_setRightImageDistance:(CGFloat)distance;

/***************************** 常用按钮样式 *****************************/
+ (instancetype)ex_defaultPurpleButtonWithFrame:(CGRect)frame
                                          Title:(NSString *)title
                                         Target:(id)target Action:(SEL)action;



/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;


@end
