//
//  LightLoginViewController.m
//  
//
//  Created by FLY on 15/6/15.
//
//

#import "LightLoginViewController.h"
#import "LightAPI.h"
#import "PostUser.h"
#import "LightUser.h"
#import "LightRegisterViewController.h"
#import "AppDelegate.h"

@interface LightLoginViewController () <UITextFieldDelegate,LightLoginDelegate>

@property (nonatomic,assign) CGPoint originOffset;
@property (nonatomic,strong) UIButton *loginButton;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) UIButton *forgotPasswordButton;

@end

@implementation LightLoginViewController

#pragma mark － actions
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.forgotPasswordButton];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _originOffset = self.view.frame.origin;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 控件
-(UIImageView *)backgroundImageView{
    if(_backgroundImageView==nil){
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.view.frame];
        _backgroundImageView.image = [UIImage imageNamed:@"login_background"];
    }
    return _backgroundImageView;
}

-(UIImageView*)iconImageView{
    if(_iconImageView==nil){
        _iconImageView=[[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.frame)-IconImageViewSize/2, IconImageViewMarginTop, IconImageViewSize, IconImageViewSize)];
        _iconImageView.image=[UIImage imageNamed:@"default_icon"];
    }
    return _iconImageView;
}

-(LightTextField*)usernameField{
    if(_usernameField==nil){
        _usernameField = [[LightTextField alloc] initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetMaxY(_iconImageView.frame)+UsernameFieldMarginTop, CGRectGetWidth(self.view.frame)-HorizontalSpacing*2, TextFieldHeight)];
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

-(UIButton *)loginButton{
    if(_loginButton == nil){
        _loginButton=[[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.usernameField.frame), CGRectGetMaxY(self.passwordField.frame)+4*VerticalSpacing, CGRectGetWidth(self.usernameField.frame), CGRectGetHeight(self.usernameField.frame))];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateDisabled];
        [_loginButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
        _loginButton.enabled = YES;
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginButton;
}

-(UIButton *)registerButton{
    if(_registerButton == nil){
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton= [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.usernameField.frame)+CGRectGetWidth(self.usernameField.frame)/4, CGRectGetHeight(self.view.frame)-2*TextFieldHeight, CGRectGetWidth(self.usernameField.frame)/2, TextFieldHeight)];
        [_registerButton setTitleColor:RGBCOLOR(0, 137, 167) forState:UIControlStateNormal];
        [_registerButton setTitle:@"还没注册?" forState:UIControlStateNormal];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:16];
        //        _registerButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _registerButton.enabled = YES;
        [_registerButton addTarget:self action:@selector(toRegister:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}

-(UIButton *)forgotPasswordButton{
    if(_forgotPasswordButton == nil){
        _forgotPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgotPasswordButton=[[UIButton alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetMaxY(self.passwordField.frame), CGRectGetWidth(self.usernameField.frame)/4, CGRectGetHeight(self.usernameField.frame)/2)];
        [_forgotPasswordButton setTitle:@"忘记密码?" forState:UIControlStateNormal];
        _forgotPasswordButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_forgotPasswordButton setTitleColor:RGBCOLOR(0, 137, 167) forState:UIControlStateNormal];
        _forgotPasswordButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        [_forgotPasswordButton addTarget:self action:@selector(toFindPassword:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgotPasswordButton;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if(textField == self.usernameField){
        [self.passwordField becomeFirstResponder];
    }else if(textField == self.passwordField){
        [self didPasswordTextFieldReturn:(LightTextField*)textField];
    }
    return YES;
}

-(void)didPasswordTextFieldReturn:(LightTextField*)passwordField{
    // subclass
}

-(void)closeKeyboard:(id)sender{
    [self.view endEditing:YES];
}

#pragma mark - button actions

-(void)login:(id)sender {

    NSDictionary *userDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.usernameField.text,@"code",self.passwordField.text,@"pwd", nil];
    PostUser *post = [[PostUser alloc]init];
    
    [post postUserInfo:userDictionary infourl:[NSURL URLWithString:LIGHT_LOGIN_URL]];
    
    LightUser *user = [[LightUser alloc]init];
    
    user.userID = [post.result[@"id"] intValue];
    user.name = post.result[@"name"];
    user.avatar = post.result[@"avatar"];
    user.physiology_gender = post.result[@"physiology_gender"];
    user.society_gender = post.result[@"physiology_gender"];
    
    AppDelegate * delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate toMain];
}


-(void)toRegister:(id)sender{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    LightRegisterViewController *reg = [[LightRegisterViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:reg];
    [nav setNavigationBarHidden:YES];
    
    [self presentViewController:nav animated:YES completion:nil];
}


-(void)changeButtonState{
    if(self.usernameField.text.length>=USERNAME_MIN_LENGTH && self.passwordField.text.length>=PASSWORD_MIN_LENGTH){
        self.loginButton.enabled = YES;
    }else{
        self.loginButton.enabled = NO;
    }
}

-(void)textFieldDidChange:(UITextField *)textField{
    [self changeButtonState];
}

@end
