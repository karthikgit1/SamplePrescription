//
//  SecondViewController.h
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/11/14.
//  Copyright (c) 2014 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomIOS7AlertView.h"
@interface SecondViewController : UIViewController<CustomIOS7AlertViewDelegate>
{
    dispatch_queue_t downloadQueue1;
    UIAlertView *msgalert;
    
    UIImageView *gifView;
}
@property (weak, nonatomic) IBOutlet UIButton *btnshow;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd2;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd3;

@property (weak, nonatomic) IBOutlet UIButton *btnAdd1;

- (IBAction)showPath:(id)sender;

- (IBAction)addFirstImage:(id)sender;

- (IBAction)addSecondImage:(id)sender;

- (IBAction)addThirdImage:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *dataImageView;
@property (strong, nonatomic) IBOutlet UIImageView *urlImageView;
@property (strong, nonatomic) IBOutlet UIImageView *variableDurationImageView;

@end
