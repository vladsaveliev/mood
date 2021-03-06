//
//  AskViewController.m
//  MooDBall
//
//  Created by Mariia Fofanova on 24.11.12.
//  Copyright (c) 2012 Mariia Fofanova. All rights reserved.
//

#import "AskViewController.h"
#import "MazeListViewController.h"

@implementation AskViewController
@synthesize delegate;

@synthesize managedObjectContext;

- (void)viewDidLoad {
    [super viewDidLoad];

    moods = [[NSMutableArray alloc] init];
    [moods addObject:@"happy"];
    [moods addObject:@"sad"];
    [moods addObject:@"normal"];
    [moods addObject:@"angry"];
    mood = [moods objectAtIndex:0];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return [moods count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [moods objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    mood = [moods objectAtIndex:row];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"start"]) {        
        UINavigationController *navigationController = segue.destinationViewController;
        MazeListViewController *controller = (MazeListViewController *)(navigationController.topViewController);
        controller.managedObjectContext = self.managedObjectContext;
        controller.delegate = self;
        controller.mood = mood;
    }
}

#pragma mark - ViewControllerDelegate
- (void)viewControllerDidCancel:
        (ViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
