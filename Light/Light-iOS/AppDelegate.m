//
//  AppDelegate.m
//  Light-iOS
//
//  Created by FLY on 15/5/28.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "AppDelegate.h"
#import "LightLoginViewController.h"
#import "IndexViewController.h"
#import "MSGViewController.h"
#import "CPYTableViewController.h"
#import "LOVETableViewController.h"
#import "KDGTableViewController.h"
#import "LightBaseTabController.h"
#import "LightIntroViewController.h"
#import <SMS_SDK/SMS_SDK.h>

#define LightKey @"7f64aa39090d"
#define LightSecret @"fc8c0c5576fab3fe03486512b4560c88"

@interface AppDelegate ()

@end

@implementation AppDelegate{

    UITabBarController *main;
    CGRect barRect;
}




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SMS_SDK registerApp:LightKey withSecret:LightSecret];
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    // Override point for customization after application launch.
    [self toIntro];
//    [self toLogin];
//    [self toMain];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//    [MMProgressHUD setDisplayStyle:MMProgressHUDDisplayStylePlain];
//    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleFade];
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
    LightIntroViewController *intro = [[LightIntroViewController alloc]init];
    
    self.window.rootViewController = intro;

}

-(void)toLogin {
    
    LightLoginViewController *loginView=[[LightLoginViewController alloc]init] ;
    
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginView];
//    [nav setNavigationBarHidden:YES];
    
    self.window.rootViewController = loginView;

}

-(void)toMain{

    IndexViewController *index=[[IndexViewController alloc]init];
    MSGViewController *message=[[MSGViewController alloc]init];
    CPYTableViewController *company=[[CPYTableViewController alloc]init];
    LOVETableViewController *love=[[LOVETableViewController alloc]init];
    KDGTableViewController *knowdge=[[KDGTableViewController alloc]init];
    
    main=[[UITabBarController alloc]init];
    
    

    main.viewControllers=[NSArray arrayWithObjects:index,message, company,love,knowdge,nil];
    index.title=@"首页";
    message.title=@"消息";
    company.title=@"求同";
    love.title=@"求爱";
    knowdge.title=@"求知";
    [((UITabBarItem*)[main.tabBar.items objectAtIndex:0]) setImage:[UIImage imageNamed:@"index_24*24_grey.png"]];
    [((UITabBarItem*)[main.tabBar.items objectAtIndex:1]) setImage:[UIImage imageNamed:@"MSG_24*24_grey.png"]];
    [((UITabBarItem*)[main.tabBar.items objectAtIndex:2]) setImage:[UIImage imageNamed:@"KPY_24*24_grey.png"]];
    [((UITabBarItem*)[main.tabBar.items objectAtIndex:3]) setImage:[UIImage imageNamed:@"love_24*24_grey.png"]];
    [((UITabBarItem*)[main.tabBar.items objectAtIndex:4]) setImage:[UIImage imageNamed:@"KDG_24*24_grey.png"]];
    self.navigation=[[UINavigationController alloc]initWithRootViewController:main];
    [self.window setRootViewController:self.navigation];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(tabbarMove) name:@"MOVE" object:nil];
    barRect=main.tabBar.frame;

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

-(void)dealloc
{
    [main release];
    [self.window release];
    [super dealloc];
}

@end
