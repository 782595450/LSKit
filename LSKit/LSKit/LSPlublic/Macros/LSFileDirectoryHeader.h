//
//  LSFileDirectoryHeader.h
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#define LSDocumentsURL        [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]
#define LSDocumentsPath       [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define LSCachesURL           [[[NSFileManager defaultManager] URLsForDirectory:NSCachesDirectory inDomains:NSUserDomainMask] lastObject]
#define LSCachesPath          [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
#define LSLibraryURL          [[[NSFileManager defaultManager] URLsForDirectory:NSLibraryDirectory inDomains:NSUserDomainMask] lastObject]
#define LSLibraryPath         [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject]


// 账号保存地址
#define LSAccountFile [LSDocumentsPath stringByAppendingPathComponent:@"LSAccount.data"]
