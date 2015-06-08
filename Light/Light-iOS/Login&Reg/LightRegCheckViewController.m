//
//  LightRegCheckViewController.m
//  Light-iOS
//
//  Created by FLY on 15/6/3.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "LightRegCheckViewController.h"
#import "LightTextField.h"
#import "LightRegDetailViewController.h"
#import <SMS_SDK/SMS_SDK.h>

#define CheckURL @"http://123.57.221.116:8080/light-server/intf/user/validate.shtml"


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
        _checkNum.delegate = self;
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

-(void)toRegister:(id)sender{
    [SMS_SDK commitVerifyCode:self.checkNum.text result:^(enum SMS_ResponseState state) {
        if (1==state)
        {
            NSLog(@"验证成功");
            [[UIApplication sharedApplication] setStatusBarHidden:NO];
            LightRegDetailViewController *detail = [[LightRegDetailViewController alloc]init];
            //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:check];
            //    [nav.navigationController release];
            //    [self presentViewController:nav animated:YES completion:nil];
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


/*
-(void)toRegister:(id)sender{
    NSDictionary *registerDictionary = [NSDictionary dictionaryWithObjectsAndKeys:self.userId,@"user_id",self.checkNum.text,@"val_code", nil];
    NSError * error;
    NSLog(@"registerDictionary is %@",registerDictionary);
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:registerDictionary options:NSJSONWritingPrettyPrinted error:&error];
    NSString *registerStr = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSLog(@"registerString is %@",registerStr);
    
    NSMutableData *tempJsonData = [NSMutableData dataWithData:jsonData];
    
    NSURL *url = [NSURL URLWithString:CheckURL];
    
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
                NSLog(error1);
            }
            else
            {
                
                NSError *err;
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
                NSString *valide_result = dic[@"validate_result"];
                NSLog(@"responseDictionary is %@",dic);
//                NSLog(valide_result);
                [[UIApplication sharedApplication] setStatusBarHidden:NO];
                LightRegDetailViewController *detail = [[LightRegDetailViewController alloc]init];
                    //    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:check];
                    //    [nav.navigationController release];
                    //    [self presentViewController:nav animated:YES completion:nil];
                detail.userId = self.userId;
                [self.navigationController pushViewController:detail animated:YES];

            }
        }else{
            NSLog(@"connection error");
        }
    }];

}
*/
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
