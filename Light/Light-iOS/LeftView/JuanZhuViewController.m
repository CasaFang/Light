//
//  JuanZhuViewController.m
//  YYL
//
//  Created by admin on 15/5/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "JuanZhuViewController.h"

@interface JuanZhuViewController ()

@end

@implementation JuanZhuViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"捐助";
    UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(20, 60, [UIScreen mainScreen].bounds.size.width-40, 200)];
    [textview setText:@"我是一个大天才"];
    [self.view addSubview:textview];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 360, [UIScreen mainScreen].bounds.size.width, 0.5)];
    [label setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:label];
    UITextField *text1=[[UITextField alloc]initWithFrame:CGRectMake(20, 360, [UIScreen mainScreen].bounds.size.width-40, 40)];
    [text1 setPlaceholder:@"捐助金额"];
    [self.view addSubview:text1];
    UILabel *label1=[[UILabel alloc]initWithFrame:CGRectMake(0, 401, [UIScreen mainScreen].bounds.size.width, 0.5)];
    [label1 setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:label1];
    UITextField *text2=[[UITextField alloc]initWithFrame:CGRectMake(20, 401, [UIScreen mainScreen].bounds.size.width-40, 40)];
    [text2 setPlaceholder:@"向我们捎句话吧"];
    [self.view addSubview:text2];
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(0, 441, [UIScreen mainScreen].bounds.size.width, 0.5)];
    [label3 setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:label3];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(40, 500, [UIScreen mainScreen].bounds.size.width-80, 40)];
    [button setTitle:@"确认捐助" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor lightGrayColor]];
    [button.layer setCornerRadius:10];
    [button addTarget:self action:@selector(pay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)pay
{
    NSLog(@"确认支付");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
