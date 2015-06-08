//
//  LightTextField.m
//  Light-iOS
//
//  Created by FLY on 15/5/30.
//  Copyright (c) 2015年 Light. All rights reserved.
//

#import "LightTextField.h"

@implementation LightTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


// placeholder position

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , _horizontalPadding , _verticalPadding );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , _horizontalPadding , _verticalPadding );
}

@end
