//
//  LightRegisterViewController.m
//  Light-iOS
//
//  Created by FLY on 15/5/31.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "LightRegisterViewController.h"
#import "LightTextField.h"
#import "LightRegCheckViewController.h"
#import <SMS_SDK/SMS_SDK.h>

#define RegisterURL @"http://123.57.221.116:8080/light-server/intf/user/register.shtml"

@interface LightRegisterViewController ()

@property (nonatomic,strong) UILabel *banner;
@property (nonatomic,strong) LightTextField *registerNum;
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIButton *continueButton;
@property (nonatomic,strong) UIButton *registerButton;
@property (nonatomic,strong) UIButton *haveAccountButton;

+(BOOL) validateEmail:(NSString *)registerStr;
@end

@implementation LightRegisterViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view.
    [self.view addSubview:self.backgroundImageView];

    [self.view addSubview:self.banner];
    [self.view addSubview:self.registerNum];
    [self.view addSubview:self.continueButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.haveAccountButton];
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

-(UILabel *)banner{
    if(_banner == nil){
//        _banner = [[UILabel alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4, _banner.text.length,TextFieldHeight/2)];
        _banner = [[UILabel alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4, CGRectGetWidth(self.registerNum.frame)/2, 10)];
        _banner.text = @"请输入手机号:";
        _banner.textColor = [UIColor redColor];
        _banner.font = [UIFont systemFontOfSize:15];
        _banner.textAlignment=UIControlContentHorizontalAlignmentLeft;
    }
    return _banner;
}

-(LightTextField *)registerNum{
    if (_registerNum == nil){
        _registerNum = [[LightTextField alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4+4*VerticalSpacing, CGRectGetWidth(self.view.frame)-HorizontalSpacing*2, TextFieldHeight)];
        _registerNum.background=[[UIImage imageNamed:@"operationbox_text"]stretchableImageWithLeftCapWidth:10 topCapHeight:15];
        _registerNum.horizontalPadding = TextFieldPadding;
        _registerNum.verticalPadding = TextFieldPadding;
        _registerNum.delegate = self;
        _registerNum.returnKeyType = UIReturnKeyDefault;
        _registerNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _registerNum;
}

-(UIButton *)continueButton {
    if(_continueButton == nil){
        _continueButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _continueButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.registerNum.frame)+CGRectGetWidth(self.registerNum.frame)/6, CGRectGetMaxY(self.registerNum.frame)+4*VerticalSpacing,CGRectGetWidth(self.registerNum.frame)*2/3 , TextFieldHeight)];
        [_continueButton setTitle:@"继续" forState:UIControlStateNormal];
        [_continueButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
        [_continueButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateDisabled];
        [_continueButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
        /*
        if([self.banner.text isEqualToString:@"请输入电子邮箱:"]){
            if ([LightRegisterViewController validateEmail:self.registerNum.text]) {
                _continueButton.tag = 1;
                _continueButton.enabled = YES;
            }else{
                if(![self.registerNum.text isEqualToString:@""]){
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Wrong" message:@"您输入的邮箱格式有误" delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", nil) otherButtonTitles:NSLocalizedString(@"sure",nil), nil];
                    [alert show];
                }
            }
        }else{
            if([LightRegisterViewController validatePhone:self.registerNum.text]){
                _continueButton.tag = 2;
                _continueButton.enabled = YES;
            }else{
                if(![self.registerNum.text isEqualToString:@""]){
                    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Wrong" message:@"您输入的邮箱格式有误" delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", nil) otherButtonTitles:NSLocalizedString(@"sure",nil), nil];
                    [alert show];
                }
            }
            
        }
         */
        _continueButton.enabled=YES;
        [_continueButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_continueButton addTarget:self action:@selector(toContinue:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _continueButton;
}



-(UIButton *)registerButton{
    if(_registerButton == nil){
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.registerNum.frame)+CGRectGetWidth(self.registerNum.frame)/6, CGRectGetMaxY(self.continueButton.frame)+VerticalSpacing,CGRectGetWidth(self.registerNum.frame)*2/3 , TextFieldHeight)];
        if(_registerButton.tag != 1){
            [_registerButton setTitle:@"使用电子邮箱注册" forState:UIControlStateNormal];
            _registerButton.tag = 1;
        }else{
            [_registerButton setTitle:@"使用手机号注册" forState:UIControlStateNormal];
            _registerButton.tag = 2;
        }
        NSLog(_registerButton.titleLabel.text);
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_normal"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_disable"] stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateDisabled];
        [_registerButton setBackgroundImage:[[UIImage imageNamed:@"blue_login_highlight"]stretchableImageWithLeftCapWidth:10 topCapHeight:15 ] forState:UIControlStateHighlighted];
        
        _registerButton.enabled = YES;
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];

        [_registerButton addTarget:self action:@selector(changeType:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}


-(UIButton *)haveAccountButton{
    if(_haveAccountButton == nil){
        _haveAccountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _haveAccountButton= [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.registerNum.frame)+CGRectGetWidth(self.registerNum.frame)/4, CGRectGetHeight(self.view.frame)-4*TextFieldHeight, CGRectGetWidth(self.registerNum.frame)/2, TextFieldHeight)];
        [_haveAccountButton setTitleColor:RGBCOLOR(0, 137, 167) forState:UIControlStateNormal];
        [_haveAccountButton setTitle:@"我已经有账号了" forState:UIControlStateNormal];
        _haveAccountButton.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _haveAccountButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        _haveAccountButton.enabled = YES;
        [_haveAccountButton addTarget:self action:@selector(haveAccount:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _haveAccountButton;
}

+(BOOL) validateEmail:(NSString *)registerStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if([emailTest evaluateWithObject:registerStr]){
        return YES;
    }
    else{
        return NO;
    }
}

+(BOOL) validatePhone:(NSString *)registerStr
{
    NSString *phoneRegex = @"^[1][3,4,5,7,8][0-9]{9}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    if([phoneTest evaluateWithObject:registerStr]){
        return YES;
    }
    else{
        return NO;
    }
}

