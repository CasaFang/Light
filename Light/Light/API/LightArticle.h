//
//  LightArticle.h
//  
//
//  Created by FLY on 15/6/14.
//
//

#import <Foundation/Foundation.h>

@interface LightArticle : NSObject

#pragma mark - 文章id
@property (nonatomic,readonly,assign) int64_t ArticleID;
#pragma mark － 文章标题
@property (nonatomic,readwrite,copy) NSString *title;
#pragma mark -  文章内容
@property (nonatomic,readwrite,copy) NSString *content;
#pragma mark -  文章图片url
@property (nonatomic,readwrite,copy) NSString *picUrl;

#pragma mark - 带参数的构造函数
-(LightArticle *)initWithTitle:(NSString *)title andContent:(NSString *)content andPicUrl:(NSString *)picUrl;

#pragma mark - 带参数的静态对象初始化方法
+(LightArticle *)initWithTitle:(NSString *)title andContent:(NSString *)content andPicUrl:(NSString *)picUrl;

@end
