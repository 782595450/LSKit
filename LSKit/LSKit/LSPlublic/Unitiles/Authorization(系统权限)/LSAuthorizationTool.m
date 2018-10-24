//
//  LSAuthorizationTool.m
//  LSKit
//
//  Created by 赖双全 on 2018/10/24.
//  Copyright © 2018 Price Lai. All rights reserved.
//

#import "LSAuthorizationTool.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <Contacts/Contacts.h>


@implementation LSAuthorizationTool

#pragma mark - 相册
+ (void)requestImagepickerAuthorization:(void (^)(LSAuthorizationStatus))callback
{
    
    //检查设备是否支持
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] || [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        
        PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
        if (authStatus == PHAuthorizationStatusNotDetermined) {   //未授权
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) {
                    [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
                } else if (status == PHAuthorizationStatusDenied) {
                    [self executeCallback:callback status:LSAuthorizationStatusDenied];
                } else if (status == PHAuthorizationStatusRestricted) {
                    [self executeCallback:callback status:LSAuthorizationStatusRestricted];
                }
            }];
        } else if (authStatus == PHAuthorizationStatusAuthorized) {
            [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
        } else if (authStatus == PHAuthorizationStatusDenied) {
            [self executeCallback:callback status:LSAuthorizationStatusDenied];
        } else if (authStatus == PHAuthorizationStatusRestricted) {
            [self executeCallback:callback status:LSAuthorizationStatusRestricted];
        }
    } else {
        [self executeCallback:callback status:LSAuthorizationStatusNotSupport];
    }
    
}
#pragma mark - 相机
+ (void)requestCameraAuthorization:(void (^)(LSAuthorizationStatus))callback
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
                } else {
                    [self executeCallback:callback status:LSAuthorizationStatusDenied];
                }
            }];
        } else if (authStatus == AVAuthorizationStatusAuthorized) {
            [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
        } else if (authStatus == AVAuthorizationStatusDenied) {
            [self executeCallback:callback status:LSAuthorizationStatusDenied];
        } else if (authStatus == AVAuthorizationStatusRestricted) {
            [self executeCallback:callback status:LSAuthorizationStatusRestricted];
        }
    } else {
        [self executeCallback:callback status:LSAuthorizationStatusNotSupport];
    }
}

#pragma mark - 通讯录

+ (void)requestAddressBookAuthorization:(void (^)(LSAuthorizationStatus))callback
{
    CNAuthorizationStatus authStatus = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if (authStatus == CNAuthorizationStatusNotDetermined) {
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        [contactStore requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
            if (granted) {
                [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
            } else {
                [self executeCallback:callback status:LSAuthorizationStatusDenied];
            }
        }];
    } else if (authStatus == CNAuthorizationStatusAuthorized) {
        [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
    } else if (authStatus == CNAuthorizationStatusDenied) {
        [self executeCallback:callback status:LSAuthorizationStatusDenied];
    } else if (authStatus == CNAuthorizationStatusRestricted) {
        [self executeCallback:callback status:LSAuthorizationStatusRestricted];
    }
}

#pragma mark - 录音
+ (void)requestRecordAuthorization:(void(^)(LSAuthorizationStatus))callback
{
    AVAudioSession *session = [AVAudioSession sharedInstance];
    AVAudioSessionRecordPermission permission = session.recordPermission;
    if (permission == AVAudioSessionRecordPermissionUndetermined) {
        [session requestRecordPermission:^(BOOL granted) {
            if (granted) {
                [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
            } else {
                [self executeCallback:callback status:LSAuthorizationStatusDenied];
            }
        }];
    } else if (permission == AVAudioSessionRecordPermissionGranted) {
        [self executeCallback:callback status:LSAuthorizationStatusAuthorized];
    } else if (permission == AVAudioSessionRecordPermissionDenied) {
        [self executeCallback:callback status:LSAuthorizationStatusDenied];
    }
}

#pragma mark - callback
+ (void)executeCallback:(void (^)(LSAuthorizationStatus))callback status:(LSAuthorizationStatus)status
{
    dispatch_async(dispatch_get_main_queue(), ^{
        if (callback) {
            callback(status);
        }
    });
}

@end
