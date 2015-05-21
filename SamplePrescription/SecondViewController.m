//
//  SecondViewController.m
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 9/11/14.
//  Copyright (c) 2014 Vy Systems - iOS1. All rights reserved.
//

#import "SecondViewController.h"
#import "UIImage+animatedGIF.h"

#import "Reachability.h"
@interface SecondViewController ()
#define DOCUMENTS_FOLDER [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]

@end

@implementation SecondViewController
@synthesize dataImageView;
@synthesize urlImageView;

Reachability *internetReachableFoo;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Title";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showPath:(id)sender
{
    
    internetReachableFoo = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    // Internet is reachable
    internetReachableFoo.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Yayyy, we have the interwebs!");
        });
    };
    
    // Internet is not reachable
    internetReachableFoo.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"Someone broke the internet :(");
            
            
            // NSString  *recorderFilePath = [NSString stringWithFormat:@"%@/MySound.caf", DOCUMENTS_FOLDER] ;
            
            NSString *dataPath = [DOCUMENTS_FOLDER stringByAppendingPathComponent:@"/MyFolder"];
            
            // NSLog(@"Path is %@",recorderFilePath );
            
            NSError *err;
            NSArray *dirContents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath: dataPath error:&err];
            
            NSLog(@"dir contents is %@",dirContents);
            
            if(err == nil)
            {
                for (NSString *tString in dirContents)
                {
                    if ([tString isEqualToString:@"MySound.caf"])
                    {
                        [[NSFileManager defaultManager]removeItemAtPath:[NSString stringWithFormat:@"%@/%@",DOCUMENTS_FOLDER,tString] error:nil];
                        
                    }
                    else
                    {
                        NSLog(@".caf file not found");
                    }
                    
                    if ([tString isEqualToString:@"MySound11.caf"])
                    {
                        [[NSFileManager defaultManager]removeItemAtPath:[NSString stringWithFormat:@"%@/%@",DOCUMENTS_FOLDER,tString] error:nil];
                        
                    }
                    else
                    {
                        NSLog(@"MySound11.caf file not found");
                    }
                    
                    //**********To Delete ***********
                    // [[NSFileManager defaultManager]removeItemAtPath:[NSString stringWithFormat:@"%@/%@",DOCUMENTS_FOLDER,tString] error:nil];
                }
            }
            else
            {
                NSLog(@"Error is %@",err);
            }
        });
    };
    
    [internetReachableFoo startNotifier];
    
    
   
    

}
- (IBAction)addFirstImage:(id)sender
{
    /*
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [NSThread sleepForTimeInterval:10];
    NSData *pngData = UIImagePNGRepresentation([UIImage imageNamed:@"icon-120.png"]);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
    
    NSString *dataPath = [documentsPath stringByAppendingPathComponent:@"/MyFolder"];
    
    NSError *error;
    if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
    {
         [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
    }
    
    
    NSString *filePath = [dataPath stringByAppendingPathComponent:@"image.png"]; //Add the file name
    [pngData writeToFile:filePath atomically:YES]; //Write the file
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    */
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    msgalert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please wait image is uploading....  " delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
    
    msgalert.tag = 101;
    //[msgalert show];
    downloadQueue1 = dispatch_queue_create("downloader", NULL);
    
    [self showGifLoader];
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle: @ "Alert"
                                                     message: @ ""
                                                    delegate: nil
                                           cancelButtonTitle: nil
                                           otherButtonTitles: nil];
    
    alert.delegate = self;
    
    //Show activity indicator in alertview
    /*
    UIActivityIndicatorView * indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    
   
    
    indicator.center = CGPointMake ((self.view.bounds.size.width / 2) - 20, (self.view.bounds.size.height / 2) - 130);
    [indicator startAnimating];
    
    [alert setValue: indicator forKey: @ "accessoryView"];
    [alert show];
    */
    dispatch_async(downloadQueue1, ^{
        
        

        
        self.view.userInteractionEnabled = NO;
        
        [NSThread sleepForTimeInterval:10];
        
        NSData *pngData = UIImagePNGRepresentation([UIImage imageNamed:@"IMG_0794.jpg"]);
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = [paths objectAtIndex:0]; //Get the docs directory
        
        NSString *dataPath = [documentsPath stringByAppendingPathComponent:@"/MyFolder"];
        
        NSError *error;
        if (![[NSFileManager defaultManager] fileExistsAtPath:dataPath])
        {
            [[NSFileManager defaultManager] createDirectoryAtPath:dataPath withIntermediateDirectories:NO attributes:nil error:&error]; //Create folder
        }
        
        
        NSString *filePath = [dataPath stringByAppendingPathComponent:@"image.png"]; //Add the file name
        [pngData writeToFile:filePath atomically:YES]; //Write the file
        

        UIImage *img;
         
         CGSize targetSize;
         
         UIImage *aimage;
         
        aimage = [UIImage imageNamed:@"icon-120.png"];
        
        targetSize.height = 100;
        targetSize.width = 100;
        
        img = [self scaleImage:aimage toSize:targetSize];

        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            self.view.userInteractionEnabled = YES;
            
            [msgalert dismissWithClickedButtonIndex:0 animated:YES];

            [self closeGifLoader];
            
            //[alert ];
            [alert dismissWithClickedButtonIndex:0 animated:YES];
        });
        
    });
}

