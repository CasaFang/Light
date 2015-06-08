//
//  MSGViewController.h
//  YYL
//
//  Created by admin on 15/5/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MSGViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UISegmentedControl *segment;
@property (strong, nonatomic) UITableView *msgTableView;//消息列表
@property (strong, nonatomic) UITableView *bookTableView;//通讯录列表
@property (strong, nonatomic) NSMutableArray *msgArray;//消息列表 array
@property (strong, nonatomic) NSMutableArray *bookArray;//通讯录列表 array
@end
