//
//  LSLanguage.h
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import <Foundation/Foundation.h>

// 国际化
#define LSAppLanguage @"ls_applanguage"

#define LSLanguage(key) \
({\
NSString *lang = [[NSUserDefaults standardUserDefaults] objectForKey:@"ls_applanguage"];\
static NSMutableDictionary *bundles = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
bundles = [NSMutableDictionary new];\
bundles[@"zh-Hant"] = [NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:@"zh-Hant" ofType:@"lproj"]];\
bundles[@"en"] = [NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:@"en" ofType:@"lproj"]];\
bundles[@"zh-Hans"] = [NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:@"zh-Hans" ofType:@"lproj"]];\
bundles[@"fr"] = [NSBundle bundleWithPath:[[NSBundle mainBundle]pathForResource:@"fr" ofType:@"lproj"]];\
});\
NSBundle *bundle = nil;\
if (lang) {\
bundle = bundles[lang];\
} else {\
bundle = [NSBundle mainBundle];\
}\
NSString *value = [bundle localizedStringForKey:key value:nil table:@"Localizable"];\
(value);\
})\

@interface LSLanguage : NSObject

// 初始化多语言
+ (void)initLanguge;

// 判断是否是中文
+ (BOOL)isChina;

// 设置简体中文
+ (void)setzhHansLanguge;

// 设置繁体中文
+ (void)setzhHanLanguge;

// 设置英文
+ (void)setenLanguge;

// 设置法文
+ (void)setfrLanguge;


@end
