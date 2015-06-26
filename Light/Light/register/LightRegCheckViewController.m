//
//  LightRegCheckViewController.m
//  
//
//  Created by FLY on 15/6/15.
//
//

#import "LightRegCheckViewController.h"
#import "LightTextField.h"
#import "LightRegDetailViewController.h"
#import "LightAPI.h"
#import "PostInfo.h"
#import "LightValidateCode.h"
#import <SMS_SDK/SMS_SDK.h>

@interface LightRegCheckViewController ()

@property (nonatomic,strong) UILabel *banner;
@property (nonatomic,strong) LightTextField *checkNum;
@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIButton *registerButton;


@end


@implementation LightRegCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds));
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeKeyboard:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tap];
    
    [self.view addSubview:self.backgroundImageView];
    [self.view addSubview:self.banner];
    [self.view addSubview:self.checkNum];
    [self.view addSubview:self.registerButton];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - about subviews
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
        _banner = [[UILabel alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4, CGRectGetWidth(self.checkNum.frame)/2, 10)];
        _banner.text = @"验证码:";
        _banner.textColor = [UIColor redColor];
        _banner.font = [UIFont systemFontOfSize:15];
        _banner.textAlignment=UIControlContentHorizontalAlignmentLeft;
    }
    return _banner;
}

-(LightTextField *)checkNum{
    if (_checkNum == nil){
        _checkNum = [[LightTextField alloc]initWithFrame:CGRectMake(HorizontalSpacing, CGRectGetHeight(self.view.frame)/4+4*VerticalSpacing, CGRectGetWidth(self.view.frame)-HorizontalSpacing*2, TextFieldHeight)];
        _checkNum.background=[[UIImage imageNamed:@"operationbox_text"]stretchableImageWithLeftCapWidth:10 topCapHeight:15];
        _checkNum.horizontalPadding = TextFieldPadding;
        _checkNum.verticalPadding = TextFieldPadding;
        _checkNum.returnKeyType = UIReturnKeyDefault;
        _checkNum.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _checkNum;
}

-(UIButton *)registerButton {
    if(_registerButton == nil){
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMinX(self.checkNum.frame)+CGRectGetWidth(self.checkNum.frame)/6, CGRectGetMaxY(self.checkNum.frame)+4*VerticalSpacing,CGRectGetWidth(self.checkNum.frame)*2/3 , TextFieldHeight)];
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

#pragma mark - Button Action


-(void)toRegister:(id)sender{
    NSLog(@"type is %@",self.type);
    if ([self.type isEqualToString:@"email"]){
        NSDictionary *registerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.userId,@"user_id",self.checkNum.text,@"val_code", nil];
        NSURL *url = [NSURL URLWithString:LIGHT_VALIDATE_URL];
        
        PostInfo *post = [[PostInfo alloc]init];
        
        [post postInfo:registerDictionary infourl:url];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(toEmailReg:) name:@"postResult" object:post.result];
         }
    else {
        [SMS_SDK commitVerifyCode:self.checkNum.text result:^(enum SMS_ResponseState state) {
            if (1==state)
            {
                NSLog(@"验证成功");
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
                LightRegDetailViewController *detail = [[LightRegDetailViewController alloc]init];
                detail.userId = self.userId;
                [self.navigationController pushViewController:detail animated:YES];
                
                
            }
            else if(0==state)
            {
                NSLog(@"验证失败");
                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"verifycodeerrormsg", nil)];
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"verifycodeerrortitle", nil)
                                                              message:str
                                                             delegate:self
                                                    cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                    otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
    }
}

-(void)toEmailReg:(NSNotification *)notification{
    id result = [notification object];
    NSLog(@"toEmail Result is %@",result);
    
    LightValidateCode *validate = [[LightValidateCode alloc]init];
    validate.result = [result[@"validate_result"] intValue];
    NSLog(@"validate is %lli",validate.result);
    
    if (validate.result == 1) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO];
        LightRegDetailViewController *detail = [[LightRegDetailViewController alloc]init];
        detail.userId = self.userId;
        [self.navigationController pushViewController:detail animated:YES];
    }else {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Wrong" message:@"您输入的手机号格式有误" delegate:self cancelButtonTitle:NSLocalizedString(@"返回", nil) otherButtonTitles:NSLocalizedString(@"确定",nil), nil];
        [alert show];
    }

}

#pragma mark - keyboard Action
-(void)closeKeyboard:(id)sender{
    [self.view endEditing:YES];
}

@end
