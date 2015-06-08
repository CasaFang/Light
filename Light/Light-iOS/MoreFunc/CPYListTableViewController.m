//
//  CPYListTableViewController.m
//  YYL
//
//  Created by admin on 15/5/28.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import "CPYListTableViewController.h"
#import "DetailViewController.h"
@interface CPYListTableViewController ()

@end

@implementation CPYListTableViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=false;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=self.titleString;
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFriend)];
    self.navigationItem.rightBarButtonItem=rightButton;
}
-(void)addFriend
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

   
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *reuseIdentifier=@"identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier: reuseIdentifier];
    }
    
    cell.imageView.image=[UIImage imageNamed:@"img.png"];
    //昵称
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake( cell.frame.size.width/4, cell.frame.origin.y, 70, cell.frame.size.height/2)];
    [label setText:@"我是天才"];
    [label setTextColor:[UIColor redColor] ];
    [cell addSubview:label];
    //只有第一个需要人陪有这几项
    if ([self.titleString isEqualToString:@"需要人陪"]) {
    //需要
    UILabel *label2=[[UILabel alloc]initWithFrame:CGRectMake( cell.frame.size.width/2+30, cell.frame.origin.y, 40, cell.frame.size.height/2)];
    [label2 setText:@"需要"];
    [label2 setTextColor:[UIColor redColor] ];
    [cell addSubview:label2];
    //需要 button
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(cell.frame.size.width/2+70, cell.frame.origin.y, 20, cell.frame.size.height/2)];
    [button setBackgroundImage:[UIImage imageNamed:@"img.png"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(needFun) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:button];
    //时间
    UILabel *label3=[[UILabel alloc]initWithFrame:CGRectMake( cell.frame.size.width/2+100, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height/2)];
    [label3 setText:@"5:00"];
    [label3 setTextColor:[UIColor redColor] ];
    [cell addSubview:label3];
    }
    //签名
    UILabel *label4=[[UILabel alloc]initWithFrame:CGRectMake( cell.frame.size.width/4, cell.frame.origin.y+cell.frame.size.height/2, cell.frame.size.width*3/4, cell.frame.size.height/2)];
    [label4 setText:@"好男人就是我，我就是大天才，阿弥陀佛"];
    [label4 setTextColor:[UIColor redColor] ];
    [cell addSubview:label4];
    return cell;
}
-(void)needFun
{
    NSLog(@"需要");
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击");
    DetailViewController *detail=[[DetailViewController alloc]init];
    [self.navigationController pushViewController:detail animated:false];
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
