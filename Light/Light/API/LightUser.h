//
//  LightUser.h
//  
//
//  Created by FLY on 15/6/14.
//
//

#import <Foundation/Foundation.h>

@interface LightUser : NSObject

@property (nonatomic,readwrite,assign) int64_t userID;
@property (nonatomic,readwrite,copy) NSString *name;
@property (nonatomic,readwrite,copy) NSString *avatar;
@property (nonatomic,readwrite,copy) NSString *region;
@property (nonatomic,readwrite,copy) NSString *physiology_gender;
@property (nonatomic,readwrite,copy) NSString *society_gender;
@property (nonatomic,readwrite,copy) NSString *hometown;
@property (nonatomic,readwrite,copy) NSString *faith;
@property (nonatomic,readwrite,copy) NSString *skill;
@property (nonatomic,readwrite,copy) NSString *edu;
@property (nonatomic,readwrite,copy) NSString *job;
@property (nonatomic,readwrite,copy) NSString *fav_book;
@property (nonatomic,readwrite,copy) NSString *fav_sport;
@property (nonatomic,readwrite,copy) NSString *fav_movie;


@end
