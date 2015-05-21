//
//  txtfldBorderandPadding.h
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/13/14.
//  Copyright (c) 2014 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface txtfldBorderandPadding : UITextField
{
    
}

- (CGRect)editingRectForBounds:(CGRect)bounds;
- (CGRect)textRectForBounds:(CGRect)bounds;

@end