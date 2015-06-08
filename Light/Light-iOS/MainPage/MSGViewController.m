//
//  MSGViewController.m
//  YYL
//
//  Created by admin on 15/5/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "MSGViewController.h"

@interface MSGViewController ()

@end

@implementation MSGViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=true;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 60)];
    [bar setBarTintColor:[UIColor lightGrayColor]];
    UIBarButtonItem *rightbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"MSG_48*48_grey.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
    UINavigationItem *item=[[UINavigationItem alloc]initWithTitle:@"消息"];
    [item setRightBarButtonItem:rightbutton];
    [bar pushNavigationItem:item animated:false];
    [self.view addSubview:bar];
    self.segment=[[UISegmentedControl alloc]initWithItems:[NSArray arrayWithObjects:@"消息",@"通讯录", nil]];
    [self.segment setFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 40)];
    [self.segment addTarget:self action:@selector(switchSegment) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.segment];
}
//初始化 message 列表
-(void)initMsg
{
    
}
//初始化 book 列表
-(void)initBook
{
    
}
-(void)addFriends
{
    
}
-(void)switchSegment
{
    switch (self.segment.selectedSegmentIndex) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///tableview相关

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"ss";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"ss";
}
@end
