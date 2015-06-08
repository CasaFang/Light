//
//  DetailViewController.m
//  YYL
//
//  Created by admin on 15/5/29.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"sssss";
    [self initbutton];
}
-(void)initbutton
{
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2-30, 200, 70, 70)];
    [button setImage:[UIImage imageNamed:@"img2.png"] forState:UIControlStateNormal];
    [button.layer setMasksToBounds:true];
    [button.layer setCornerRadius:35.0];
    [self.view addSubview:button];
    UIButton *leftbutton=[[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/5, 300, 70, 70)];
    [leftbutton setTitle:@"学霸" forState:UIControlStateNormal];
    
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
