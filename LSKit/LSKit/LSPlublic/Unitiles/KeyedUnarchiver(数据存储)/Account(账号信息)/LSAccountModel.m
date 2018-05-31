//
//  LSAccountModel.m
//  LSKit
//
//  Created by Apple on 2018/5/31.
//  Copyright © 2018年 Price Lai. All rights reserved.
//

#import "LSAccountModel.h"

@implementation LSAccountModel

/**
 *  从文件中解析对象的时候调
 */
-(id)initWithCoder:(NSCoder *)decoder{
    if (self = [super init]) {
        self.username              = [decoder decodeObjectForKey:@"username"];
        self.uid                   = [decoder decodeObjectForKey:@"uid"];
        self.token                 = [decoder decodeObjectForKey:@"token"];
        
    }
    return self;
}
/**
 *  将对象写入文件的时候调用
 */
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.username forKey:@"username"];
    [aCoder encodeObject:self.uid forKey:@"uid"];
    [aCoder encodeObject:self.token forKey:@"token"];
}

@end
