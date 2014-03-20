//
//  NBUser.m
//  iCareer
//
//  Created by YANGRui on 14-3-20.
//  Copyright (c) 2014年 andy. All rights reserved.
//

#import "NBUser.h"

@implementation NBUser

- (id)initWithData:(id)data
{
    self = [super init];
    if (self)
    {
        NSDictionary *dict = (NSDictionary *)data;
        self.uid = [dict stringAttribute:@"uid"];
        self.password = [dict stringAttribute:@"password"];
        self.secondPassword = [dict stringAttribute:@"secondPassword"];
        self.name = [dict stringAttribute:@"name"];
        self.firstName = [dict stringAttribute:@"firstName"];
        self.lastName = [dict stringAttribute:@"lastName"];
        self.nick = [dict stringAttribute:@"nick"];
        self.englishName = [dict stringAttribute:@"englishName"];
        self.gender = [dict stringAttribute:@"gender"];
        self.tel = [dict stringAttribute:@"tel"];
        self.mobile = [dict stringAttribute:@"mobile"];
        self.email = [dict stringAttribute:@"email"];
        self.qq = [dict stringAttribute:@"qq"];
        self.wechat = [dict stringAttribute:@"wechat"];
        self.idCard = [dict stringAttribute:@"idCard"];
        self.registerDate = [dict stringAttribute:@"registerDate"];
        self.isLocked = [dict stringAttribute:@"isLocked"];
        self.lockStartDate = [dict stringAttribute:@"lockStartDate"];
        self.lockDate = [dict stringAttribute:@"lockDate"];
        self.lockMessage = [dict stringAttribute:@"lockMessage"];
        self.isTest = [dict stringAttribute:@"isTest"];
        self.sortID = [dict stringAttribute:@"sortID"];
        self.pinyin = [dict stringAttribute:@"pinyin"];
        self.comment = [dict stringAttribute:@"comment"];
        self.userVersion = [dict stringAttribute:@"userVersion"];
        
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_password forKey:@"password"];
    [aCoder encodeObject:_secondPassword forKey:@"secondPassword"];
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeObject:_firstName forKey:@"firstName"];
    [aCoder encodeObject:_lastName forKey:@"lastName"];
    [aCoder encodeObject:_nick forKey:@"nick"];
    [aCoder encodeObject:_englishName forKey:@"englishName"];
    [aCoder encodeObject:_gender forKey:@"gender"];
    [aCoder encodeObject:_tel forKey:@"tel"];
    [aCoder encodeObject:_mobile forKey:@"mobile"];
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_qq forKey:@"qq"];
    [aCoder encodeObject:_wechat forKey:@"wechat"];
    [aCoder encodeObject:_idCard forKey:@"idCard"];
    [aCoder encodeObject:_registerDate forKey:@"registerDate"];
    [aCoder encodeObject:_isLocked forKey:@"isLocked"];
    [aCoder encodeObject:_lockDate forKey:@"lockDate"];
    [aCoder encodeObject:_lockStartDate forKey:@"lockStartDate"];
    [aCoder encodeObject:_lockMessage forKey:@"lockMessage"];
    [aCoder encodeObject:_isTest forKey:@"isTest"];
    [aCoder encodeObject:_sortID forKey:@"sortID"];
    [aCoder encodeObject:_pinyin forKey:@"pinyin"];
    [aCoder encodeObject:_comment forKey:@"comment"];
    [aCoder encodeObject:_userVersion forKey:@"userVersion"];
    
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        self.uid = [aDecoder decodeObjectForKey:@"uid"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.secondPassword =[aDecoder decodeObjectForKey:@"secondPassword"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.firstName = [aDecoder decodeObjectForKey:@"firstName"];
        self.lastName = [aDecoder decodeObjectForKey:@"lastName"];
        self.nick = [aDecoder decodeObjectForKey:@"nick"];
        self.englishName =[aDecoder decodeObjectForKey:@"englishName"];
        self.gender =[aDecoder decodeObjectForKey:@"gender"];
        self.tel = [aDecoder decodeObjectForKey:@"tel"];
        self.mobile = [aDecoder decodeObjectForKey:@"mobile"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.qq = [aDecoder decodeObjectForKey:@"qq"];
        self.wechat = [aDecoder decodeObjectForKey:@"wechat"];
        self.idCard = [aDecoder decodeObjectForKey:@"idCard"];
        self.registerDate = [aDecoder decodeObjectForKey:@"registerDate"];
        self.isLocked = [aDecoder decodeObjectForKey:@"isLocked"];
        self.lockDate = [aDecoder decodeObjectForKey:@"lockDate"];
        self.lockStartDate = [aDecoder decodeObjectForKey:@"lockStartDate"];
        self.lockMessage = [aDecoder decodeObjectForKey:@"lockMessage"];
        self.isTest = [aDecoder decodeObjectForKey:@"isTest"];
        self.sortID = [aDecoder decodeObjectForKey:@"sortID"];
        self.pinyin = [aDecoder decodeObjectForKey:@"pinyin"];
        self.comment = [aDecoder decodeObjectForKey:@"comment"];
        self.userVersion =[aDecoder decodeObjectForKey:@"userVersion"];

        
    }
    return self;
}




@end
