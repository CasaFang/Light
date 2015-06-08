//
//  ChangePwdViewController.m
//  YYL
//
//  Created by admin on 15/5/27.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ChangePwdViewController.h"

@interface ChangePwdViewController ()

@end

@implementation ChangePwdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"修改手机号";
    UIBarButtonItem *rightbutton=[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(PWDDone)];
    self.navigationItem.rightBarButtonItem=rightbutton;
    [self inittextfiled];
}

-(void)inittextfiled
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+20, [UIScreen mainScreen].bounds.size.width, 40)];
    [label setText:@"请输入旧密码"];
    [label setTextColor:[UIColor lightGrayColor]];
    [self.view addSubview:label];
    
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+70, [UIScreen mainScreen].bounds.size.width, 40)];
    label2.layer.borderColor=[UIColor lightGrayColor].CGColor;
    label2.layer.borderWidth=0.5;
    [self.view addSubview:label2];
    
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+70,70, 40)];
    [label3 setText:@"旧密码"];
    [label3 setTextAlignment:NSTextAlignmentCenter];
    [label3 setTextColor:[UIColor redColor]];
    [self.view addSubview:label3];
    
    self.oldPWD=[[UITextField alloc]initWithFrame:CGRectMake(70,self.navigationController.navigationBar.frame.size.height+70, [UIScreen mainScreen].bounds.size.width, 40)];
    [self.view addSubview:self.oldPWD];
    
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+110, [UIScreen mainScreen].bounds.size.width, 40)];
    [label4 setText:@"请重置密码"];
    [label4 setTextColor:[UIColor lightGrayColor]];
    [self.view addSubview:label4];
    
    UILabel *label7=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+150, [UIScreen mainScreen].bounds.size.width, 40)];
    label7.layer.borderColor=[UIColor lightGrayColor].CGColor;
    label7.layer.borderWidth=0.5;
    [self.view addSubview:label7];
    
    UILabel *label5=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+150,70, 40)];
    [label5 setText:@"旧密码"];
    [label5 setTextAlignment:NSTextAlignmentCenter];
    [label5 setTextColor:[UIColor redColor]];
    [self.view addSubview:label5];
    
    self.nwPWD=[[UITextField alloc]initWithFrame:CGRectMake(70,self.navigationController.navigationBar.frame.size.height+150, [UIScreen mainScreen].bounds.size.width, 40)];
    [self.view addSubview:self.nwPWD];
    
    UILabel *label8=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+195, [UIScreen mainScreen].bounds.size.width, 40)];
    label8.layer.borderColor=[UIColor lightGrayColor].CGColor;
    label8.layer.borderWidth=0.5;
    [self.view addSubview:label8];
    
    UILabel *label6=[[UILabel alloc]initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height+195,70, 40)];
    [label6 setText:@"确认密码"];
    [label6 setTextAlignment:NSTextAlignmentCenter];
    [label6 setTextColor:[UIColor redColor]];
    [self.view addSubview:label6];
    
    self.comPWD=[[UITextField alloc]initWithFrame:CGRectMake(70,self.navigationController.navigationBar.frame.size.height+195, [UIScreen mainScreen].bounds.size.width, 40)];
    [self.view addSubview:self.comPWD];
}
-(void)PWDDone
{
    NSLog(@"保存密码");
    [self.navigationController popViewControllerAnimated:false];
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
