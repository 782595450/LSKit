//
//  LSLanguage.m
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import "LSLanguage.h"
#import "LSKitMacros.h"

@implementation LSLanguage

// 初始化多语言
+ (void)initLanguge{
    NSArray *languages = [LSUserDefaults objectForKey:@"AppleLanguages"];
    NSString *preferredLang = [languages objectAtIndex:0];
    id  applanguage = [LSUserDefaults valueForKey:LSAppLanguage];
    if (applanguage == nil) {
        if ([preferredLang isEqualToString:@"zh-Hans-CN"]){
            // 简体中文
            [LSUserDefaults setValue:@"zh-Hans" forKey:LSAppLanguage];
            [LSUserDefaults synchronize];
        }else if ([preferredLang isEqualToString:@"zh-Hant-CN"]){
            // 繁体中文
            [LSUserDefaults setValue:@"zh-Hant" forKey:LSAppLanguage];
            [LSUserDefaults synchronize];
        }else if ([preferredLang isEqualToString:@"fr"]){
            // 法文
            [LSUserDefaults setValue:@"fr" forKey:LSAppLanguage];
            [LSUserDefaults synchronize];
        }else{
            // 英文
            [LSUserDefaults setValue:@"en" forKey:LSAppLanguage];
        }
    }

}

// 判断是否是中文
+ (BOOL)isChina{
    NSString *language = [LSUserDefaults objectForKey:LSAppLanguage];
    if ([language hasPrefix:@"zh"]) {
        return YES;
    }else{
        return NO;
    }
}

// 设置简体中文
+ (void)setzhHansLanguge{
    [LSUserDefaults setObject:@"zh-Hans" forKey:LSAppLanguage];
    [LSUserDefaults synchronize];

}

// 设置繁体中文
+ (void)setzhHanLanguge{
    [LSUserDefaults setObject:@"zh-Hant" forKey:LSAppLanguage];
    [LSUserDefaults synchronize];
    
}

// 设置英文
+ (void)setenLanguge{
    [LSUserDefaults setObject:@"en" forKey:LSAppLanguage];
    [LSUserDefaults synchronize];
    
}

// 设置法文
+ (void)setfrLanguge{
    [LSUserDefaults setObject:@"fr" forKey:LSAppLanguage];
    [LSUserDefaults synchronize];
    
}




@end
