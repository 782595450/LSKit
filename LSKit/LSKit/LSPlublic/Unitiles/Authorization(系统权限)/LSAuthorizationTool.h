//
//  LSAuthorizationTool.h
//  LSKit
//
//  Created by 赖双全 on 2018/10/24.
//  Copyright © 2018 Price Lai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LSAuthorizationStatus) {
    LSAuthorizationStatusAuthorized = 0, //用户已授权
    LSAuthorizationStatusDenied,         //拒绝
    LSAuthorizationStatusRestricted,     //应用没有相关权限，且当前用户无法改变这个权限，如家长控制
    LSAuthorizationStatusNotSupport      //硬件等不支持
};

typedef NS_ENUM(NSUInteger, LSMediaType) {
    LSMediaTypeAlbum = 0,    //相册
    LSMediaTypeCamera,       //相机
    LSMediaTypeAddressBook   //通讯录
};


@interface LSAuthorizationTool : NSObject

/**
 请求相册访问权限
 
 @param callback <callback description>
 */
+ (void)requestImagepickerAuthorization:(void(^)(LSAuthorizationStatus status))callback;


/**
 请求相机权限
 
 @param callback <callback description>
 */
+ (void)requestCameraAuthorization:(void(^)(LSAuthorizationStatus status))callback;


/**
 请求通讯录权限
 
 @param callback <callback description>
 */
+ (void)requestAddressBookAuthorization:(void(^)(LSAuthorizationStatus status))callback;


/**
 请求录音权限
 
 @param callback <callback description>
 */
+ (void)requestRecordAuthorization:(void(^)(LSAuthorizationStatus))callback;

@end

NS_ASSUME_NONNULL_END
