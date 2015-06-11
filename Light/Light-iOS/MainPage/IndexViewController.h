//
//  IndexViewController.h
//  YYL
//
//  Created by admin on 15/5/25.
//  Copyright (c) 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IndexViewController : UIViewController
@property (strong, nonatomic) UIView *leftView;//左边 view
@property (strong, nonatomic) UITableView *mainView;//主显示 view
@property (strong, nonatomic) UITapGestureRecognizer *tap;//tap 手势
@property (strong, nonatomic) UIScrollView *scroll;
@end
