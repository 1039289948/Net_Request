//
//  UILabel+Expand.m
//

#import "UILabel+Expand.h"

@implementation UILabel (Expand)

+ (instancetype)ex_labelWithFrame:(CGRect)frame Text:(NSString *)text TextColor:(UIColor *)textColor TextAlignment:(NSTextAlignment)textAlignment Font:(UIFont *)font{
    
    UILabel *label      = [[[self class] alloc] initWithFrame:frame];
    label.text          = text;
    label.textColor     = textColor;
    label.textAlignment = textAlignment;
    label.font          = font;
    
    return label;
}

- (void)ex_setLineSpacing:(CGFloat)lineSpacing{
    NSMutableAttributedString *attStr = [self.attributedText mutableCopy];
    
    if (attStr == nil && self.text)
        attStr = [[NSMutableAttributedString alloc] initWithString:self.text];
    
    if (!attStr) 
        return;
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment                = self.textAlignment;
    
    [style setLineSpacing:lineSpacing];
    
    [attStr addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, self.text.length)];
    
    self.attributedText = attStr;
}

- (void)ex_setTextColor:(UIColor *)color AndFont:(UIFont *)font {
    self.textColor = color;
    self.font      = font;
}

-(void)ex_setSpacingFont:(UIFont*)font fontSpacing:(CGFloat)fontSpacing lineSpacing:(CGFloat)lineSpacing textColor:(UIColor *)textColor {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = self.textAlignment;
    if (lineSpacing > 0) {
        paraStyle.lineSpacing = lineSpacing; //设置行间距
    }
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@(fontSpacing), NSForegroundColorAttributeName:textColor};
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:self.text attributes:dic];
    self.attributedText = attributeStr;
}

- (void)ex_setRichTextWith:(NSString *)image textLable:(NSString *)string {
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:string];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    // 表情图片
    attch.image = [UIImage imageNamed:image];
    // 设置图片大小
    attch.bounds = CGRectMake(0, 0, 13, 12);
    // 创建带有图片的富文本
    NSAttributedString *str = [NSAttributedString attributedStringWithAttachment:attch];
    //    [attri appendAttributedString:string]; //在文字后面添加图片
    //在文字下标第几个添加图片  0就是文字前面添加图片
    [attri insertAttributedString:str atIndex:0];
    // 用label的attributedText属性来使用富文本
    self.attributedText = attri;
}
@end
