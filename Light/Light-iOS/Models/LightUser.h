//
//  LightUser.h
//  Light-iOS
//
//  Created by FLY on 15/5/31.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#define UID @"user_id"
#define NICKNAME @"name"
#define PASSWORD @"pwd"
#define PHYSIOLOGY_GENDER @"physiology_gender"
#define SOCIETY_GENDER @"society_gender"
#define CHECK_CODE @"val_code"

@interface LightUser : NSObject

@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSString *userNickname;
@property (nonatomic,strong) NSString *userPassword;
@property (nonatomic,strong) NSString *physiologyGender;
@property (nonatomic,strong) NSString *societyGender;
@property (nonatomic,strong) NSString *valCode;

+(NSInteger)returnUserId:(NSString *)registerNum;





-(NSDictionary*)toDictionary;
+(LightUser *)userFromDictionary:(NSDictionary*)aDic;
@end
