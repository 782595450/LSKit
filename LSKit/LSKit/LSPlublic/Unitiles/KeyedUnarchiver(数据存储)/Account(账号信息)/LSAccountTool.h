//
//  LSAccountTool.h
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LSAccountModel.h"


@interface LSAccountTool : NSObject
/**
 *  存储账号信息与刷新
 *
 *  @param account 需要存储的账号
 */
+ (BOOL)saveLSAccount:(LSAccountModel *)account;

/**
 *  返回存储的账号信息
 */
+ (LSAccountModel *)getLSAccount;

/**
 *  删除本地账号信息
 */
+ (BOOL)deleteLSAccount;

@end
