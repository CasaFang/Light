//
//  ZhangHuTableViewController.m
//  YYL
//
//  Created by admin on 15/5/27.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "ZhangHuTableViewController.h"
#import "ChangMobileViewController.h"
#import "ChangeEmailViewController.h"
#import "ChangePwdViewController.h"
#import "ChangePayViewController.h"
@interface ZhangHuTableViewController ()

@end

@implementation ZhangHuTableViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"账户";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

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
            return @"账户绑定";
        }
            break;
        case 1:
        {
            return @"密码";
        }
            break;
        case 2:
        {
            return @"支付方式";
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
            if (indexPath.row==0) {
                ChangMobileViewController *mobile=[[ChangMobileViewController alloc]init];
                [self.navigationController pushViewController:mobile animated:false];
            }
            else if (indexPath.row==1)
            {
                ChangeEmailViewController *email=[[ChangeEmailViewController alloc]init];
                [self.navigationController pushViewController:email animated:false];
            }
        }
            break;
        case 1:
        {
            if (indexPath.row==0) {
                ChangePwdViewController *password=[[ChangePwdViewController alloc]init];
                [self.navigationController pushViewController:password animated:false];
            }
        }
            break;
        case 2:
        {
            if (indexPath.row==0) {
                ChangePayViewController *pay=[[ChangePayViewController alloc]init];
                [self.navigationController pushViewController:pay animated:false];
            }
        }
            break;
        default:
            break;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
