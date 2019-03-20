//
//  CALayer+HZXIBBorderColor.m
//  WhichZha
//
//  Created by Hozonauto on 2018/12/12.
//  Copyright © 2018 MoBiyun. All rights reserved.
//

#import "CALayer+HZXIBBorderColor.h"
#import <UIKit/UIKit.h>

@implementation CALayer (HZXIBBorderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
