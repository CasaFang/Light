//
//  LightLoginViewController.h
//  
//
//  Created by FLY on 15/6/15.
//
//

#import <UIKit/UIKit.h>
#import "LightTextField.h"

#define KEY_USERNAME @"KEY_USERNAME"
#define USERNAME_MIN_LENGTH 3
#define PASSWORD_MIN_LENGTH 3
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

static CGFloat IconImageViewMarginTop = 80;
static CGFloat IconImageViewSize = 80;
static CGFloat HorizontalSpacing = 30;
static CGFloat VerticalSpacing = 10;
static CGFloat UsernameFieldMarginTop = 30;
static CGFloat TextFieldPadding = 10;
static CGFloat TextFieldHeight = 40;

@protocol LightLoginDelegate <NSObject>

- (void) didPasswordTextFieldReturn : (LightTextField*) passwordField;
- (void) textFieldDidChange : (UITextField*)textField;

@end

@interface LightLoginViewController : UIViewController

@property (nonatomic,strong) UIImageView *backgroundImageView;
@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) LightTextField *usernameField;
@property (nonatomic,strong) LightTextField *passwordField;

@end
