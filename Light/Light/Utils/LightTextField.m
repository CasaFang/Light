//
//  LightTextField.m
//  
//
//  Created by FLY on 15/6/15.
//
//

#import "LightTextField.h"

@implementation LightTextField

// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , _horizontalPadding , _verticalPadding );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , _horizontalPadding , _verticalPadding );
}

@end
