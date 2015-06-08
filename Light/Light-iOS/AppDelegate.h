//
//  AppDelegate.h
//  Light-iOS
//
//  Created by FLY on 15/5/28.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navigation;

-(void)toMain;
-(void)toLogin;

@end

