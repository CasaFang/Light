//
//  IndexViewController.m
//  
//
//  Created by FLY on 15/6/17.
//
//

#import "IndexViewController.h"
#import "PostInfo.h"
#import "LightAPI.h"
#import "LightArticle.h"
#import "IndexTableViewCell.h"

@interface IndexViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>{
    UITableView *_tableView;
    NSMutableArray *_status;
    NSMutableArray *_statusCells; //存储cell,用于计算高度
}
@end

@implementation IndexViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=true;
}
-(void)viewDidLoad {
    [super viewDidLoad];
    [self tempArticles];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
//    [self tempArticles];
    [self.view addSubview:_tableView];
    [_tableView numberOfRowsInSection:num];
//    [self toArrary];
}

#pragma mark - about leftviews
///显示左视图
-(void)showLeftView
{
    //leftview 是否显示，如果未显示，则显示
    static BOOL isshow=false;
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

#pragma mark - 文章数据加载
- (void) tempArticles {
    NSDictionary *getArticleDict=[NSDictionary dictionaryWithObjectsAndKeys:@"3",@"page_size",@"1",@"page_no", nil];
    PostInfo *post = [[PostInfo alloc]init];
    NSURL *url = [NSURL URLWithString:LIGHT_INDEX_URL];
    [post postInfo:getArticleDict infourl:url];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(toTempArticles:) name:@"postResult" object:post.result];

}

-(void)toTempArticles:(NSNotification *)notification{
    id result = [notification object];
//    NSLog(@"post result %@",result);
    
    NSArray *articles = result[@"articles"];
//    NSLog(@"array is %@",articles);
    
    _status = [[NSMutableArray alloc]init];
    _statusCells = [[NSMutableArray alloc]init];
    

    for (int i=0;i<3;i++){
//        NSLog(@"title is %@ , content is %@ , pic Url is %@",articles[i][@"title"],articles[i][@"content"],articles[i][@"pic"]);
        [_status addObject:[LightArticle initWithTitle:articles[i][@"title"] andContent:articles[i][@"content"] andPicUrl:articles[i][@"pic"]]];
        NSLog(@"Light Article List %@",[LightArticle initWithTitle:articles[i][@"title"] andContent:articles[i][@"content"] andPicUrl:articles[i][@"pic"]]);
        IndexTableViewCell *cell = [[IndexTableViewCell alloc]init];
        
        [_statusCells addObject:cell];
    }

//    NSLog(@"status is %@",_status);
//    NSLog(@"statusCells is %@",_statusCells);
    

}

-(void) toArrary {
    NSDictionary *getArticleDict=[NSDictionary dictionaryWithObjectsAndKeys:@"3",@"page_size",@"1",@"page_no", nil];
    PostInfo *post = [[PostInfo alloc]init];
    NSURL *url = [NSURL URLWithString:LIGHT_INDEX_URL];
    [post postInfo:getArticleDict infourl:url];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(toArticleArrary:) name:@"postResult" object:post.result];
}
-(void)toArticleArrary:(NSNotification *)notification {
    id result = [notification object];
    NSArray *articles = result[@"articles"];
//    NSLog(@"array is %@",articles);
}

#pragma mark - 数据源方法
#pragma mark 返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

#pragma mark 返回每组行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _status.count;
}

#pragma mark 返回每行的单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"UITableViewCellIdentifierKey1";
    IndexTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[IndexTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    //在此设置cell，以便重新布局
//    NSLog(_status[indexPath.row]);
    LightArticle *art = _status[indexPath.row];
//    LightArticle *art = [LightArticle initWithTitle:@"为什么一定要争取同性婚姻" andContent:@"北京线下沙龙——推动同性婚姻合法化进程" andPicUrl:@"http://7xjd7i.com1.z0.glb.clouddn.com/1.jpg"];
    [cell setArticle:art];
    return cell;
}

#pragma mark - 代理方法
#pragma mark 重新设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    IndexTableViewCell *cell = _statusCells[indexPath.row];
    cell.article = _status[indexPath.row];
    return cell.height;
}

#pragma mark 重写状态样式方法
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
