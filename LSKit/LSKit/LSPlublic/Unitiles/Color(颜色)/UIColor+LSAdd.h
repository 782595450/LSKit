//
//  UIColor+LSAdd.h
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LSAdd)

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue;

+ (UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha;

+ (UIColor *)colorWithRGBA:(uint32_t)rgbaValue;

@end
