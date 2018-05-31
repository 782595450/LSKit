//
//  LSAccountTool.m
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import "LSAccountTool.h"

//账号保存地址
#define LSAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"LSAccount.data"]

@implementation LSAccountTool

+ (BOOL)saveLSAccount:(LSAccountModel *)account{
    return  [NSKeyedArchiver archiveRootObject:account toFile:LSAccountFile];
    
}

+ (LSAccountModel *)getLSAccount{
    // 取出账号
    @try {
        LSAccountModel *account = [NSKeyedUnarchiver unarchiveObjectWithFile:LSAccountFile];
        return account;
    }
    @catch (NSException *exception) {
        NSLog(@"==异常");
        return nil;
    }
    @finally {
    }
    
}

+ (BOOL)deleteLSAccount{
    if (!LSAccountFile) {
        return NO;
    }else{
        return [[NSFileManager defaultManager] removeItemAtPath:LSAccountFile error:nil];
    }
    
}

@end
