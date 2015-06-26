//
//  IndexViewController.h
//  
//
//  Created by FLY on 15/6/17.
//
//

#import <UIKit/UIKit.h>

@interface IndexViewController : UITableViewController 
@property (strong, nonatomic) UIView *leftView;//左边 view
@property (strong, nonatomic) UITableView *mainView;//主显示 view
@property (strong, nonatomic) UITapGestureRecognizer *tap;//tap 手势
@property (strong, nonatomic) UIScrollView *scroll;
@end
