//
//  LSKitMacros.h
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//


//机型
#define LSiPhone5  ([LSDevice isIPhone5])    //是否是IPhone5
#define LSiPhone6  ([LSDevice isIPhone6])    //是否是IPhone6
#define LSiPhone6p ([LSDevice isIPhone6p])   //是否是IPhone6p
#define LSiPhoneX  ([LSDevice isIPhoneX])    //是否是IPhoneX
#define LSiOS11    ([LSDevice isIOS11])      //是否是iOS11

// 弱引用
#define LSWeakSelf      __weak typeof(self) _weak = self;
#define LSStrongSelf    __strong typeof(_weak) self = _weak;

#define LSWeakify(type)     __weak typeof(type) weak##_##type = type;
#define LSStrongify(type)   __strong typeof(weak##_##type) type = weak##_##type;

// 系统
#define LSUserDefaults     (NSUserDefaults *)[NSUserDefaults standardUserDefaults]
#define LSAppDelegate      ((AppDelegate *)[[UIApplication sharedApplication] delegate])
#define LSNavigationHeight iPhoneX ? 88 : 64
#define LSTabbarHeight     iPhoneX ? 83 : 49
#define LSBottomHeight     iPhoneX ? 34 : 0

#define LSScreenWidth  [UIScreen mainScreen].bounds.size.width
#define LSScreenHeight [UIScreen mainScreen].bounds.size.height

#define LSScreen_Scale LSScreenWidth / 375.000000
#define LSScale(x)     LSScreen_Scale * x







