//
//  LightArticle.m
//  
//
//  Created by FLY on 15/6/14.
//
//

#import "LightArticle.h"

@implementation LightArticle

-(LightArticle *)initWithTitle:(NSString *)title andContent:(NSString *)content andPicUrl:(NSString *)picUrl
{
    if (self=[super init]){
        self.title = title;
        self.content = content;
        self.picUrl = picUrl;
    }
    return self;
}

+(LightArticle *)initWithTitle:(NSString *)title andContent:(NSString *)content andPicUrl:(NSString *)picUrl
{
    LightArticle *article = [[LightArticle alloc]initWithTitle:title andContent:content andPicUrl:picUrl];
    return article;
}

@end
