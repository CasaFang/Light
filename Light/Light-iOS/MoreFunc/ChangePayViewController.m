//
//  ChangePayViewController.m
//  YYL
//
//  Created by admin on 15/5/27.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ChangePayViewController.h"

@interface ChangePayViewController ()

@end

@implementation ChangePayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"修改支付宝账户";
    UIBarButtonItem *rightbutton=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(changePay)];
    self.navigationItem.rightBarButtonItem=rightbutton;
    [self inittextfiled];
    [self initbutton];
}
- (void)changePay
{
    self.text.enabled=true;
    [self.text resignFirstResponder];
}
-(void)inittextfiled
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+20, [UIScreen mainScreen].bounds.size.width, 40)];
    [label setText:@"123"];
    [label setTextColor:[UIColor redColor]];
    [self.view addSubview:label];
    label.layer.borderColor=[UIColor lightGrayColor].CGColor;
    label.layer.borderWidth=0.5;
    
    self.text=[[UITextField alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2,self.navigationController.navigationBar.frame.size.height+20, [UIScreen mainScreen].bounds.size.width/2, 40)];
    [self.text setText:@"ss"];
    [self.text setTextAlignment:NSTextAlignmentCenter];
    [self.text setTextColor:[UIColor redColor]];
    [self.view addSubview:self.text];
    self.text.enabled=false;
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(20,self.navigationController.navigationBar.frame.size.height+70, [UIScreen mainScreen].bounds.size.width-40, 40)];
    [label2 setText:@"你可以通过已验证过的邮箱地址登陆,也可以用它来找回密码"];
    [label2 setTextColor:[UIColor lightGrayColor]];
    [label2 setNumberOfLines:2];
    [label2 sizeToFit];
    [self.view addSubview:label2];
}
-(void)initbutton
{
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(20,self.navigationController.navigationBar.frame.size.height+150, [UIScreen mainScreen].bounds.size.width-40, 40)];
    [button setBackgroundColor:[UIColor redColor]];
    [button.layer setCornerRadius:10];
    [button setTitle:@"解除绑定" forState:UIControlStateNormal];
    [self.view addSubview:button];
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
