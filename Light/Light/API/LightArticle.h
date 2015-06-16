//
//  LightArticle.h
//  
//
//  Created by FLY on 15/6/14.
//
//

#import <Foundation/Foundation.h>

@interface LightArticle : NSObject

@property (nonatomic,readonly,assign) int64_t ArticleID;
@property (nonatomic,readwrite,copy) NSString *content;
@property (nonatomic,readwrite,copy) NSString *picUrl;

@end
