//
//  ViewController.m
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/1/14.
//  Copyright (c) 2014 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.title = @"Test";
	// Do any additional setup after loading the view, typically from a nib.
    
    totalrows = 1;
    //totalrows = totalrows + 1;
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                      attribute:NSLayoutAttributeLeading
                                                                      relatedBy:0
                                                                         toItem:self.view
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1.0
                                                                       constant:0];
    [self.view addConstraint:leftConstraint];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self.contentView
                                                                       attribute:NSLayoutAttributeTrailing
                                                                       relatedBy:0
                                                                          toItem:self.view
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1.0
                                                                        constant:0];
    [self.view addConstraint:rightConstraint];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    
}

- (void) keyboardDidShow:(NSNotification *)notification
{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        NSDictionary* info = [notification userInfo];
        CGRect kbRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        kbRect = [self.view convertRect:kbRect fromView:nil];
        
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbRect.size.height, 0.0);
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
        
        CGRect aRect = self.view.frame;
        aRect.size.height -= kbRect.size.height;

    }
    else
    {
        NSDictionary* info = [notification userInfo];
        CGRect kbRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
        kbRect = [self.view convertRect:kbRect fromView:nil];
        
        UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, 700, 0.0);
        self.scrollView.contentInset = contentInsets;
        self.scrollView.scrollIndicatorInsets = contentInsets;
        
        CGRect aRect = self.view.frame;
        aRect.size.height -= kbRect.size.height;

    }
    
}

- (void) keyboardWillBeHidden:(NSNotification *)notification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"total rows is %d",totalrows);
    return totalrows;
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"PrescriptionCell";
    
    // Similar to UITableViewCell, but
    PrescriptionCell *cell = (PrescriptionCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        cell = [[PrescriptionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Just want to test, so I hardcode the data
   // cell.descriptionLabel.text = @"Testing";
    //cell.delegate = self;
    
    cell.delegate = self;
    return cell;
}


/*
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
	
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 50.0)];
    sectionHeaderView.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(addMoreAction:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = CGRectMake(40.0, 5.0, 80.0, 40.0);
   
    
    UIButton *btnadd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnadd addTarget:self
               action:@selector(addData:)
     forControlEvents:UIControlEventTouchUpInside];
    [btnadd setTitle:@"Add" forState:UIControlStateNormal];
    btnadd.frame = CGRectMake(120.0, 5.0, 60.0, 40.0);
   
    [sectionHeaderView addSubview:btnadd];
    [sectionHeaderView addSubview:button];
    
    
    return sectionHeaderView;
}

*/

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
    UIView *sectionHeaderView = [[UIView alloc] initWithFrame:
                                 CGRectMake(0, 0, tableView.frame.size.width, 40.0)];
    sectionHeaderView.backgroundColor = [UIColor grayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(addMoreAction:)
     forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"Show View" forState:UIControlStateNormal];
    button.frame = CGRectMake(40.0, 0.0, 80.0, 30.0);
    
    
    UIButton *btnadd = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btnadd addTarget:self
               action:@selector(addData:)
     forControlEvents:UIControlEventTouchUpInside];
    [btnadd setTitle:@"Add" forState:UIControlStateNormal];
    btnadd.frame = CGRectMake(120.0, 0.0, 60.0, 30.0);
    
    [sectionHeaderView addSubview:btnadd];
    [sectionHeaderView addSubview:button];
    
    
    return sectionHeaderView;
}


-(void)addData:(id)sender
{
    for(int i=0;i<totalrows;i++)
    {
        UITableViewCell *cell = [tv1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
        UITextField *txtField = (UITextField*)[cell viewWithTag:10];
        
        NSLog(@"string is %@",txtField.text);
    }
   
    
   // NSLog(@"cell is %@",cell);
}

-(void)addMoreAction:(id)sender
{
    NSLog(@"button clicked");
    
    insertIndexPaths = [[NSMutableArray alloc]init];
    
    [insertIndexPaths addObject:[NSIndexPath indexPathForRow:totalrows inSection:0]];
    
    NSLog(@"insertIndexPaths is %@",insertIndexPaths);
    totalrows = totalrows +1 ;
    
    [tv1 beginUpdates];
    [tv1 insertRowsAtIndexPaths:insertIndexPaths
                     withRowAnimation:UITableViewRowAnimationAutomatic];
    [tv1 endUpdates];
    
    [tv1 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:totalrows-1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
    
}


- (void)deleteButtonTappedOnCell:(id)sender
{
    NSIndexPath *indexpath = [tv1 indexPathForCell:sender];
    
    NSLog(@"Row is %d",indexpath.row);
    
    NSMutableArray *deleteindexpath = [[NSMutableArray alloc]init];
    
    //insertIndexPaths = [[NSMutableArray alloc]init];
    
    [deleteindexpath addObject:[NSIndexPath indexPathForRow:indexpath.row inSection:0]];

    
       totalrows = totalrows - 1 ;
    
    [tv1 beginUpdates];
    [tv1 deleteRowsAtIndexPaths:deleteindexpath
               withRowAnimation:UITableViewRowAnimationAutomatic];
    [tv1 endUpdates];
    
    [tv1 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:totalrows-1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
    
   
    
}

-(IBAction)addRows:(id)sender
{
    NSLog(@"button clicked");
    
    insertIndexPaths = [[NSMutableArray alloc]init];
    
    [insertIndexPaths addObject:[NSIndexPath indexPathForRow:totalrows inSection:0]];
    
    //NSLog(@"insertIndexPaths is %@",insertIndexPaths);
    totalrows = totalrows +1 ;
    
    [tv1 beginUpdates];
    [tv1 insertRowsAtIndexPaths:insertIndexPaths
               withRowAnimation:UITableViewRowAnimationAutomatic];
    [tv1 endUpdates];
    
    [tv1 scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:totalrows-1 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:NO];
}

-(IBAction)submitPrescription:(id)sender
{
     //NSIndexPath *indepath = [tv1 indexPathForCell:sender];
    
    UITableViewCell *cell = [tv1 cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    
    NSLog(@"cell is %@",cell);
    
}


@end
