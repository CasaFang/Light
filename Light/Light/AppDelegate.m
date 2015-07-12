//
//  AppDelegate.m
//  Light
//
//  Created by FLY on 15/6/14.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "AppDelegate.h"
#import "LightLoginViewController.h"
#import "LightIntroViewController.h"
#import "LightBaseTabBarController.h"
#import <SMS_SDK/SMS_SDK.h>

#define LightKey @"82645f6f16b8"
#define LightSecret @"ea2501269690d16dbe480f5bea373924"

@interface AppDelegate ()

@end

@implementation AppDelegate{
    UITabBarController *main;
    CGRect barRect;
}



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [SMS_SDK registerApp:LightKey withSecret:LightSecret];
    NSLog(@"SMS初始化");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    [self toIntro];
//    [self toLogin];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


-(void)toIntro {
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    LightIntroViewController *intro = [[LightIntroViewController alloc]init];
    
    self.window.rootViewController = intro;
    
}


-(void)toLogin {
    
    LightLoginViewController *loginView=[[LightLoginViewController alloc]init] ;
    
    self.window.rootViewController = loginView;
    
}


-(void)toMain{
    
    LightBaseTabBarController *mainVC = [[LightBaseTabBarController alloc]init];
    
    self.navigation=[[UINavigationController alloc]initWithRootViewController:mainVC];
    [self.window setRootViewController:mainVC];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabbarMove) name:@"MOVE" object:nil];
}

-(void)tabbarMove
{
    NSLog(@"TABBARMOVE");
    static BOOL isshow=false;
    if (!isshow) {
        [main.tabBar setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-50, barRect.origin.y, barRect.size.width, barRect.size.height)];
        isshow=true;
    }
    else
    {
        [main.tabBar setFrame:barRect];
        isshow=false;
    }
}

/*
-(void)dealloc
{
    [main release];
    [self.window release];
    [super dealloc];
}
 */


@end
