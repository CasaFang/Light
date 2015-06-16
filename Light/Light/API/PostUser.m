//
//  PostUser.m
//  
//
//  Created by FLY on 15/6/15.
//
//

#import "PostUser.h"

@implementation PostUser

-(void)postUserInfo:(NSDictionary *)info infourl:(NSURL *)url{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:info options:NSJSONWritingPrettyPrinted error:&error];
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    
    [requst setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requst setHTTPMethod:@"POST"];
    [requst setHTTPBody:tempJsonData];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:requst queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSString *error1 = dict[@"error"];
            if(error1){
                NSLog(@"连接失败 %@",error1);
            }
            else
            {
                NSString *success = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"连接成功 %@",success);
                
                _result = dict;
            }
        }else{
            NSLog(@"connection error");
        }
    }];
}

@end
