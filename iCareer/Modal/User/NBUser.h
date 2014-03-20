//
//  NBUser.h
//  iCareer
//
//  Created by YANGRui on 14-3-20.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NBUser : NSObject<NSCoding>
@property (copy ,nonatomic) NSString *uid;
@property (copy ,nonatomic) NSString *password;
@property (copy ,nonatomic) NSString *secondPassword;
@property (copy ,nonatomic) NSString *name;
@property (copy ,nonatomic) NSString *firstName;
@property (copy ,nonatomic) NSString *lastName;
@property (copy ,nonatomic) NSString *nick;
@property (copy ,nonatomic) NSString *englishName;
@property (copy ,nonatomic) NSString *gender;
@property (copy ,nonatomic) NSString *tel;
@property (copy ,nonatomic) NSString *mobile;
@property (copy ,nonatomic) NSString *email;
@property (copy ,nonatomic) NSString *qq;
@property (copy ,nonatomic) NSString *wechat;
@property (copy ,nonatomic) NSString *idCard;
@property (copy ,nonatomic) NSString *registerDate;
@property (copy ,nonatomic) NSString *isLocked;
@property (copy ,nonatomic) NSString *lockStartDate;
@property (copy ,nonatomic) NSString *lockDate;
@property (copy ,nonatomic) NSString *lockMessage;
@property (copy ,nonatomic) NSString *isTest;
@property (copy ,nonatomic) NSString *sortID;
@property (copy ,nonatomic) NSString *pinyin;
@property (copy ,nonatomic) NSString *comment;
@property (copy ,nonatomic) NSString *userVersion;

- (id)initWithData:(id)data;

@end