-(void)toContinue:(UIButton *) type{
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    if([self.banner.text isEqualToString:@"请输入电子邮箱:"]){
        if ([LightRegisterViewController validateEmail:self.registerNum.text]) {
            _continueButton.tag = 1;
        }else{
            if(![self.registerNum.text isEqualToString:@""]){
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Wrong" message:@"您输入的邮箱格式有误" delegate:self cancelButtonTitle:NSLocalizedString(@"返回", nil) otherButtonTitles:NSLocalizedString(@"确定",nil), nil];
                [alert show];
            }
        }
    }else{
        if([LightRegisterViewController validatePhone:self.registerNum.text]){
            _continueButton.tag = 2;
        }else{
            if(![self.registerNum.text isEqualToString:@""]){
                UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Wrong" message:@"您输入的手机号格式有误" delegate:self cancelButtonTitle:NSLocalizedString(@"返回", nil) otherButtonTitles:NSLocalizedString(@"确定",nil), nil];
                [alert show];
            }
        }
    }
    
    LightRegCheckViewController *check = [[LightRegCheckViewController alloc]init];
    NSDictionary *registerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.registerNum.text,@"code", nil];
    NSError * error;
    NSLog(@"registerDictionary is %@",registerDictionary);
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:registerDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *registerStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"registerString is %@",registerStr);
    
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    
    NSURL *url = [NSURL URLWithString:RegisterURL];
    
    NSMutableURLRequest *requst = [NSMutableURLRequest requestWithURL:url];
    
    [requst setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requst setHTTPMethod:@"POST"];
    [requst setHTTPBody:tempJsonData];
    NSOperationQueue *queue = [NSOperationQueue mainQueue];
    [NSURLConnection sendAsynchronousRequest:requst queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSString *jsonDate = [dateFormatter stringFromDate:[NSDate date]];
        NSLog(@"获取json的时间：%@",jsonDate);
        if(data){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSString *error1 = dict[@"error"];
            if(!error1){
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                NSString *userId = dic[@"user_id"];
                
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
                
                if(type.tag == 1){

                    check.userId = userId;
                    check.type= @"email";
                    [self.navigationController pushViewController:check animated:YES];
                }
                else{
                    NSString *getBegin = [dateFormatter stringFromDate:[NSDate date]];
                    NSLog(@"获得验证码的时间:%@",getBegin);
                    NSLog(@"开始请求手机验证码时间：%@",getBegin);

                    [SMS_SDK getVerificationCodeBySMSWithPhone:self.registerNum.text zone:@"86" result:^(SMS_SDKError *error) {
                        if(!error){
                            NSString *getCheckNum = [dateFormatter stringFromDate:[NSDate date]];
                            NSLog(@"获得验证码的时间:%@",getCheckNum);
                            [[UIApplication sharedApplication] setStatusBarHidden:NO];
                            check.userId = userId;
                            check.type = @"phone";
                            [self.navigationController pushViewController:check animated:YES];
                        }
                    }];
                }
            }
        }
    }];
    

}

-(void)haveAccount:(id)sender{
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    LightLoginViewController *log = [[LightLoginViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:log];
    [nav setNavigationBarHidden:YES];
    [self.navigationController release];
    
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)changeType:(UIButton *) type{
    if(type.tag == 1){
        self.banner.text=@"请输入电子邮箱:";
        [self.registerButton setTitle:@"使用手机号注册" forState:UIControlStateNormal];
        self.registerButton.tag = 2;
    }else{
        self.banner.text=@"请输入手机号:";
        [self.registerButton setTitle:@"使用电子邮箱注册" forState:UIControlStateNormal];
        self.registerButton.tag = 1;
    }
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
