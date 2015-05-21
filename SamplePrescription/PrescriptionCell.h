//
//  PrescriptionCell.h
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/1/14.
//  Copyright (c) 2014 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TableCellDelegate<NSObject>
@optional
- (void)deleteButtonTappedOnCell:(id)sender;
@end
@interface PrescriptionCell : UITableViewCell
{
}

@property (nonatomic,weak) IBOutlet UIButton *btn1;

@property(nonatomic,weak) IBOutlet UITextField *txtDrugName;

@property (nonatomic, weak) id <TableCellDelegate> delegate;
-(IBAction)BtnTapped:(id)sender;
@end


