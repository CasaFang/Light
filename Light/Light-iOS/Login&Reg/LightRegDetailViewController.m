//
//  LightRegDetailViewController.m
//  Light-iOS
//
//  Created by FLY on 15/6/3.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "LightRegDetailViewController.h"
#import "LightTextField.h"
#import "LightRegSexViewController.h"

@interface LightRegDetailViewController ()
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIImageView *defaultHeader;
@property (nonatomic,strong) LightTextField *usernameField;
@property (nonatomic,strong) LightTextField *passwordField;
@property (nonatomic,strong) UIButton *registerButton;

@end

@implementation LightRegDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.defaultHeader];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.registerButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImageView *)backgroundImageView{
    if(_backgroundImageView==nil){
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        _backgroundImageView.image = [UIImage imageNamed:@"login_background"];
    }
    return _backgroundImageView;
}

-(UIImageView*)defaultHeader{
    if(_defaultHeader==nil){
        _defaultHeader=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)-defaultHeaderSize/2, defaultHeaderMarginTop, defaultHeaderSize, defaultHeaderSize)];
        _defaultHeader.image=[UIImage imageNamed:@"default_icon"];
    }
    return _defaultHeader;
}

-(LightTextField*)usernameField{
    if(_usernameField==nil){
        _usernameField = [[LightTextField alloc] initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetMaxY(_defaultHeader.frame)+UsernameFieldMarginTop, CGRectGetWidth(self.view.frame)-HorizontalSpacing*2, TextFieldHeight)];
        _usernameField.background=[[UIImage imageNamed:@"operationbox_text"]stretchableImageWithLeftCapWidth:10 topCapHeight:15];
        _usernameField.horizontalPadding = TextFieldPadding;
        _usernameField.verticalPadding = TextFieldPadding;
        _usernameField.placeholder = @"用户名";
        _usernameField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _usernameField.delegate = self;
        _usernameField.returnKeyType = UIReturnKeyNext;
        _usernameField.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _usernameField;
}


-(LightTextField*)passwordField{
    if(_passwordField==nil){
        _passwordField=[[LightTextField alloc] initWithFrame:CGRectMake(CGRectGetMinX(_usernameField.frame), CGRectGetMaxY(_usernameField.frame), CGRectGetWidth(_usernameField.frame), CGRectGetHeight(_usernameField.frame))];
        _passwordField.background=[[UIImage imageNamed:@"operationbox_text"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ];
        _passwordField.horizontalPadding=TextFieldPadding;
        _passwordField.verticalPadding=TextFieldPadding;
        _passwordField.delegate=self;
        _passwordField.textAlignment=UIControlContentHorizontalAlignmentCenter;
        _passwordField.placeholder=@"密码";
        _passwordField.secureTextEntry=YES;
        _passwordField.returnKeyType=UIReturnKeyGo;
        _passwordField.clearButtonMode=UITextFieldViewModeWhileEditing;
    }
    return _passwordField;
}

-(UIButton *)registerButton{
    if(_registerButton == nil){
        _registerButton=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.usernameField.frame), CGRectGetMaxY(self.passwordField.frame)+4*VerticalSpacing, CGRectGetWidth(self.usernameField.frame), CGRectGetHeight(self.usernameField.frame))];
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateDisabled];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
        _registerButton.enabled = YES;
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(toRegister:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _registerButton;
}

-(void)toRegister:(id)sender{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    LightRegSexViewController *sex = [[LightRegSexViewController alloc]init];
    sex.userId = self.userId;
    sex.nickname = self.usernameField.text;
    sex.password = self.passwordField.text;
    [self.navigationController pushViewController:sex animated:YES];
}

-(void)closeKeyboard:(id)sender{
    [self.view endEditing:YES];
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
