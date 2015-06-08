//
//  IndexViewController.m
//  YYL
//
//  Created by admin on 15/5/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "IndexViewController.h"
#import "ImageScale.h"
#import "TongZhiTableViewController.h"
#import "ZhangHuTableViewController.h"
#import "SheZhiTableViewController.h"
#import "FanKuiViewController.h"
#import "GuanYuViewController.h"
#import "GeRenViewController.h"
#import "ReadMoreViewController.h"
@interface IndexViewController ()

@end

@implementation IndexViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=true;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showLeftView)];//添加手势
    [self initslider];//增加左视图
}
///显示左视图
-(void)showLeftView
{
    static BOOL isshow=false;//leftview 是否显示
    if (!isshow) {
        [self.leftView setFrame:CGRectMake([UIScreen mainScreen].bounds.origin.x, [UIScreen mainScreen].bounds.origin.y+20, [UIScreen mainScreen].bounds.size.width-50, [UIScreen mainScreen].bounds.size.height)];
        [self.mainView setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-50, [UIScreen mainScreen].bounds.origin.y+20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        isshow=true;
        //为整个 view 添加点击事件
        self.mainView.userInteractionEnabled=true;
        [self.mainView addGestureRecognizer:self.tap];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MOVE" object:nil];
    }
    else
    {
        [self.leftView setFrame:CGRectMake(-[UIScreen mainScreen].bounds.size.width+10, [UIScreen mainScreen].bounds.origin.y+20, [UIScreen mainScreen].bounds.size.width-50,[UIScreen mainScreen].bounds.size.height)];
        [self.mainView setFrame:CGRectMake([UIScreen mainScreen].bounds.origin.x, [UIScreen mainScreen].bounds.origin.y+20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        isshow=false;
        [self.mainView removeGestureRecognizer:self.tap];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"MOVE" object:nil];
    }
}
-(void)initslider
{
    self.leftView=[[UIView alloc]initWithFrame:CGRectMake(-[UIScreen mainScreen].bounds.size.width+10, [UIScreen mainScreen].bounds.origin.y, [UIScreen mainScreen].bounds.size.width-50, [UIScreen mainScreen].bounds.size.height)];
    [self.leftView setBackgroundColor:[UIColor greenColor]];
    self.mainView=[[UIView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.origin.x, [UIScreen mainScreen].bounds.origin.y+20,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.mainView setBackgroundColor:[UIColor blueColor]];
    UINavigationBar *bar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 60)];
    UIBarButtonItem *leftbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"left_view.png"] style:UIBarButtonItemStylePlain target:self action:@selector(showLeftView)];
    UINavigationItem *item=[[UINavigationItem alloc]initWithTitle:@"首页"];
    [item setLeftBarButtonItem:leftbutton];
    [bar pushNavigationItem:item animated:false];
    [self.mainView addSubview:bar];
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.leftView];
    [self addButton];//添加 button 到左视图
    [self addlabel];//添加显示 label 到左视图
    [self addScrollView];//添加滑动到主视图
}
-(void)addButton
{
    for (int i=0; i<5; i++) {
        UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(90, 210+i*70, 100, 40)];
        [button setTag:i+100];
        [button setTitle:@"Lighter"forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonFun:) forControlEvents:UIControlEventTouchUpInside];
        [self.leftView addSubview:button];
        UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(50, 210+i*70, 40, 40)];
        [imageview setImage:[UIImage imageNamed:@"default_icon.png"]];
        [self.leftView addSubview:imageview];
    }
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(100, 60, 70, 70)];
    [button setImage:[UIImage imageNamed:@"default_icon.png"] forState:UIControlStateNormal];
    [button.layer setMasksToBounds:true];
    [button.layer setCornerRadius:35.0];
    [button setTag:105];
     [button addTarget:self action:@selector(buttonFun:) forControlEvents:UIControlEventTouchUpInside];
    [self.leftView addSubview:button];
}
-(void)addlabel
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 110, 100, 80)];
    [label setText:@"Light"];
    [label setTextColor:[UIColor redColor]];
    [self.leftView addSubview:label];
    for (int i=0; i<6; i++) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(100, 200+i*70, 200, 0.8)];
        [label setBackgroundColor:[UIColor whiteColor]];
        [self.leftView addSubview:label];
    }
}
-(void)buttonFun:(UIButton*)sender
{
    switch (sender.tag) {
        case 100:
        {
            NSLog(@"0");
            TongZhiTableViewController*tongzhi=[[TongZhiTableViewController alloc]init];
            [self.navigationController pushViewController:tongzhi animated:true];
            
        }
            break;
        case 101:
        {
            NSLog(@"1");
            ZhangHuTableViewController *zhanghu=[[ZhangHuTableViewController alloc]init];
            [self.navigationController pushViewController:zhanghu animated:true];
        }
            break;
        case 102:
        {
            NSLog(@"2");
            SheZhiTableViewController *shezhi=[[SheZhiTableViewController alloc]init];
            [self.navigationController pushViewController:shezhi animated:true];
            
        }
            break;
        case 103:
        {
            NSLog(@"3");
            FanKuiViewController *fankui=[[FanKuiViewController alloc]init];
            [self.navigationController pushViewController:fankui animated:true];
        }
            break;
        case 104:
        {
            NSLog(@"4");
            GuanYuViewController *guanyu=[[GuanYuViewController alloc]init];
            [self.navigationController pushViewController:guanyu animated:false];
        }
            break;
        case 105:
        {
            NSLog(@"5");
            GeRenViewController *geren=[[GeRenViewController alloc]init];
            [self.navigationController pushViewController:geren animated:false];
        }
            break;
        default:
            break;
    }
}
-(void)addScrollView
{
    self.scroll=[[UIScrollView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.origin.x, [UIScreen mainScreen].bounds.origin.y+60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.scroll setContentSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*2)];
    [self.mainView addSubview:self.scroll];

    UIImage *images=[UIImage imageNamed:@"img2.png"];
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    [button setImage:[images scaleToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 200)] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(readMore:) forControlEvents:UIControlEventTouchUpInside];
    [self.scroll addSubview:button];
}
-(void)readMore:(UIButton*)sender
{
    NSLog(@"read more");
    ReadMoreViewController *readmore=[[ReadMoreViewController alloc]init];
    [self.navigationController pushViewController:readmore animated:false];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
