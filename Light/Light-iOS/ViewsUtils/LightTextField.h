//
//  LightTextField.h
//  Light-iOS
//
//  Created by FLY on 15/5/30.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat kCDTextFieldCommonVerticalPadding=10;
static CGFloat kCDTextFieldCommonHorizontalPadding=10;


@interface LightTextField : UITextField

@property (nonatomic,assign)CGFloat verticalPadding;
@property (nonatomic,assign)CGFloat horizontalPadding;

@end
