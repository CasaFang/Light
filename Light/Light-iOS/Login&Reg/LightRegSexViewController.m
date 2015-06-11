//
//  LightRegSexViewController.m
//  Light-iOS
//
//  Created by FLY on 15/6/3.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "LightRegSexViewController.h"
#import "AppDelegate.h"
#import "LightAPI.h"

@interface LightRegSexViewController ()
@property (retain, nonatomic) IBOutlet UILabel *biometricSexText;
@property (retain, nonatomic) IBOutlet UILabel *psychologySexText;
@property (retain, nonatomic) IBOutlet UIButton *bioMaleButton;
@property (retain, nonatomic) IBOutlet UIButton *bioOtherButton;
@property (retain, nonatomic) IBOutlet UIButton *bioFemaleButton;
@property (retain, nonatomic) IBOutlet UIButton *psyMaleButton;
@property (retain, nonatomic) IBOutlet UIButton *psyOtherButton;
@property (retain, nonatomic) IBOutlet UIButton *psyFemaleButton;
@property (nonatomic,strong) UIImageView *backgroundImageView;


@end

@implementation LightRegSexViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [self.navigationItem setTitle:@"注册"];
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.biometricSexText];
    [self.view addSubview:self.psychologySexText];
    [self.view addSubview:self.bioMaleButton];
    [self.view addSubview:self.bioOtherButton];
    [self.view addSubview:self.bioFemaleButton];
    [self.view addSubview:self.psyMaleButton];
    [self.view addSubview:self.psyOtherButton];
    [self.view addSubview:self.psyFemaleButton];
}

#pragma mark - about subviews
-(UIImageView *)backgroundImageView{
    if(_backgroundImageView==nil){
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        _backgroundImageView.image = [UIImage imageNamed:@"login_background"];
    }
    return _backgroundImageView;
}

-(UIButton *)bioMaleButton {
    [_bioMaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
    [_bioMaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ]  forState:UIControlStateDisabled];
    [_bioMaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
    _bioMaleButton.tag = 1;
    _bioMaleButton.enabled = YES;
    [_bioMaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_bioMaleButton addTarget:self action:@selector(choseBio:) forControlEvents:UIControlEventTouchUpInside];
    return _bioMaleButton;
}

-(UIButton *)bioFemaleButton {
    [_bioFemaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
    [_bioFemaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ]  forState:UIControlStateDisabled];
    [_bioFemaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
    _bioFemaleButton.tag = 0;
    _bioFemaleButton.enabled = YES;
    [_bioFemaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_bioFemaleButton addTarget:self action:@selector(choseBio:) forControlEvents:UIControlEventTouchUpInside];
    return _bioFemaleButton;
}

-(UIButton *)bioOtherButton {
    [_bioOtherButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
    [_bioOtherButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ]  forState:UIControlStateDisabled];
    [_bioOtherButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
    _bioOtherButton.tag = 2;
    _bioOtherButton.enabled = YES;
    [_bioOtherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_bioOtherButton addTarget:self action:@selector(choseBio:) forControlEvents:UIControlEventTouchUpInside];
    return _bioOtherButton;
}

-(UIButton *)psyMaleButton {
    [_psyMaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
    [_psyMaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ]  forState:UIControlStateDisabled];
    [_psyMaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
    _psyMaleButton.tag=1;
    _psyMaleButton.enabled = YES;
    [_psyMaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_psyMaleButton addTarget:self action:@selector(chosePsy:) forControlEvents:UIControlEventTouchUpInside];
    return _psyMaleButton;
}
-(UIButton *)psyFemaleButton {
    [_psyFemaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
    [_psyFemaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ]  forState:UIControlStateDisabled];
    [_psyFemaleButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
    _psyFemaleButton.tag=0;
    _psyFemaleButton.enabled = YES;
    [_psyFemaleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_psyFemaleButton addTarget:self action:@selector(chosePsy:) forControlEvents:UIControlEventTouchUpInside];
    return _psyFemaleButton;
}
-(UIButton *)psyOtherButton {
    [_psyOtherButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
    [_psyOtherButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ]  forState:UIControlStateDisabled];
    [_psyOtherButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
    _psyOtherButton.tag=2;
    _psyOtherButton.enabled = YES;
    [_psyOtherButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_psyOtherButton addTarget:self action:@selector(chosePsy:) forControlEvents:UIControlEventTouchUpInside];
    return _psyOtherButton;
}

#pragma mark - Button Action
-(void)choseBio: (UIButton *)btn {
    NSDictionary *registerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.userId,@"user_id",self.nickname,@"name",self.password,@"pwd",btn.tag,@"physiology_gender", nil];
    NSError * error;
    NSLog(@"registerDictionary is %@",registerDictionary);
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:registerDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *registerStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"registerString is %@",registerStr);
    
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    
    NSURL *url = [NSURL URLWithString:RegisterDetailURL];
    
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    
    [requst setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requst setHTTPMethod:@"POST"];
    [requst setHTTPBody:tempJsonData];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:requst queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(data){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSString *error1 = dict[@"error"];
            if(error1){
                NSLog(@"服务器请求失败,错误为:%@",error1);
            }
            else
            {
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                NSLog(@"responseDictionary is %@",dic);
                NSLog(@"注册流程成功");
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
                [self.view release];
                AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [delegate toMain];
            }
        }else{
            NSLog(@"connection error");
        }
    }];
    

}

-(void)chosePsy: (UIButton *)btn {
    NSDictionary *registerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.userId,@"user_id",self.nickname,@"name",self.password,@"pwd",btn.tag,@"society_gender", nil];
    NSError * error;
    NSLog(@"registerDictionary is %@",registerDictionary);
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:registerDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *registerStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"registerString is %@",registerStr);
    
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    
    NSURL *url = [NSURL URLWithString:RegisterDetailURL];
    
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    
    [requst setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requst setHTTPMethod:@"POST"];
    [requst setHTTPBody:tempJsonData];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:requst queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(data){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSString *error1 = dict[@"error"];
            if(error1){
                NSLog(@"服务器请求失败,错误为:%@",error1);
            }
            else
            {
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                NSLog(@"responseDictionary is %@",dic);
                NSLog(@"注册流程成功");
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
                AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
                [delegate toMain];
            }
        }else{
            NSLog(@"connection error");
        }
    }];
}

#pragma mark - keyboard Action
-(void)closeKeyboard:(id)sender{
    [self.view endEditing:YES];
}


@end
