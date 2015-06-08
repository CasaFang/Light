//
//  GuanYuViewController.m
//  YYL
//
//  Created by admin on 15/5/27.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "GuanYuViewController.h"
#import "GuanYuLightViewController.h"
#import "JuanZhuViewController.h"
@interface GuanYuViewController ()

@end

@implementation GuanYuViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"关于";
    UIImageView *imageview=[[UIImageView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+20, [UIScreen mainScreen].bounds.size.width, 200)];
    [imageview setImage:[UIImage imageNamed:@"img2.png"]];
    [self.view addSubview:imageview];
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height+400, [UIScreen mainScreen].bounds.size.width, 200)];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier=@"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier: reuseIdentifier];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image=[UIImage imageNamed:@"img.png"];
    cell.textLabel.text=@"手机号";
    cell.detailTextLabel.text=@"123456";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NSLog(@"关于");
            GuanYuLightViewController *light=[[GuanYuLightViewController alloc]init];
            [self.navigationController pushViewController:light animated:false];
        }
            break;
        case 1:
        {
            NSLog(@"捐助");
            JuanZhuViewController *juanzhu=[[JuanZhuViewController alloc]init];
            [self.navigationController pushViewController:juanzhu animated:false];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
