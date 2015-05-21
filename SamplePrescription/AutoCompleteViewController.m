//
//  AutoCompleteViewController.m
//  SamplePrescription
//
//  Created by Vy Systems - iOS1 on 1/7/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "AutoCompleteViewController.h"

#import "AutocompletionTableView.h"
@interface AutoCompleteViewController ()
@property (nonatomic, strong) AutocompletionTableView *autoCompleter;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation AutoCompleteViewController

@synthesize textField = _textField;
@synthesize autoCompleter = _autoCompleter;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     [self.textField addTarget:self.autoCompleter action:@selector(textFieldValueChanged:) forControlEvents:UIControlEventEditingChanged];
    
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (AutocompletionTableView *)autoCompleter
{
    if (!_autoCompleter)
    {
        NSMutableDictionary *options = [NSMutableDictionary dictionaryWithCapacity:2];
        [options setValue:[NSNumber numberWithBool:YES] forKey:ACOCaseSensitive];
        [options setValue:nil forKey:ACOUseSourceFont];
        
        _autoCompleter = [[AutocompletionTableView alloc] initWithTextField:self.textField inViewController:self withOptions:options];
        _autoCompleter.autoCompleteDelegate = self;
        //_autoCompleter.suggestionsDictionary = [NSArray arrayWithObjects:@"hostel",@"caret",@"carrot",@"house",@"horse",@"aacc",@"c12",@"c5656",@"dffgc", nil];
    }
    return _autoCompleter;
}

#pragma mark - AutoCompleteTableViewDelegate

- (NSArray*) autoCompletion:(AutocompletionTableView*) completer suggestionsFor:(NSString*) string{
    // with the prodided string, build a new array with suggestions - from DB, from a service, etc.
    return [NSArray arrayWithObjects:@"hostel",@"caret",@"carrot",@"house",@"horse",@"aacc",@"c12",@"c5656",@"dffgc", nil];
}

- (void) autoCompletion:(AutocompletionTableView*) completer didSelectAutoCompleteSuggestionWithIndex:(NSInteger) index
{
    // invoked when an available suggestion is selected
    NSLog(@" - Suggestion chosen: %@", _textField.text);
}

@end
