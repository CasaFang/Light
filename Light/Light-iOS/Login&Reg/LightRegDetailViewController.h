//
//  LightRegDetailViewController.h
//  Light-iOS
//
//  Created by FLY on 15/6/3.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LightLoginViewController.h"
#define USERNAME_MIN_LENGTH 3
#define PASSWORD_MIN_LENGTH 3
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

static CGFloat defaultHeaderMarginTop = 80;
static CGFloat defaultHeaderSize = 80;


@interface LightRegDetailViewController : UIViewController

@property (nonatomic) NSString *userId;


@end