///BBBBB Check scale image
- (UIImage*) scaleImage:(UIImage*)image toSize:(CGSize)newSize
{
    
    UIGraphicsBeginImageContextWithOptions( newSize, NO, 0.0 );
    CGRect scaledImageRect = CGRectMake( 0.0, 0.0, newSize.width, newSize.height );
    [image drawInRect:scaledImageRect];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}


-(IBAction)addSecondImage:(id)sender
{
    NSData *imgData1 = UIImagePNGRepresentation([UIImage imageNamed:@"imageNamed:icon-120"]);
    NSLog(@"1.0 size: %d", imgData1.length);
    
    NSData *imgData2 = UIImageJPEGRepresentation([UIImage imageNamed:@"imageNamed:IMG_0794.jpg" ], 0.7f);
    NSLog(@"0.7 size: %d", imgData2.length);
}

-(IBAction)addThirdImage:(id)sender
{
    /*
    // Here we need to pass a full frame
    CustomIOS7AlertView *alertView = [[CustomIOS7AlertView alloc] init];
    
    // Add some custom content to the alert view
    [alertView setContainerView:[self createDemoView]];
    
    // Modify the parameters
   // [alertView setButtonTitles:[NSMutableArray arrayWithObjects:@"Close1", @"Close2", @"Close3", nil]];
    [alertView setDelegate:self];
    
    // You may use a Block, rather than a delegate.
    [alertView setOnButtonTouchUpInside:^(CustomIOS7AlertView *alertView, int buttonIndex) {
        NSLog(@"Block: Button at position %d is clicked on alertView %d.", buttonIndex, (int)[alertView tag]);
        [alertView close];
    }];
    
    [alertView setUseMotionEffects:true];
    
    // And launch the dialog
    [alertView show];
    
    */
    
   
}

-(void)showGifLoader
{
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"gif"];
    
    
    
    gifView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 30, 30)];
    
    gifView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    
    
    [self.view addSubview:gifView];

}

-(void)closeGifLoader
{
    [gifView removeFromSuperview];
}

- (UIView *)createDemoView
{
    
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"gif"];
    self.dataImageView.image = [UIImage animatedImageWithAnimatedGIFData:[NSData dataWithContentsOfURL:url]];
    self.urlImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    
    //url = [[NSBundle mainBundle] URLForResource:@"variableDuration" withExtension:@"gif"];
    
    //self.variableDurationImageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    
    
    UIView *demoView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 290, 200)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    
    imageView.image = [UIImage animatedImageWithAnimatedGIFURL:url];
    
    //[imageView setImage:[UIImage imageNamed:@"demo"]];
    [demoView addSubview:imageView];
    
    
    return demoView;
}

- (void)willPresentAlertView:(UIAlertView *)alertView {
     [alertView setFrame:CGRectMake(1, 20, 170, 100)];
}

@end
