//
//  txtfldBorderandPadding.m
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/13/14.
//  Copyright (c) 2014 Vy Systems - iOS1. All rights reserved.
//

#import "txtfldBorderandPadding.h"

@implementation txtfldBorderandPadding

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    
    
    if (self)
    {
        
        
        
        
    }
    return self;
}
- (CGRect)textRectForBounds:(CGRect)bounds
{
    self.layer.borderColor=[[UIColor purpleColor]CGColor];
    self.layer.borderWidth=4.0;
    return CGRectInset( bounds, 10 , 0);
}
- (CGRect)editingRectForBounds:(CGRect)bounds{
    return CGRectInset( bounds, 10 , 0);
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end

