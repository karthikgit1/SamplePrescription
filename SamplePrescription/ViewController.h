//
//  ViewController.h
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/1/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PrescriptionCell.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TableCellDelegate>
{
    IBOutlet UITableView *tv1;
    
    int totalrows;
    
    NSMutableArray *insertIndexPaths;
    
    IBOutlet UIButton *btnadd,*btnsubmit;
}

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

-(IBAction)addRows:(id)sender;
-(IBAction)submitPrescription:(id)sender;

@end
