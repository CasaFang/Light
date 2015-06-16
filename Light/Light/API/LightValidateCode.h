//
//  LightValidateCode.h
//  
//
//  Created by FLY on 15/6/14.
//
//

#import <Foundation/Foundation.h>

@interface LightValidateCode : NSObject

@property (nonatomic,readwrite,assign) int64_t userID;
@property (nonatomic,readwrite,copy) NSString *val_code;
@property (nonatomic,readwrite,assign) int64_t result;

@end
