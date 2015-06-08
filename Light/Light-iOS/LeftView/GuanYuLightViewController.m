//
//  GuanYuLightViewController.m
//  YYL
//
//  Created by admin on 15/5/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "GuanYuLightViewController.h"

@interface GuanYuLightViewController ()

@end

@implementation GuanYuLightViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"关于light";
    UITextView *textview=[[UITextView alloc]initWithFrame:CGRectMake(20, 60, [UIScreen mainScreen].bounds.size.width-40, 200)];
    [textview setText:@"我是一个大天才"];
    [self.view addSubview:textview];
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
