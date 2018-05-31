//
//  LSAccountTool.m
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import "LSAccountTool.h"
#import "LSFileDirectoryHeader.h"


@implementation LSAccountTool

+ (BOOL)saveLSAccount:(LSAccountModel *)account{
    [self createAccountFile];
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
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:LSAccountFile]) {
        return NO;
    }else{
        return [[NSFileManager defaultManager] removeItemAtPath:LSAccountFile error:nil];
    }
    
}

// 创建账号保存地址
+ (void)createAccountFile{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:LSAccountFile]) {
        [fileManager createDirectoryAtPath:LSAccountFile withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
}

@end
