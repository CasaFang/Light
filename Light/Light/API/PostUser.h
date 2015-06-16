//
//  PostUser.h
//  
//
//  Created by FLY on 15/6/15.
//
//

#import <Foundation/Foundation.h>

@interface PostUser : NSObject

@property (nonatomic,assign) NSDictionary *info;
@property (nonatomic,assign) NSURL *url;

@property (nonatomic,assign) NSDictionary *result;


-(void)postUserInfo:(NSDictionary *)info infourl:(NSURL *)url;

@end
