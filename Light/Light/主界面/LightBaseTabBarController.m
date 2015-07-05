//
//  LightBaseTabBarController.m
//  
//
//  Created by FLY on 15/6/17.
//
//

#import "LightBaseTabBarController.h"
#import "IndexViewController.h"
#import "MSGViewController.h"
#import "CPYViewController.h"
#import "LoveViewController.h"
#import "KDGViewController.h"


@implementation LightBaseTabBarController

-(void)viewDidLoad {
    [super viewDidLoad];
    IndexViewController *index = [[IndexViewController alloc]init];
    MSGViewController *msg = [[MSGViewController alloc]init];
    CPYViewController *cpy = [[CPYViewController alloc]init];
    LoveViewController *love = [[LoveViewController alloc]init];
//    KDGViewController *kdg = [[KDGViewController alloc]init];
    
    self.viewControllers = [NSArray arrayWithObjects:index,msg,cpy,love, nil];
//    self.viewControllers = [NSArray arrayWithObjects:index,msg,cpy,love,kdg, nil];
    NSLog(@"init");
    index.title = @"首页";
    msg.title = @"消息";
    cpy.title = @"求同";
    love.title = @"求爱";
//    kdg.title = @"求知";
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"index_24*24_grey.png"]];
    [((UITabBarItem *)[self.tabBar.items objectAtIndex:1]) setImage:[UIImage imageNamed:@"MSG_24*24_grey.png"]];
    [((UITabBarItem *)[self.tabBar.items objectAtIndex:2]) setImage:[UIImage imageNamed:@"KPY_24*24_grey.png"]];
    [((UITabBarItem *)[self.tabBar.items objectAtIndex:3]) setImage:[UIImage imageNamed:@"love_24*24_grey.png"]];
//    [((UITabBarItem*)[self.tabBar.items objectAtIndex:4]) setImage:[UIImage imageNamed:@"KDG_24*24_grey.png"]];

}

@end
