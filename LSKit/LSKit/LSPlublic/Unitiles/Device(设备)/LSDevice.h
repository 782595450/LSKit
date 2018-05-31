//
//  LSDevice.h
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSDevice : NSObject

+ (NSString *)uuid;

+ (CGFloat)getSystemVersion;

+ (NSString *)getDevicePlatform;//硬件型号

+ (NSString *)getCurrentDate;

+ (NSString *)getAPPVersion;//app version

+ (NSString *)getBundleVersion;//app build

//+ (NSString *)getIdfa;//idfa

+ (NSString *)getIdfv;//idfv

+ (BOOL)afterIOS7;

+ (BOOL)isIOS7;

+ (BOOL)isIOS8;

+ (BOOL)isIOS9;

+ (BOOL)isIOS11;

+ (BOOL)isIPhone4;

+ (BOOL)isIPhone5;

+ (BOOL)isIPhone6;

+ (BOOL)isIPhone6p;

+ (BOOL)isIPhoneX;

@end
