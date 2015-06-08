//
//  CPYTableViewController.m
//  YYL
//
//  Created by admin on 15/5/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "CPYTableViewController.h"
#import "CPYListTableViewController.h"
#import "DetailViewController.h"
@interface CPYTableViewController ()

@end

@implementation CPYTableViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=true;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationBar *bar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 60)];
    [bar setBarTintColor:[UIColor lightGrayColor]];
    UIBarButtonItem *rightbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"CPY_48*48_grey.png"] style:UIBarButtonItemStylePlain target:self action:@selector(addFriends)];
    UINavigationItem *item=[[UINavigationItem alloc]initWithTitle:@"求同"];
    [item setRightBarButtonItem:rightbutton];
    [bar pushNavigationItem:item animated:false];
    [self.view addSubview:bar];
    self.tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, 500)];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}
-(void)addFriends
{
    NSLog(@"添加朋友");
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        {
            return 2;
        }
            break;
        case 1:
        {
            return 1;
        }
            break;
        case 2:
        {
            return 1;
        }
            break;
        default:
            break;
    }
    return 0;
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
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            return @"心灵陪伴";
        }
            break;
        case 1:
        {
            return @"命理";
        }
            break;
        case 2:
        {
            return @"法务";
        }
            break;
        default:
            break;
    }
    return 0;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            CPYListTableViewController *list=[[CPYListTableViewController alloc]init];
            if (indexPath.row==0) {
                NSLog(@"需要人陪");
                list.titleString=@"需要人陪";
            }
            else if (indexPath.row==1)
            {
              NSLog(@"陪伴师");
                list.titleString=@"陪伴师";
                
            }
            else if (indexPath.row==2)
            {
                NSLog(@"心理咨询师");
                list.titleString=@"心理咨询师";
            }
            [self.navigationController pushViewController:list animated:false];
        }
            break;
        case 1:
        {
            DetailViewController *detail=[[DetailViewController alloc]init];
            if (indexPath.row==0) {
                NSLog(@"大师");
            }
            [self.navigationController pushViewController:detail animated:false];
        }
            break;
        case 2:
        {
            DetailViewController *detail=[[DetailViewController alloc]init];
            if (indexPath.row==0) {
                NSLog(@"律师");
            }
            [self.navigationController pushViewController:detail animated:false];
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
